@echo off
title Auto Push to GitHub - Simplest Method
color 0B
cls
echo.
echo ================================================================
echo   AUTO PUSH TO GITHUB (No Manual Steps!)
echo ================================================================
echo.

REM Default repository name
set REPO_NAME=Todo-App-Ankita

echo Repository name: %REPO_NAME%
echo Repository URL: https://github.com/Ankita123-ai/%REPO_NAME%
echo.

REM Check for GitHub CLI
where gh >nul 2>&1
if %errorlevel% equ 0 (
    echo ✓ GitHub CLI found - Using direct method
    echo.
    
    REM Check auth
    gh auth status >nul 2>&1
    if %errorlevel% equ 0 (
        echo ✓ Already authenticated
        echo.
        echo Creating repository and pushing code...
        echo.
        
        if not exist .git git init
        git add -A
        git commit -m "Initial commit: Todo App with custom gradient background" 2>nul
        git branch -M main 2>nul
        
        gh repo create %REPO_NAME% --public --source=. --remote=origin --push
        
        if %errorlevel% equ 0 (
            echo.
            echo ✓ SUCCESS! Repository created and code pushed!
            echo.
            echo View at: https://github.com/Ankita123-ai/%REPO_NAME%
            start https://github.com/Ankita123-ai/%REPO_NAME%
        ) else (
            echo.
            echo ⚠ Repository might already exist. Trying push only...
            git remote remove origin 2>nul
            git remote add origin https://github.com/Ankita123-ai/%REPO_NAME%.git
            git push -u origin main
        )
        
        goto :end
    ) else (
        echo ⚠ Need to authenticate first...
        echo.
        echo Running authentication...
        gh auth login
        echo.
        echo Please run this script again after authentication.
        pause
        exit /b 1
    )
)

echo.
echo ================================================================
echo   GitHub CLI not installed - Using alternative method
echo ================================================================
echo.

echo This script will prepare everything for you.
echo You'll need to create the repository on GitHub first.
echo.

set /p CREATE_REPO="Have you created the repository on GitHub? (y/n): "
if /i not "%CREATE_REPO%"=="y" (
    echo.
    echo Please create the repository first:
    echo   1. Go to: https://github.com/new
    echo   2. Name: %REPO_NAME%
    echo   3. Keep it EMPTY (no README)
    echo   4. Create repository
    echo.
    echo Then run this script again.
    pause
    exit /b 1
)

echo.
echo Pushing code...
echo.

if not exist .git git init
git remote remove origin 2>nul
git remote add origin https://github.com/Ankita123-ai/%REPO_NAME%.git
git add -A
git commit -m "Initial commit: Todo App with custom gradient background" 2>nul
git branch -M main 2>nul
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ✓ SUCCESS!
    echo Repository: https://github.com/Ankita123-ai/%REPO_NAME%
    start https://github.com/Ankita123-ai/%REPO_NAME%
) else (
    echo.
    echo ⚠ Push failed. Check authentication.
)

:end
echo.
pause

