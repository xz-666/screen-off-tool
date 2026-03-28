# Screen Off Tool v3.4 - All-in-One
# Turn off monitor and wait for user activity to exit

param()

# Load required assemblies
try {
    Add-Type -AssemblyName System.Windows.Forms -ErrorAction Stop
    Add-Type -AssemblyName System.Drawing -ErrorAction Stop
} catch {
    Write-Host "ERROR: Failed to load required assemblies"
    exit 1
}

# NirCmd path
$NirCmdPath = "$PSScriptRoot\nircmd\nircmd.exe"

# Log function
$LogPath = "$PSScriptRoot\screen-off.log"
function Write-Log {
    param([string]$Message)
    try {
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        "$timestamp - $Message" | Out-File -FilePath $LogPath -Append -Encoding UTF8
    } catch {}
}

Write-Log "========================================="
Write-Log "Screen Off Tool v3.4 starting"
Write-Log "========================================="

# Turn off monitor using NirCmd
function Close-Monitor {
    if (Test-Path $NirCmdPath) {
        & $NirCmdPath monitor off
        Write-Log "Monitor OFF (NirCmd)"
    } else {
        Write-Log "NirCmd not found, using SendMessage"
        Add-Type '[DllImport("user32.dll")]public static extern int SendMessage(int hWnd,int Msg,int wParam,int lParam);' -Name User32 -Namespace Win32 -ErrorAction SilentlyContinue
        [Win32.User32]::SendMessage(0xFFFF, 0x0112, 0xF170, 2) | Out-Null
        Write-Log "Monitor OFF (SendMessage)"
    }
}

Write-Log "Turning off monitor..."
Close-Monitor

# Wait a moment for monitor to turn off
Start-Sleep -Milliseconds 500

Write-Log "Monitor is OFF. Waiting for user activity..."

# Create hidden form for key monitoring
$form = New-Object System.Windows.Forms.Form
$form.ShowInTaskbar = $false
$form.Opacity = 0
$form.Width = 1
$form.Height = 1
$form.StartPosition = [System.Windows.Forms.FormStartPosition]::Manual
$form.Location = [System.Drawing.Point]::new(-100, -100)
$form.KeyPreview = $true

# Get initial mouse position
$pos = [System.Windows.Forms.Cursor]::Position
$lastX = $pos.X
$lastY = $pos.Y

# Handle any key press - exit
$form.Add_KeyDown({
    Write-Log "Key pressed - exiting"
    $form.Close()
})

# Timer to detect mouse movement
$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 200

$timer.Add_Tick({
    try {
        $pos = [System.Windows.Forms.Cursor]::Position
        $dx = [Math]::Abs($pos.X - $lastX)
        $dy = [Math]::Abs($pos.Y - $lastY)

        if ($dx -gt 10 -or $dy -gt 10) {
            Write-Log "Mouse movement detected (dx=$dx, dy=$dy) - exiting"
            $timer.Stop()
            $form.Close()
        }
    } catch {}
})

$timer.Start()
Write-Log "Monitoring started"

# Show form (blocks until closed)
$form.ShowDialog() | Out-Null

$timer.Stop()
$timer.Dispose()

Write-Log "Tool exited"
Write-Log "========================================="
