@echo off
setlocal
cd /d "%~dp0.."
for /f %%i in ('powershell -NoProfile -Command "Get-Date -Format yyyyMMdd-HHmmss"') do set TS=%%i
set BACKUP_ROOT=C:\wamp64\www\vipweb_backups
set BACKUP_DIR=%BACKUP_ROOT%\%TS%_manual_backup
if not exist "%BACKUP_ROOT%" mkdir "%BACKUP_ROOT%"
echo Creating backup at %BACKUP_DIR%
robocopy "%CD%" "%BACKUP_DIR%\project_files" /E /XD logs tmp /R:1 /W:1
set RC=%ERRORLEVEL%
if %RC% LEQ 7 (
  echo Backup completed with robocopy code %RC%.
  exit /b 0
) else (
  echo Backup failed with robocopy code %RC%.
  exit /b %RC%
)
