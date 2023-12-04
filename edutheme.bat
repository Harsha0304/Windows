@echo off
setlocal

:: Check if the script is running with administrative privileges
>nul 2>&1 net session
if %errorLevel% neq 0 (
    echo Please run this script as an administrator.
    pause
    exit /b 1
)

:: Set registry key and value
set "regKey=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\current\device"
set "regValue=EnableEduThemes"

:: Check if the registry key already exists
reg query "%regKey%" /v "%regValue%" >nul 2>&1
if %errorLevel% equ 0 (
    echo Registry key "%regKey%\%regValue%" already exists.
) else (
    echo Creating registry key "%regKey%\%regValue%"
    reg add "%regKey%" /v "%regValue%" /t REG_DWORD /d 1 /f
    if %errorLevel% equ 0 (
        echo Registry key created successfully.
    ) else (
        echo Failed to create registry key.
        pause
        exit /b 1
    )
)

echo Script completed successfully.
pause
exit /b 0
