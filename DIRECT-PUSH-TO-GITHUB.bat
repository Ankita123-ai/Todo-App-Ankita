@echo off
title Direct Push to GitHub Using GitHub CLI
color 0A
cls
echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║     DIRECT PUSH TO GITHUB (Using GitHub CLI)                ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo This will create a new repository and push code directly!
echo.

REM Check if GitHub CLI is installed
where gh >nul 2>&1
if %errorlevel% neq 0 (
    echo ⚠ GitHub CLI (gh) is not installed.
    echo.
    echo Installing GitHub CLI will allow direct push.
    echo.
    echo Option 1: Install GitHub CLI (Recommended)
    echo   1. Download from: https://cli.github.com/
    echo   2. Install it
    echo   3. Run: gh auth login
    echo   4. Run this script again
    echo.
    echo Option 2: Use manual method (See README files)
    echo.
    pause
    exit /b 1
)

echo ✓ GitHub CLI detected!
echo.
echo Checking authentication...
gh auth status >nul 2>&1
if %errorlevel% neq 0 (
    echo ⚠ Not authenticated with GitHub.
    echo.
    echo Authenticating...
    echo.
    gh auth login
    if %errorlevel% neq 0 (
        echo.
        echo Authentication failed or cancelled.
        echo.
        pause
        exit /b 1
    )
)

echo ✓ Authenticated!
echo.
echo ================================================================
echo.

set /p REPO_NAME="Enter repository name (or press Enter for 'Todo-App-Ankita'): "
if "%REPO_NAME%"=="" set REPO_NAME=Todo-App-Ankita

echo.
echo Creating repository: %REPO_NAME%
echo.

REM Initialize git if needed
if not exist .git (
    echo [1/4] Initializing Git...
    git init
    echo    ✓ Git initialized
    echo.
)

REM Add all files
echo [2/4] Adding all files...
git add -A
echo    ✓ Files added
echo.

REM Commit
echo [3/4] Committing changes...
git commit -m "Initial commit: Todo App with custom gradient background" 2>nul
if %errorlevel% neq 0 (
    echo    ⚠ Nothing new to commit
) else (
    echo    ✓ Changes committed
)
echo.

REM Create repository and push using GitHub CLI
echo [4/4] Creating repository on GitHub and pushing...
echo.

git branch -M main 2>nul

REM Create public repository and push
gh repo create %REPO_NAME% --public --source=. --remote=origin --push

if %errorlevel% neq 0 (
    echo.
    echo Trying to create private repository...
    gh repo create %REPO_NAME% --private --source=. --remote=origin --push
)

if %errorlevel% equ 0 (
    echo.
    echo ═══════════════════════════════════════════════════════════════
    echo   ✓✓✓ SUCCESS! ✓✓✓
    echo ═══════════════════════════════════════════════════════════════
    echo.
    echo Repository created and code pushed!
    echo.
    echo URL: https://github.com/Ankita123-ai/%REPO_NAME%
    echo.
    timeout /t 2 >nul
    start https://github.com/Ankita123-ai/%REPO_NAME%
) else (
    echo.
    echo ═══════════════════════════════════════════════════════════════
    echo   ⚠ Failed to create repository
    echo ═══════════════════════════════════════════════════════════════
    echo.
    echo Possible reasons:
    echo   1. Repository name already exists
    echo   2. Authentication issue - run: gh auth login
    echo   3. Network issue
    echo.
)

echo.
pause

