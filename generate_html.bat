@echo off
REM HTML Generator for Jenkins Pipeline
REM This batch script generates a single HTML file that checks if a string is a palindrome
REM יוצר קובץ HTML שבודק אם מחרוזת היא פלינדרום

REM קבלת פרמטרים (הסרת מרכאות אם קיימות)
set TITLE=%~1
set STRING_TO_CHECK=%~2
set REPO_INFO=%~3

REM יצירת תיקיית פלט אם היא לא קיימת
if not exist output mkdir output

REM בדיקה אם המחרוזת היא פלינדרום
setlocal enabledelayedexpansion
set "reverse="
set "original=%STRING_TO_CHECK%"
set "length=0"

REM קבלת אורך המחרוזת ובניית המחרוזת ההפוכה
:loop
if "!original:~%length%,1!" neq "" (
    set "reverse=!original:~%length%,1!!reverse!"
    set /a "length+=1"
    goto loop
)

REM הגדרת צבע רקע ברירת מחדל
set BACKGROUND_COLOR=#3498db

REM בדיקה אם המחרוזת היא פלינדרום והגדרת צבעים והודעות מתאימים
if /i "%STRING_TO_CHECK%" equ "%reverse%" (
    set IS_PALINDROME=Да
    set RESULT_COLOR=#2ecc71
    set RESULT_MESSAGE=Строка "%STRING_TO_CHECK%" является палиндромом!
) else (
    set IS_PALINDROME=Нет
    set RESULT_COLOR=#e74c3c
    set RESULT_MESSAGE=Строка "%STRING_TO_CHECK%" не является палиндромом.
)

REM יצירת קובץ HTML מעוצב עם הפרמטרים המשובצים
echo ^<!DOCTYPE html^> > output\index.html
echo ^<html lang="ru"^> >> output\index.html
echo ^<head^> >> output\index.html
echo ^<meta charset="UTF-8"^> >> output\index.html
echo ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^> >> output\index.html
echo ^<title^>%TITLE%^</title^> >> output\index.html
echo ^<style^> >> output\index.html
REM הגדרת סגנון CSS
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
echo .repo-info { >> output\index.html
echo   margin-top: 20px; >> output\index.html
echo   background-color: rgba(0, 0, 0, 0.3); >> output\index.html
echo   padding: 10px; >> output\index.html
echo   border-radius: 5px; >> output\index.html
echo   font-size: 14px; >> output\index.html
echo   border-left: 4px solid #f39c12; >> output\index.html
echo } >> output\index.html
echo ^</style^> >> output\index.html
echo ^</head^> >> output\index.html
echo ^<body^> >> output\index.html
REM בניית גוף ה-HTML
echo ^<div class="container"^> >> output\index.html
echo ^<h1^>%TITLE%^</h1^> >> output\index.html
echo ^<div class="result"^>%RESULT_MESSAGE%^</div^> >> output\index.html
echo ^<div class="info"^> >> output\index.html
echo ^<p^>Исходная строка: ^<span class="code"^>%STRING_TO_CHECK%^</span^>^</p^> >> output\index.html
echo ^<p^>Обратная строка: ^<span class="code"^>%reverse%^</span^>^</p^> >> output\index.html
echo ^<p^>Является палиндромом: ^<strong^>%IS_PALINDROME%^</strong^>^</p^> >> output\index.html
echo ^<div class="details"^> >> output\index.html
echo ^<p^>Палиндром - это слово, число, фраза или другая последовательность символов, которая читается одинаково как в прямом, так и в обратном направлении.^</p^> >> output\index.html
echo ^</div^> >> output\index.html
REM הוספת המידע על המאגר
echo ^<div class="repo-info"^> >> output\index.html
echo ^<p^>^<strong^>Jenkins Pipeline:^</strong^> %REPO_INFO%^</p^> >> output\index.html
echo ^</div^> >> output\index.html
echo ^<p^>Время генерации: %date% %time%^</p^> >> output\index.html
echo ^</div^> >> output\index.html
echo ^</div^> >> output\index.html
echo ^</body^> >> output\index.html
echo ^</html^> >> output\index.html

REM הודעה על יצירת הקובץ בהצלחה
echo HTML-файл создан в директории: output\index.html 