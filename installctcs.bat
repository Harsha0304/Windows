@echo off
set "downloadLink=https://ctcs-install.s3.amazonaws.com/CTCS-Without_Security.msi"
set "installerName=CTCS-Setup_Without_Security.msi"
set "downloadDirectory=C:\Download-Test"
set "installDirectory=C:\Download-Test\CTCS-Setup_Without_Security.msi"

echo Creating download directory...
mkdir "%downloadDirectory%" 2>nul

echo Downloading %installerName%...
curl -o "%downloadDirectory%\%installerName%" "%downloadLink%" || (
    echo Failed to download %installerName%. Exiting.
    exit /b 1
)

echo Installing %installerName%...
start /wait msiexec /i "%downloadDirectory%\%installerName%" /qn INSTALLDIR="%installDirectory%" || (
    echo Failed to install %installerName%. Exiting.
    exit /b 1
)

echo Installation completed successfully. Restarting the system...
shutdown /r /t 0
