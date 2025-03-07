@echo off
REM HTML Generator for Jenkins Pipeline
REM This batch script copies the index.html file to the output directory

REM Get parameters
set TITLE=%~1
set COLOR=%~2

REM Create output directory if it doesn't exist
if not exist output mkdir output

REM Copy the HTML file to the output directory
copy index.html output\index.html

REM Generate a simple timestamp file for reference
echo HTML generated at: %date% %time% > output\timestamp.txt
echo Title: %TITLE% >> output\timestamp.txt
echo Color: %COLOR% >> output\timestamp.txt

REM Create a simple redirect HTML file that includes the parameters
echo ^<!DOCTYPE html^> > output\redirect.html
echo ^<html^> >> output\redirect.html
echo ^<head^> >> output\redirect.html
echo ^<meta http-equiv="refresh" content="0; url='index.html?title=%TITLE%&color=%COLOR%'"^> >> output\redirect.html
echo ^</head^> >> output\redirect.html
echo ^<body^> >> output\redirect.html
echo ^<p^>Redirecting...^</p^> >> output\redirect.html
echo ^</body^> >> output\redirect.html
echo ^</html^> >> output\redirect.html

echo HTML file generated in the output directory: output\redirect.html 