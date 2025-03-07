@echo off
REM HTML Generator for Jenkins Pipeline
REM This batch script generates a single HTML file that checks if a string is a palindrome

REM Get parameters (remove quotes if present)
set TITLE=%~1
set STRING_TO_CHECK=%~2

REM Create output directory if it doesn't exist
if not exist output mkdir output

REM Check if the string is a palindrome
setlocal enabledelayedexpansion
set "reverse="
set "original=%STRING_TO_CHECK%"
set "length=0"

REM Get the length and build the reversed string
:loop
if "!original:~%length%,1!" neq "" (
    set "reverse=!original:~%length%,1!!reverse!"
    set /a "length+=1"
    goto loop
)

REM Default background color
set BACKGROUND_COLOR=#3498db

REM Check if it's a palindrome and set appropriate colors and message
if /i "%STRING_TO_CHECK%" equ "%reverse%" (
    set IS_PALINDROME=Yes
    set RESULT_COLOR=#2ecc71
    set RESULT_MESSAGE=The string "%STRING_TO_CHECK%" is a palindrome!
) else (
    set IS_PALINDROME=No
    set RESULT_COLOR=#e74c3c
    set RESULT_MESSAGE=The string "%STRING_TO_CHECK%" is not a palindrome.
)

REM Create a properly formatted HTML file with embedded parameters
echo ^<!DOCTYPE html^> > output\index.html
echo ^<html lang="en"^> >> output\index.html
echo ^<head^> >> output\index.html
echo ^<meta charset="UTF-8"^> >> output\index.html
echo ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^> >> output\index.html
echo ^<title^>%TITLE%^</title^> >> output\index.html
echo ^<style^> >> output\index.html
echo body { >> output\index.html
echo   font-family: Arial, sans-serif; >> output\index.html
echo   background-color: %BACKGROUND_COLOR%; >> output\index.html
echo   color: white; >> output\index.html
echo   margin: 0; >> output\index.html
echo   padding: 20px; >> output\index.html
echo   display: flex; >> output\index.html
echo   flex-direction: column; >> output\index.html
echo   align-items: center; >> output\index.html
echo   justify-content: center; >> output\index.html
echo   min-height: 100vh; >> output\index.html
echo } >> output\index.html
echo .container { >> output\index.html
echo   background-color: rgba(0, 0, 0, 0.5); >> output\index.html
echo   border-radius: 10px; >> output\index.html
echo   padding: 30px; >> output\index.html
echo   box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); >> output\index.html
echo   max-width: 800px; >> output\index.html
echo   width: 100%%; >> output\index.html
echo } >> output\index.html
echo h1 { >> output\index.html
echo   margin-top: 0; >> output\index.html
echo   border-bottom: 2px solid white; >> output\index.html
echo   padding-bottom: 10px; >> output\index.html
echo } >> output\index.html
echo .info { >> output\index.html
echo   margin-top: 20px; >> output\index.html
echo   font-size: 18px; >> output\index.html
echo } >> output\index.html
echo .result { >> output\index.html
echo   font-size: 24px; >> output\index.html
echo   font-weight: bold; >> output\index.html
echo   margin: 20px 0; >> output\index.html
echo   padding: 15px; >> output\index.html
echo   border-radius: 5px; >> output\index.html
echo   background-color: %RESULT_COLOR%; >> output\index.html
echo   text-align: center; >> output\index.html
echo } >> output\index.html
echo .details { >> output\index.html
echo   margin-top: 20px; >> output\index.html
echo   background-color: rgba(255, 255, 255, 0.1); >> output\index.html
echo   padding: 15px; >> output\index.html
echo   border-radius: 5px; >> output\index.html
echo } >> output\index.html
echo .code { >> output\index.html
echo   font-family: monospace; >> output\index.html
echo   background-color: rgba(0, 0, 0, 0.3); >> output\index.html
echo   padding: 5px 10px; >> output\index.html
echo   border-radius: 3px; >> output\index.html
echo } >> output\index.html
echo ^</style^> >> output\index.html
echo ^</head^> >> output\index.html
echo ^<body^> >> output\index.html
echo ^<div class="container"^> >> output\index.html
echo ^<h1^>%TITLE%^</h1^> >> output\index.html
echo ^<div class="result"^>%RESULT_MESSAGE%^</div^> >> output\index.html
echo ^<div class="info"^> >> output\index.html
echo ^<p^>Original string: ^<span class="code"^>%STRING_TO_CHECK%^</span^>^</p^> >> output\index.html
echo ^<p^>Reversed string: ^<span class="code"^>%reverse%^</span^>^</p^> >> output\index.html
echo ^<p^>Is palindrome: ^<strong^>%IS_PALINDROME%^</strong^>^</p^> >> output\index.html
echo ^<div class="details"^> >> output\index.html
echo ^<p^>A palindrome is a word, number, phrase, or other sequence of characters that reads the same forward and backward.^</p^> >> output\index.html
echo ^</div^> >> output\index.html
echo ^<p^>Generation time: %date% %time%^</p^> >> output\index.html
echo ^</div^> >> output\index.html
echo ^</div^> >> output\index.html
echo ^</body^> >> output\index.html
echo ^</html^> >> output\index.html

echo HTML file generated in the output directory: output\index.html 