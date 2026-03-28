@echo off
chcp 65001 >nul

:: Black Screen Overlay - Fullscreen black window
:: Press ESC to exit

%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -File "%~dp0BlackScreen.ps1"
