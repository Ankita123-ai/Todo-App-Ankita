@echo off
title Push to GitHub - Ankita's Todo App
color 0A
echo.
echo ================================================================
echo   PUSHING YOUR TODO APP TO GITHUB
echo ================================================================
echo.
echo Repository: https://github.com/Ankita123-ai/To-Do-list
echo.
echo ================================================================
echo.

echo [1/6] Checking if git is installed...
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Git is not installed or not in PATH
    echo Please install Git from: https://git-scm.com/download/win
    pause
    exit /b 1
)
echo    ✓ Git is installed
echo.

echo [2/6] Initializing Git repository...
if not exist .git (
    git init
    echo    ✓ Git repository initialized
) else (
    echo    ✓ Git repository already exists
)
echo.

echo [3/6] Configuring remote repository...
git remote remove origin 2>nul
git remote add origin https://github.com/Ankita123-ai/To-Do-list.git
echo    ✓ Remote repository configured
echo.

echo [4/6] Adding all files...
git add .
echo    ✓ All files staged
echo.

echo [5/6] Committing changes...
git commit -m "Initial commit: Todo App with custom gradient background" 2>nul
if %errorlevel% neq 0 (
    echo    ⚠ Nothing new to commit (files already committed)
) else (
    echo    ✓ Changes committed
)
echo.

echo [6/6] Pushing to GitHub...
echo.
echo    ⚠ You will be prompted for credentials:
echo       - Username: Your GitHub username
echo       - Password: Use a Personal Access Token (NOT your password)
echo.
echo    Generate token at: https://github.com/settings/tokens
echo    Select scope: "repo"
echo.
echo ================================================================
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
    echo ================================================================
    echo   ✓ SUCCESS! Your code is on GitHub!
    echo ================================================================
    echo.
    echo View your repository:
    echo https://github.com/Ankita123-ai/To-Do-list
    echo.
    timeout /t 3 >nul
    start https://github.com/Ankita123-ai/To-Do-list
) else (
    echo.
    echo ================================================================
    echo   ⚠ AUTHENTICATION NEEDED
    echo ================================================================
    echo.
    echo GitHub requires authentication. Here's how to fix it:
    echo.
    echo 1. Go to: https://github.com/settings/tokens
    echo.
    echo 2. Click "Generate new token (classic)"
    echo.
    echo 3. Name it: "Todo App Push"
    echo.
    echo 4. Select scope: "repo" (check the box)
    echo.
    echo 5. Click "Generate token"
    echo.
    echo 6. COPY the token immediately (you won't see it again!)
    echo.
    echo 7. Run this script again and use:
    echo    - Username: Your GitHub username
    echo    - Password: The token you just copied
    echo.
)

echo.
pause

