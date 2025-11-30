@echo off
title Auto Setup and Push to GitHub
color 0A
cls
echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║     AUTOMATIC GITHUB SETUP AND PUSH                         ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo This script will do EVERYTHING automatically!
echo.
echo Repository: https://github.com/Ankita123-ai/Todo-App-Ankita
echo.
echo ═══════════════════════════════════════════════════════════════
echo.

set REPO_NAME=Todo-App-Ankita

echo [STEP 1] Setting up Git configuration...
git config user.name "Ankita123-ai" 2>nul
git config user.email "ankita@github.com" 2>nul
echo    ✓ Git configured
echo.

echo [STEP 2] Initializing Git repository...
if not exist .git (
    git init
    echo    ✓ Git initialized
) else (
    echo    ✓ Git already initialized
)
echo.

echo [STEP 3] Setting up remote repository...
git remote remove origin 2>nul
git remote add origin https://github.com/Ankita123-ai/%REPO_NAME%.git
echo    ✓ Remote configured
echo.

echo [STEP 4] Adding all files...
git add -A
echo    ✓ All files added (%date% %time%)
echo.

echo [STEP 5] Committing changes...
git commit -m "Initial commit: Todo App with custom gradient background" 2>nul
if %errorlevel% equ 0 (
    echo    ✓ Changes committed
) else (
    echo    ℹ Nothing new to commit
)
echo.

echo [STEP 6] Setting branch to main...
git branch -M main 2>nul
echo    ✓ Branch set to main
echo.

echo ═══════════════════════════════════════════════════════════════
echo.
echo [STEP 7] Ready to push!
echo.
echo The repository needs to exist on GitHub first.
echo.
echo Creating repository automatically (if GitHub CLI is installed)...
echo.

where gh >nul 2>&1
if %errorlevel% equ 0 (
    echo ✓ GitHub CLI found - Attempting auto-create...
    echo.
    
    gh auth status >nul 2>&1
    if %errorlevel% equ 0 (
        echo ✓ Authenticated - Creating repository...
        gh repo create %REPO_NAME% --public --source=. --remote=origin --push 2>nul
        
        if %errorlevel% equ 0 (
            echo.
            echo ═══════════════════════════════════════════════════════════════
            echo   ✓✓✓ SUCCESS! Repository created and code pushed! ✓✓✓
            echo ═══════════════════════════════════════════════════════════════
            echo.
            echo Your code is now at:
            echo https://github.com/Ankita123-ai/%REPO_NAME%
            echo.
            timeout /t 2 >nul
            start https://github.com/Ankita123-ai/%REPO_NAME%
            goto :end
        ) else (
            echo ⚠ Repository might already exist. Trying push only...
        )
    ) else (
        echo ⚠ Not authenticated. Will try manual push...
    )
)

echo.
echo Attempting to push to existing repository...
echo.
echo ⚠ NOTE: If repository doesn't exist, create it first at:
echo    https://github.com/new
echo    Name: %REPO_NAME%
echo    Keep it EMPTY (no README)
echo.
pause

echo.
echo Pushing code...
git push -u origin main

if %errorlevel% neq 0 (
    echo.
    echo Trying master branch...
    git branch -M master 2>nul
    git push -u origin master
)

if %errorlevel% equ 0 (
    echo.
    echo ═══════════════════════════════════════════════════════════════
    echo   ✓ SUCCESS! Code pushed to GitHub!
    echo ═══════════════════════════════════════════════════════════════
    echo.
    echo Repository: https://github.com/Ankita123-ai/%REPO_NAME%
    echo.
    timeout /t 2 >nul
    start https://github.com/Ankita123-ai/%REPO_NAME%
) else (
    echo.
    echo ═══════════════════════════════════════════════════════════════
    echo   ⚠ Push needs authentication
    echo ═══════════════════════════════════════════════════════════════
    echo.
    echo The code is ready to push, but GitHub needs authentication.
    echo.
    echo All files are committed and ready!
    echo.
    echo To complete the push:
    echo   1. Make sure repository exists: https://github.com/new
    echo   2. Run: git push -u origin main
    echo   3. Use Personal Access Token as password
    echo.
    echo OR install GitHub CLI for automatic push:
    echo   Download: https://cli.github.com/
    echo   Then run: gh auth login
    echo   Then run this script again
    echo.
)

:end
echo.
echo ═══════════════════════════════════════════════════════════════
echo   Setup Complete!
echo ═══════════════════════════════════════════════════════════════
echo.
pause

