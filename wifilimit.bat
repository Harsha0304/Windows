@echo off
setlocal enabledelayedexpansion

REM Set the desired data limit in megabytes
set "dataLimitMB=1024"

REM Set the WiFi interface name (you need to replace "Wi-Fi" with your actual interface name)
set "interfaceName=Wi-Fi"

REM Set the SSID you want to monitor
set "targetSSID=Harsha"

REM Get the initial data usage for the target SSID
set "initialDataUsage=0"
for /f "tokens=3 delims=:" %%a in ('netsh wlan show interfaces ^| find /i "%targetSSID%" ^| find "Received bytes"') do (
    set "initialDataUsage=%%a"
)

REM Monitor data usage and disconnect when the limit is reached
:MonitorDataUsage
timeout /t 10 /nobreak > nul

set "currentDataUsage=0"
for /f "tokens=3 delims=:" %%a in ('netsh wlan show interfaces ^| find /i "%targetSSID%" ^| find "Received bytes"') do (
    set "currentDataUsage=%%a"
)

set /a "usedData=!currentDataUsage! - !initialDataUsage!"

echo Data Used for SSID %targetSSID%: !usedData! bytes

REM Convert bytes to megabytes
set /a "usedDataMB=!usedData! / 1024 / 1024"

if !usedDataMB! geq %dataLimitMB% (
    echo Data limit reached for SSID %targetSSID%. Disconnecting from WiFi.
    netsh wlan disconnect
    goto :EndScript
) else (
    goto :MonitorDataUsage
)

:EndScript
endlocal
