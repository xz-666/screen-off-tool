@echo off
chcp 65001 >nul

:: Screen Off Tool v3.4

if /i "%~1"=="/?" goto :HELP
if /i "%~1"=="/s" goto :RUN

echo ========================================
echo     Screen Off Tool v3.4
echo ========================================
echo.
echo Screen will turn off in 3 seconds...
echo Press Ctrl+C to cancel
echo.
echo After screen is off:
echo   - Move mouse or press any key to exit
echo.

timeout /t 3 >nul

:RUN
%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -File "%~dp0ScreenOff.ps1"
exit /b 0

:HELP
echo.
echo Usage: %~n0 [/s] [/?]
echo.
