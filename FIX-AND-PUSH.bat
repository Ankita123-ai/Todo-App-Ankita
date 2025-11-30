@echo off
title Fix and Push to GitHub
color 0A
echo.
echo ================================================================
echo   FIXING AND PUSHING TO GITHUB
echo ================================================================
echo.
echo This script will:
echo   1. Initialize git (if needed)
echo   2. Remove old remotes
echo   3. Add your GitHub repository
echo   4. Add ALL files
echo   5. Commit everything
echo   6. Push to GitHub
echo.
echo ================================================================
echo.
pause

echo.
echo [STEP 1] Initializing Git...
if not exist .git (
    git init
    echo    ✓ Git initialized
) else (
    echo    ✓ Git already initialized
)
echo.

echo [STEP 2] Setting up remote...
git remote remove origin 2>nul
git remote add origin https://github.com/Ankita123-ai/To-Do-list.git
echo    ✓ Remote configured: https://github.com/Ankita123-ai/To-Do-list.git
echo.

echo [STEP 3] Adding ALL files...
git add -A
echo    ✓ All files added
echo.

echo [STEP 4] Checking what will be committed...
git status --short
echo.

echo [STEP 5] Committing changes...
git commit -m "Initial commit: Todo App with custom gradient background" 2>&1
if %errorlevel% equ 0 (
    echo    ✓ Changes committed successfully
) else (
    echo    ⚠ Commit may have failed or nothing to commit
    echo    Checking status...
    git status
)
echo.

echo [STEP 6] Setting default branch to main...
git branch -M main 2>nul
echo    ✓ Branch set to main
echo.

echo [STEP 7] Pushing to GitHub...
echo.
echo    ⚠ IMPORTANT: You will be prompted for credentials
echo.
echo    Username: Your GitHub username (Ankita123-ai)
echo    Password: Use a Personal Access Token
echo.
echo    If you don't have a token:
echo    1. Go to: https://github.com/settings/tokens
echo    2. Click "Generate new token (classic)"
echo    3. Select scope: "repo"
echo    4. Copy the token and use it as password
echo.
echo ================================================================
echo.

git push -u origin main --verbose

if %errorlevel% neq 0 (
    echo.
    echo ================================================================
    echo   Push to 'main' failed. Trying 'master'...
    echo ================================================================
    echo.
    git branch -M master 2>nul
    git push -u origin master --verbose
)

if %errorlevel% equ 0 (
    echo.
    echo ================================================================
    echo   ✓ SUCCESS! Code pushed to GitHub!
    echo ================================================================
    echo.
    echo Your repository is now at:
    echo https://github.com/Ankita123-ai/To-Do-list
    echo.
    echo Opening in browser...
    timeout /t 2 >nul
    start https://github.com/Ankita123-ai/To-Do-list
) else (
    echo.
    echo ================================================================
    echo   ⚠ PUSH FAILED - Common Issues:
    echo ================================================================
    echo.
    echo 1. Authentication Error:
    echo    - Make sure you used Personal Access Token (not password)
    echo    - Generate token: https://github.com/settings/tokens
    echo    - Select scope: "repo" (full control)
    echo.
    echo 2. Repository doesn't exist or you don't have access:
    echo    - Check: https://github.com/Ankita123-ai/To-Do-list
    echo    - Make sure you're logged in with the correct account
    echo.
    echo 3. Repository might not be empty:
    echo    - If repo has files, you may need to pull first
    echo    - Run: git pull origin main --allow-unrelated-histories
    echo    - Then push again
    echo.
    echo 4. Check the error message above for specific details
    echo.
)

echo.
pause

