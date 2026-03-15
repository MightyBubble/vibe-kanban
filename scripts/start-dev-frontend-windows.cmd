@echo off
setlocal

set "SCRIPT_DIR=%~dp0"
set "REPO_ROOT=%SCRIPT_DIR%.."
set "OUT_LOG=%REPO_ROOT%\.frontend.dev.out.log"
set "ERR_LOG=%REPO_ROOT%\.frontend.dev.err.log"

if exist "%OUT_LOG%" del /f /q "%OUT_LOG%"
if exist "%ERR_LOG%" del /f /q "%ERR_LOG%"

start "" /b "%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_DIR%dev-frontend-windows.ps1" 3002 3003 3004 1>"%OUT_LOG%" 2>"%ERR_LOG%"
