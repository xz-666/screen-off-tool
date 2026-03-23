@echo off
:: ScreenOff.bat v1.0.0
:: https://github.com/xz-666/screen-off-tool
:: Description: Turn off monitor while keeping PC running / 关闭显示器但保持电脑运行

chcp 65001 >nul

:: Check if silent mode / 检查是否静默模式
if /i "%~1"=="/s" goto :SCREEN_OFF

:: Normal mode: countdown with cancel support / 普通模式：显示倒计时，支持取消
echo ========================================
echo        Screen Off Tool v1.0.0
echo ========================================
echo.
echo 3 seconds to turn off monitor / 3秒后关闭显示器
echo Press Ctrl+C to cancel / 按 Ctrl+C 取消
echo Move your hand away from mouse / 请拿开鼠标...
echo.

timeout /t 3 >nul
if errorlevel 1 (
    echo.
    echo Cancelled / 已取消
    timeout /t 1 >nul
    exit /b 0
)

:SCREEN_OFF
echo.
echo Turning off monitor... / 正在关闭显示器...

:: Turn off monitor with error handling / 关闭显示器（带错误处理）
powershell -ExecutionPolicy Bypass -WindowStyle Hidden -Command "try { Add-Type -MemberDefinition '[DllImport(\"user32.dll\")]public static extern int SendMessage(int hWnd,int Msg,int wParam,int lParam);' -Name User32 -Namespace Win32 -ErrorAction Stop; [Win32.User32]::SendMessage(0xFFFF, 0x0112, 0xF170, 2); exit 0 } catch { exit 1 }" 2>nul

if errorlevel 1 (
    echo.
    echo [Error] Failed to turn off monitor / 错误：无法关闭显示器
    echo Please check if PowerShell is available / 请检查 PowerShell 是否可用
    pause
    exit /b 1
)

:: Silent mode exits directly / 静默模式直接退出
if /i "%~1"=="/s" exit /b 0

echo.
echo ========================================
echo Monitor turned off / 显示器已关闭
echo Move mouse or press any key to wake / 移动鼠标或按任意键唤醒
echo ========================================
echo.
pause >nul
