@echo off
rem Change display resolution to 1920x1200

rem Specify the resolution width and height
set WIDTH=1920
set HEIGHT=1200

rem Use DisplaySwitch.exe to change the display resolution
DisplaySwitch.exe /extend:%WIDTH%,%HEIGHT%
