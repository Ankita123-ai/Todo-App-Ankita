@echo off
chcp 65001 >nul
echo ========================================
echo Setting up Git and Pushing to GitHub
echo Repository: https://github.com/Ankita123-ai/To-Do-list
echo ========================================
echo.

echo Step 1: Initializing Git repository...
git init
echo ✓ Git initialized
echo.

echo Step 2: Adding remote repository...
git remote remove origin 2>nul
git remote add origin https://github.com/Ankita123-ai/To-Do-list.git
echo ✓ Remote added
echo.

echo Step 3: Adding all files...
git add .
echo ✓ All files added
echo.

echo Step 4: Committing changes...
git commit -m "Initial commit: Todo App with custom gradient background"
echo ✓ Changes committed
echo.

echo Step 5: Setting branch to main...
git branch -M main
echo ✓ Branch set to main
echo.

echo Step 6: Pushing to GitHub...
echo.
echo NOTE: You will be prompted for GitHub credentials.
echo Use your GitHub username and a Personal Access Token (not password).
echo Generate token at: https://github.com/settings/tokens
echo.
git push -u origin main

if %errorlevel% neq 0 (
    echo.
    echo ========================================
    echo ⚠ Push to 'main' failed. Trying 'master'...
    echo ========================================
    git branch -M master
    git push -u origin master
)

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo ✓ SUCCESS! Your code is on GitHub!
    echo ========================================
    echo.
    echo View your repository at:
    echo https://github.com/Ankita123-ai/To-Do-list
    echo.
    start https://github.com/Ankita123-ai/To-Do-list
) else (
    echo.
    echo ========================================
    echo ⚠ Authentication Required
    echo ========================================
    echo.
    echo The push failed because GitHub needs authentication.
    echo.
    echo To fix this:
    echo 1. Generate a Personal Access Token:
    echo    https://github.com/settings/tokens
    echo.
    echo 2. Select scope: "repo" (full control)
    echo.
    echo 3. Copy the token and use it as your password
    echo    when prompted during git push
    echo.
    echo 4. Run this script again, or run manually:
    echo    git push -u origin main
    echo.
)

pause

