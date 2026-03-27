@echo off
chcp 65001 >nul

if /i "%~1"=="/s" goto :OFF

echo ========================================
echo        Screen Off Tool v2.0.0
echo ========================================
echo.
echo 3 seconds to turn off monitor
echo Press Ctrl+C to cancel (other keys ignored)
echo.

:: Use Windows native timeout command (only responds to Ctrl+C)
%SystemRoot%\System32\timeout.exe /t 3 >nul

echo Countdown complete.

:OFF
echo.
echo Turning off monitor...

:: Close monitor using Windows API
powershell -ExecutionPolicy Bypass -WindowStyle Hidden -Command "Add-Type '[DllImport(\"user32.dll\")]public static extern int SendMessage(int hWnd,int Msg,int wParam,int lParam);' -Name User32 -Namespace Win32; [Win32.User32]::SendMessage(0xFFFF, 0x0112, 0xF170, 2)" 2>nul

echo.
echo Starting monitor watchdog...

:: Start background monitor process (hidden window)
start "" powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -File "%~dp0ScreenOff.Monitor.ps1"

:: Wait for monitor to start
%SystemRoot%\System32\timeout.exe /t 1 >nul

echo.
echo Monitor turned off. Background monitor is running.
echo Log file: %~dp0screen-off.log
echo.
echo Monitor will auto-exit after detecting and recovering from one wake event.

:: If silent mode, exit directly
if /i "%~1"=="/s" exit /b 0

:: Main process exits without waiting
exit /b 0
