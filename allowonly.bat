@echo off

REM Define the allowed program (Microsoft Edge)
set "allowedProgram=%ProgramFiles%\Microsoft\Edge\Application\msedge.exe"

REM Create a firewall rule to allow Microsoft Edge
netsh advfirewall firewall add rule name="Allow Microsoft Edge" dir=out action=allow program="%allowedProgram%" enable=yes

REM Block all outbound traffic
netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound

REM Allow outbound traffic for Microsoft Edge
netsh advfirewall set rule name="Allow Microsoft Edge" new enable=yes

echo Applications have been blocked, except for Microsoft Edge.
pause
