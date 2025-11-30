@echo off
title Push to New GitHub Repository
color 0B
cls
echo.
echo ================================================================
echo   PUSH TO NEW GITHUB REPOSITORY
echo ================================================================
echo.

REM Suggested repository names
echo Suggested repository names:
echo   1. Todo-App-Ankita
echo   2. Ankita-Todo-List
echo   3. My-Todo-App
echo   4. Custom name
echo.

set /p CHOICE="Enter repository name (or press Enter for 'Todo-App-Ankita'): "
if "%CHOICE%"=="" set REPO_NAME=Todo-App-Ankita
if "%CHOICE%"=="1" set REPO_NAME=Todo-App-Ankita
if "%CHOICE%"=="2" set REPO_NAME=Ankita-Todo-List
if "%CHOICE%"=="3" set REPO_NAME=My-Todo-App
if not defined REPO_NAME set REPO_NAME=%CHOICE%

echo.
echo Repository URL: https://github.com/Ankita123-ai/%REPO_NAME%
echo.
echo ================================================================
echo.
echo IMPORTANT: Create the repository on GitHub first!
echo.
echo Quick steps:
echo   1. Go to: https://github.com/new
echo   2. Name: %REPO_NAME%
echo   3. Keep it EMPTY (no README, no files)
echo   4. Click "Create repository"
echo.
echo ================================================================
echo.
pause

echo.
echo Initializing and pushing...
echo.

git init
git remote remove origin 2>nul
git remote add origin https://github.com/Ankita123-ai/%REPO_NAME%.git
git add -A
git commit -m "Initial commit: Todo App with custom gradient background" 2>nul
git branch -M main 2>nul
git push -u origin main

if %errorlevel% neq 0 (
    echo Trying master branch...
    git branch -M master 2>nul
    git push -u origin master
)

echo.
if %errorlevel% equ 0 (
    echo ✓ SUCCESS!
    echo.
    echo Repository: https://github.com/Ankita123-ai/%REPO_NAME%
    start https://github.com/Ankita123-ai/%REPO_NAME%
) else (
    echo ⚠ Push failed. Make sure repository exists and is empty.
)

echo.
pause

