# Screen Off Monitor - Background monitor for display wake events
# Function: Detect if monitor is waked, log the cause, re-close once and exit

param(
    [string]$LogPath = "$PSScriptRoot\screen-off.log"
)

# Import Win32 API
$User32AddType = @"
using System;
using System.Runtime.InteropServices;

public class User32 {
    [DllImport("user32.dll")]
    public static extern bool BlockInput(int fBlockIt);

    [DllImport("user32.dll")]
    public static extern int GetForegroundWindow();

    [DllImport("user32.dll")]
    public static extern int GetWindowThreadProcessId(int hWnd, out int lpdwProcessId);

    [DllImport("user32.dll")]
    public static extern bool GetLastInputInfo(ref LASTINPUTINFO plii);

    [StructLayout(LayoutKind.Sequential)]
    public struct LASTINPUTINFO {
        public uint cbSize;
        public uint dwTime;
    }
}
"@

try {
    Add-Type -TypeDefinition $User32AddType -ErrorAction Stop
} catch {
    # Type already exists, ignore
}

# Log function
function Write-Log {
    param([string]$Message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "$timestamp - $Message"
    Add-Content -Path $LogPath -Value $logEntry -Encoding UTF8
}

# Get foreground window process name
function Get-ForegroundProcessName {
    try {
        $hWnd = [User32]::GetForegroundWindow()
        if ($hWnd -ne 0) {
            $procId = 0
            [User32]::GetWindowThreadProcessId($hWnd, [ref]$procId)
            if ($procId -ne 0) {
                $process = Get-Process -Id $procId -ErrorAction SilentlyContinue
                if ($process) {
                    return $process.ProcessName
                }
            }
        }
    } catch {}
    return "Unknown"
}

# Detect new input event
function Test-NewInputEvent {
    $lastInput = New-Object User32+LASTINPUTINFO
    $lastInput.cbSize = [System.Runtime.InteropServices.Marshal]::SizeOf($lastInput)

    if ([User32]::GetLastInputInfo([ref]$lastInput)) {
        $lastInputTime = $lastInput.dwTime
        $currentTickCount = [Environment]::TickCount
        $idleTime = $currentTickCount - $lastInputTime

        # If idle time less than 500ms, there's recent input
        return $idleTime -lt 500
    }
    return $false
}

# Close monitor
function Close-Monitor {
    powershell -ExecutionPolicy Bypass -WindowStyle Hidden -Command `
        "Add-Type '[DllImport(`"user32.dll`")]public static extern int SendMessage(int hWnd,int Msg,int wParam,int lParam);' -Name User32 -Namespace Win32; `
         [Win32.User32]::SendMessage(0xFFFF, 0x0112, 0xF170, 2)" 2>$null
}

# Main monitor loop
Write-Log "========================================="
Write-Log "Screen Off Monitor started (single-use mode)"
Write-Log "Log file: $LogPath"
Write-Log "========================================="

$wakeDetected = $false
$checkInterval = 1000  # Check interval in milliseconds

try {
    while ($true) {
        Start-Sleep -Milliseconds $checkInterval

        # Check for user input (most reliable indicator of screen wake)
        if (Test-NewInputEvent) {
            # Brief delay to confirm not false detection
            Start-Sleep -Milliseconds 500

            if (Test-NewInputEvent) {
                # Confirm input detected, log it
                $currentProcess = Get-ForegroundProcessName

                Write-Log "Monitor WAKED at $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - Cause: $currentProcess"

                # Disable input to prevent immediate re-wake
                [User32]::BlockInput($true)

                # Re-close monitor
                Close-Monitor
                Write-Log "Monitor turned OFF (auto-recovery)"

                # Wait to ensure closed
                Start-Sleep -Milliseconds 1500

                # Restore input
                [User32]::BlockInput($false)

                Write-Log "Screen Off Monitor completed - exiting"
                $wakeDetected = $true
                break
            }
        }
    }

} catch {
    Write-Log "ERROR: Monitor encountered exception: $($_.Exception.Message)"
} finally {
    # Cleanup: restore input
    try {
        [User32]::BlockInput($false)
    } catch {}
    Write-Log "========================================="
}
