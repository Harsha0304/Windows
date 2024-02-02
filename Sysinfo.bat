@echo off
setlocal enabledelayedexpansion

:: Set the path for the output file on the desktop
set "outputFile=%userprofile%\Desktop\Deviceinfo.txt"

:: Get system model
for /f "skip=1 delims=" %%a in ('wmic computersystem get model') do set "systemModel=%%a" && goto :next
:next

:: Get device manufacturer
for /f "skip=1 delims=" %%a in ('wmic computersystem get manufacturer') do set "manufacturer=%%a" && goto :next2
:next2

:: Get serial number of the PC
for /f "skip=1 delims=" %%a in ('wmic bios get serialnumber') do set "serialNumber=%%a" && goto :next3
:next3

:: Get system type
for /f "skip=1 delims=" %%a in ('wmic os get osarchitecture') do set "systemType=%%a" && goto :next4
:next4

:: Get processor information
for /f "skip=1 delims=" %%a in ('wmic cpu get name') do set "processor=%%a" && goto :next5
:next5

:: Get total physical memory using systeminfo command
for /f "tokens=2 delims=:" %%a in ('systeminfo ^| findstr /C:"Total Physical Memory"') do set "totalMemory=%%a" && goto :next6
:next6

:: Get MAC address of the physical Wi-Fi adapter using PowerShell
for /f "delims=" %%a in ('powershell -command "Get-NetAdapter | Where-Object { $_.Name -like '*Wi-Fi*' } | Select-Object -ExpandProperty MacAddress"') do set "macAddress=%%a" && goto :next7
:next7

:: Write information to the output file
echo Device Manufacturer: %manufacturer% > "%outputFile%"
echo System Model: %systemModel% >> "%outputFile%"
echo Serial Number: %serialNumber% >> "%outputFile%"
echo System Type: %systemType% >> "%outputFile%"
echo Processor: %processor% >> "%outputFile%"
echo Total Physical Memory: %totalMemory% >> "%outputFile%"
echo MAC Address: %macAddress% >> "%outputFile%"

:: Display success message
echo Information has been saved to %outputFile%
pause
