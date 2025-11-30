@echo off
cd /d "%~dp0"
echo.
echo ========================================
echo   Pushing to GitHub - Simple Version
echo ========================================
echo.

git init
git remote remove origin 2>nul
git remote add origin https://github.com/Ankita123-ai/To-Do-list.git
git add .
git commit -m "Initial commit: Todo App with custom gradient background"
git branch -M main 2>nul
git push -u origin main

if errorlevel 1 (
    echo.
    echo Trying master branch...
    git branch -M master 2>nul
    git push -u origin master
)

echo.
echo ========================================
pause

