@echo off
setlocal
cd /d "%~dp0.."
if not exist logs\doctor mkdir logs\doctor
for /f %%i in ('powershell -NoProfile -Command "Get-Date -Format yyyyMMdd-HHmmss"') do set TS=%%i
set LOG=logs\doctor\doctor-readonly-%TS%.log
echo Running readonly validation...
python project\scripts\update_script.py > "%LOG%" 2>&1
set EXITCODE=%ERRORLEVEL%
type "%LOG%"
echo.
echo Log written to %LOG%
exit /b %EXITCODE%
