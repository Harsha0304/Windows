@echo off
setlocal

:: Define paths and filenames
set "desktopPath=%USERPROFILE%\Desktop"
set "deviceReportPath=%desktopPath%\DeviceUsageReport.txt"
set "wifiReportPath=%desktopPath%\WifiDataUsageReport.txt"
set "htmlReportPath=%desktopPath%\UsageReports.html"

:: Generate Device Usage Report (Replace this section with your actual commands)
echo Device Usage Report > "%deviceReportPath%"
wmic computersystem get name, manufacturer, model >> "%deviceReportPath%"

:: Generate WiFi Data Usage Report (Replace this section with your actual commands)
echo WiFi Data Usage Report > "%wifiReportPath%"
netstat -e >> "%wifiReportPath%"

:: Create HTML file
(
    echo ^<html^>
    echo ^<head^>
    echo.    ^<title^>Device and WiFi Usage Reports^</title^>
    echo ^</head^>
    echo ^<body^>
    echo.    ^<h1^>Device Usage Report^</h1^>
    echo.    ^<pre^>
    type "%deviceReportPath%"
    echo.    ^</pre^>

    echo.    ^<h1^>WiFi Data Usage Report^</h1^>
    echo.    ^<pre^>
    type "%wifiReportPath%"
    echo.    ^</pre^>
    echo ^</body^>
    echo ^</html^>
) > "%htmlReportPath%"

:: Open the HTML report in the default web browser
start "" "%htmlReportPath%"

endlocal
