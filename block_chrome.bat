@echo off
setlocal enabledelayedexpansion

:: Set the name of the application you want to block
set "AppName=chrome.exe"

:: Define a rule name for the Windows Firewall
set "RuleName=Block-%AppName%"

:: Create a Windows Firewall rule to block the application
echo Creating Windows Firewall rule to block %AppName%...
netsh advfirewall firewall add rule name="%RuleName%" dir=out action=block program="C:\Program Files\Google\Chrome\Application\chrome.exe" enable=yes
netsh advfirewall firewall add rule name="%RuleName%" dir=in action=block program="C:\Program Files\Google\Chrome\Application\chrome.exe" enable=yes

:: Check if the rule was created successfully
set "RuleExists="
for /f "tokens=*" %%a in ('netsh advfirewall firewall show rule name^="%RuleName%"') do (
    set "RuleExists=1"
)

if defined RuleExists (
    echo %AppName% is now blocked by the Windows Firewall.
) else (
    echo Failed to create the Windows Firewall rule to block %AppName%.
)

:: End of script
pause
