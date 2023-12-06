@echo off

taskkill /F /IM explorer.exe
reg delete "HKCU\Control Panel\Desktop\WindowMetrics\ActivateWindows" /f
explorer.exe
