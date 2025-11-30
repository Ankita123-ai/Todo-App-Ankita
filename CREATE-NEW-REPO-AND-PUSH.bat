@echo off
title Create New Repository and Push Code
color 0E
cls
echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║     CREATE NEW GITHUB REPOSITORY AND PUSH CODE              ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo This script will help you push to a NEW repository.
echo.
echo ═══════════════════════════════════════════════════════════════
echo.

set /p REPO_NAME="Enter your new repository name (e.g., Todo-App-Ankita): "
if "%REPO_NAME%"=="" set REPO_NAME=Todo-App-Ankita

echo.
echo Your new repository will be:
echo https://github.com/Ankita123-ai/%REPO_NAME%
echo.
echo ═══════════════════════════════════════════════════════════════
echo.
echo STEP 1: Create the repository on GitHub first!
echo.
echo   1. Go to: https://github.com/new
echo   2. Repository name: %REPO_NAME%
echo   3. Description: "Todo App with custom gradient background"
echo   4. Choose: Public or Private
echo   5. DO NOT initialize with README, .gitignore, or license
echo   6. Click "Create repository"
echo.
echo ═══════════════════════════════════════════════════════════════
echo.
pause

echo.
echo ═══════════════════════════════════════════════════════════════
echo   PUSHING CODE TO NEW REPOSITORY
echo ═══════════════════════════════════════════════════════════════
echo.

echo [1/6] Initializing Git...
if not exist .git (
    git init
    echo    ✓ Git initialized
) else (
    echo    ✓ Git already initialized
)
echo.

echo [2/6] Removing old remotes...
git remote remove origin 2>nul
git remote remove old-origin 2>nul
echo    ✓ Old remotes removed
echo.

echo [3/6] Adding new repository as remote...
git remote add origin https://github.com/Ankita123-ai/%REPO_NAME%.git
echo    ✓ Remote added: https://github.com/Ankita123-ai/%REPO_NAME%.git
echo.

echo [4/6] Adding all files...
git add -A
echo    ✓ All files staged
echo.

echo [5/6] Committing changes...
git commit -m "Initial commit: Todo App with custom gradient background" 2>nul
if %errorlevel% equ 0 (
    echo    ✓ Changes committed
) else (
    echo    ⚠ Nothing new to commit
)
echo.

echo [6/6] Pushing to GitHub...
echo.
echo ⚠ AUTHENTICATION REQUIRED
echo.
echo When prompted:
echo   Username: Ankita123-ai
echo   Password: Use Personal Access Token
echo.
echo Get token at: https://github.com/settings/tokens
echo.
echo ═══════════════════════════════════════════════════════════════
echo.

git branch -M main 2>nul
git push -u origin main

if %errorlevel% neq 0 (
    echo.
    echo Trying 'master' branch...
    git branch -M master 2>nul
    git push -u origin master
)

if %errorlevel% equ 0 (
    echo.
    echo ═══════════════════════════════════════════════════════════════
    echo   ✓ SUCCESS! Code pushed to new repository!
    echo ═══════════════════════════════════════════════════════════════
    echo.
    echo Your repository is at:
    echo https://github.com/Ankita123-ai/%REPO_NAME%
    echo.
    timeout /t 2 >nul
    start https://github.com/Ankita123-ai/%REPO_NAME%
) else (
    echo.
    echo ═══════════════════════════════════════════════════════════════
    echo   ⚠ PUSH FAILED
    echo ═══════════════════════════════════════════════════════════════
    echo.
    echo Make sure:
    echo   1. Repository exists at: https://github.com/Ankita123-ai/%REPO_NAME%
    echo   2. You used Personal Access Token (not password)
    echo   3. Repository is empty (no README, no files)
    echo.
)

echo.
pause

