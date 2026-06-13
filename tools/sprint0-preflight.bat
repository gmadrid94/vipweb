@echo off
setlocal
cd /d "%~dp0.."
if not exist logs\tools mkdir logs\tools
for /f %%i in ('powershell -NoProfile -Command "Get-Date -Format yyyyMMdd-HHmmss"') do set TS=%%i
set LOG=logs\tools\sprint0-preflight-%TS%.log
(
  echo ===== VipWeb Sprint 0 preflight =====
  echo APP_ROOT=%CD%
  echo.
  echo ===== PHP =====
  php -v
  echo.
  echo ===== MySQL/MariaDB CLI if available =====
  mysql --version
  echo.
  echo ===== Readonly validator =====
  python project\scripts\update_script.py
) > "%LOG%" 2>&1
set EXITCODE=%ERRORLEVEL%
type "%LOG%"
echo.
echo Log written to %LOG%
exit /b %EXITCODE%
