@echo off
chcp 65001 >nul
echo ========================================
echo Pushing Todo App to GitHub
echo Repository: https://github.com/Ankita123-ai/To-Do-list
echo ========================================
echo.

echo Checking git status...
git status
echo.

echo Step 1: Setting up remote repository...
git remote remove origin 2>nul
git remote add origin https://github.com/Ankita123-ai/To-Do-list.git
echo ✓ Remote added
echo.

echo Step 2: Adding all files...
git add .
echo ✓ Files added
echo.

echo Step 3: Committing changes...
git commit -m "Initial commit: Todo App with custom gradient background"
echo ✓ Changes committed
echo.

echo Step 4: Pushing to GitHub (main branch)...
echo Note: You may be prompted for GitHub credentials
echo.
git push -u origin main

if %errorlevel% neq 0 (
    echo.
    echo Trying 'master' branch instead...
    git push -u origin master
)

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo ✓ SUCCESS! Code pushed to GitHub!
    echo ========================================
    echo.
    echo View your repository at:
    echo https://github.com/Ankita123-ai/To-Do-list
    echo.
) else (
    echo.
    echo ========================================
    echo ⚠ Push failed. Common issues:
    echo ========================================
    echo 1. Authentication required - GitHub may ask for username/password
    echo 2. Use Personal Access Token instead of password
    echo 3. Generate token at: https://github.com/settings/tokens
    echo.
)

pause

