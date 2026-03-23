@echo off
chcp 65001 >nul

if /i "%~1"=="/s" goto :OFF

echo ========================================
echo        Screen Off Tool v1.0.0
echo ========================================
echo.
echo 3 seconds to turn off monitor
echo Press Ctrl+C to cancel
echo.

timeout /t 3 >nul
if errorlevel 1 (
    echo.
    echo Cancelled
    timeout /t 1 >nul
    exit /b 0
)

:OFF
echo.
echo Turning off monitor...

powershell -ExecutionPolicy Bypass -WindowStyle Hidden -Command "Add-Type '[DllImport(\"user32.dll\")]public static extern int SendMessage(int hWnd,int Msg,int wParam,int lParam);' -Name User32 -Namespace Win32; [Win32.User32]::SendMessage(0xFFFF, 0x0112, 0xF170, 2)" 2>nul

if /i "%~1"=="/s" exit /b 0

echo.
echo Monitor turned off. Move mouse to wake.
pause >nul
