@echo off

set "desktop=%userprofile%\Desktop"
set "outputFile=%desktop%\productkey.txt"

echo "Retrieving Windows product key..."
wmic path SoftwareLicensingService get OA3xOriginalProductKey > "%outputFile%"
echo "Product key saved to %outputFile%"

echo "Press any key to exit..."
pause
