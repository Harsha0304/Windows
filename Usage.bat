@echo off

REM Set report locations
set DEV_USAGE_REPORT="%userprofile%\AppData\Local\Microsoft\Windows\ResourceUsage\deviceusage-report.xml"
set WIFI_DATA_USAGE_REPORT="C:\ProgramData\Microsoft\Windows\NetworkShell\wlanreport.html"

REM Generate HTML header
echo "<html>" > report.html
echo "<head>" >> report.html
echo "<title>Device & Wi-Fi Usage Report</title>" >> report.html
echo "<style>" >> report.html
echo "body { font-family: Arial, sans-serif; }" >> report.html
echo "table { border-collapse: collapse; }" >> report.html
echo "th, td { padding: 5px; border: 1px solid #ddd; }" >> report.html
echo "</style>" >> report.html
echo "</head>" >> report.html

REM Process Device Usage Report
powershell -ExecutionPolicy Bypass -Command ". C:\path\to\process_device_usage.ps1 ${DEV_USAGE_REPORT} 'table_device_usage'" >> report.html

REM Process Wi-Fi Data Usage Report
echo "<h2>Wi-Fi Data Usage</h2>" >> report.html
echo "<iframe src=%WIFI_DATA_USAGE_REPORT% width='100%' height='500px' frameborder='0'></iframe>" >> report.html

REM Generate HTML footer
echo "</body>" >> report.html
echo "</html>" >> report.html

REM Copy report to C:\
copy report.html C:\Usage_Report_%date:~-4,2-%date:~-7,2-%date:~-10%.html

echo "Device & Wi-Fi Usage Report generated successfully!"

pause

REM Additional notes:
* Remember to replace ". C:\path\to\process_device_usage.ps1 'table_device_usage'" with your script to parse the Device Usage Report.
* Adjust the Wi-Fi report iframe element attributes as needed.

This version now copies the report to `C:\` instead of your Desktop. Ensure you have write access to that directory.

Please let me know if you have any other modifications or questions!
