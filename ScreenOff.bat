@echo off
chcp 65001 >nul

:: 检查是否静默模式
if /i "%~1"=="/s" goto :SCREEN_OFF

:: 普通模式：显示倒计时
echo 3秒后关闭显示器，请拿开鼠标...
timeout /t 3 /nobreak >nul

:SCREEN_OFF
:: 关闭显示器
powershell -WindowStyle Hidden -Command "Add-Type -MemberDefinition '[DllImport(\"user32.dll\")]public static extern int SendMessage(int hWnd,int Msg,int wParam,int lParam);' -Name User32 -Namespace Win32; [Win32.User32]::SendMessage(0xFFFF, 0x0112, 0xF170, 2)"
