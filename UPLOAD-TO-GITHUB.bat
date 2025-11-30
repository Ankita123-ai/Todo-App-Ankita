@echo off
title Upload Todo App to GitHub
color 0B
cls
echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║         UPLOAD YOUR TODO APP TO GITHUB                       ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo Repository: https://github.com/Ankita123-ai/To-Do-list
echo.
echo ═══════════════════════════════════════════════════════════════
echo.

:: Step 1: Initialize Git
echo [1/7] Initializing Git repository...
if exist .git (
    echo    Repository already exists, continuing...
) else (
    git init
    echo    ✓ Git repository initialized
)
echo.

:: Step 2: Configure Git user (if needed)
echo [2/7] Configuring Git user...
git config user.name "Ankita123-ai" 2>nul
git config user.email "your-email@example.com" 2>nul
echo    ✓ Git configured
echo.

:: Step 3: Add remote
echo [3/7] Adding GitHub remote repository...
git remote remove origin 2>nul
git remote add origin https://github.com/Ankita123-ai/To-Do-list.git
echo    ✓ Remote added: https://github.com/Ankita123-ai/To-Do-list.git
echo.

:: Step 4: Add all files
echo [4/7] Adding all files to Git...
git add -A
echo    ✓ All files staged for commit
echo.

:: Step 5: Show what will be committed
echo [5/7] Files to be committed:
git status --short | find /c /v "" >nul 2>&1
if %errorlevel% equ 0 (
    echo    Preview:
    git status --short | head -n 10
    echo    ... and more
) else (
    echo    No new files to commit
)
echo.

:: Step 6: Commit
echo [6/7] Committing changes...
git commit -m "Initial commit: Todo App with custom gradient background

- Cloned from maciekt07/TodoApp
- Added custom gradient background (purple to teal)
- Updated README with project name
- Configured for port 2000"
if %errorlevel% equ 0 (
    echo    ✓ Changes committed successfully
) else (
    echo    ⚠ No new changes to commit (or commit failed)
    echo    Checking current status...
    git status
)
echo.

:: Step 7: Push to GitHub
echo [7/7] Pushing to GitHub...
echo.
echo ═══════════════════════════════════════════════════════════════
echo.
echo ⚠ AUTHENTICATION REQUIRED
echo.
echo When prompted, enter:
echo   Username: Ankita123-ai
echo   Password: [Use Personal Access Token - see instructions below]
echo.
echo Don't have a token? Follow these steps:
echo   1. Go to: https://github.com/settings/tokens
echo   2. Click "Generate new token (classic)"
echo   3. Name it: "Todo App Upload"
echo   4. Select scope: ☑ repo (check this box)
echo   5. Click "Generate token" at bottom
echo   6. COPY the token immediately (you won't see it again!)
echo   7. Use that token as your password below
echo.
echo ═══════════════════════════════════════════════════════════════
echo.

:: Try main branch first
git branch -M main 2>nul
echo Attempting to push to 'main' branch...
git push -u origin main

if %errorlevel% neq 0 (
    echo.
    echo Trying 'master' branch instead...
    git branch -M master 2>nul
    git push -u origin master
)

:: Check if push succeeded
if %errorlevel% equ 0 (
    echo.
    echo ═══════════════════════════════════════════════════════════════
    echo.
    echo   ✓✓✓ SUCCESS! ✓✓✓
    echo.
    echo   Your Todo App is now on GitHub!
    echo.
    echo   View it at: https://github.com/Ankita123-ai/To-Do-list
    echo.
    echo ═══════════════════════════════════════════════════════════════
    echo.
    timeout /t 3 >nul
    start https://github.com/Ankita123-ai/To-Do-list
) else (
    echo.
    echo ═══════════════════════════════════════════════════════════════
    echo.
    echo   ⚠ PUSH FAILED
    echo.
    echo   Common reasons:
    echo   1. Authentication failed - make sure you used a token, not password
    echo   2. Wrong username - should be: Ankita123-ai
    echo   3. Repository doesn't exist or you don't have access
    echo   4. Network issues - check your internet connection
    echo.
    echo   Try running this script again with correct credentials.
    echo.
    echo ═══════════════════════════════════════════════════════════════
    echo.
)

echo.
pause

