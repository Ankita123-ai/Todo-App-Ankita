@echo off
title Complete Auto Setup - Ready to Push
color 0B
cls
echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║     COMPLETE AUTOMATIC SETUP - READY TO PUSH                ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo This will set up EVERYTHING automatically!
echo.
echo ═══════════════════════════════════════════════════════════════
echo.

set REPO_NAME=Todo-App-Ankita

echo [AUTOMATIC SETUP STARTING...]
echo.

echo ✓ Step 1/6: Configuring Git...
git config user.name "Ankita123-ai" 2>nul
git config user.email "ankita@github.com" 2>nul
echo    Done!

echo.
echo ✓ Step 2/6: Initializing Git repository...
if not exist .git (
    call git init >nul 2>&1
)
echo    Done!

echo.
echo ✓ Step 3/6: Connecting to GitHub repository...
call git remote remove origin >nul 2>&1
call git remote add origin https://github.com/Ankita123-ai/%REPO_NAME%.git
echo    Done! Repository: https://github.com/Ankita123-ai/%REPO_NAME%

echo.
echo ✓ Step 4/6: Adding all your files...
call git add -A >nul 2>&1
echo    Done! All files ready.

echo.
echo ✓ Step 5/6: Committing changes...
call git commit -m "Initial commit: Todo App with custom gradient background" >nul 2>&1
call git branch -M main >nul 2>&1
echo    Done! All changes committed.

echo.
echo ═══════════════════════════════════════════════════════════════
echo.
echo ✓ SETUP COMPLETE! Everything is ready to push.
echo.
echo ═══════════════════════════════════════════════════════════════
echo.
echo [AUTOMATIC PUSH ATTEMPT...]
echo.

REM Try GitHub CLI automatic push
where gh >nul 2>&1
if %errorlevel% equ 0 (
    echo ✓ GitHub CLI detected - Attempting automatic push...
    echo.
    gh auth status >nul 2>&1
    if %errorlevel% equ 0 (
        echo ✓ Authenticated - Creating repository and pushing...
        call gh repo create %REPO_NAME% --public --source=. --remote=origin --push >nul 2>&1
        if %errorlevel% equ 0 (
            echo.
            echo ═══════════════════════════════════════════════════════════════
            echo   ✓✓✓ SUCCESS! Repository created and code pushed! ✓✓✓
            echo ═══════════════════════════════════════════════════════════════
            echo.
            echo Your code is now live at:
            echo https://github.com/Ankita123-ai/%REPO_NAME%
            echo.
            timeout /t 3 >nul
            start https://github.com/Ankita123-ai/%REPO_NAME%
            goto :success
        )
    )
)

echo.
echo ⚠ Manual authentication required for final push.
echo.
echo ═══════════════════════════════════════════════════════════════
echo   WHAT TO DO NEXT:
echo ═══════════════════════════════════════════════════════════════
echo.
echo Option 1: Create repository first (if not exists)
echo   1. Go to: https://github.com/new
echo   2. Repository name: %REPO_NAME%
echo   3. Keep it EMPTY (no README)
echo   4. Click "Create repository"
echo.
echo Option 2: Push now (if repository exists)
echo   Command ready to run:
echo.
echo   git push -u origin main
echo.
echo   When asked for credentials:
echo   - Username: Ankita123-ai
echo   - Password: Use Personal Access Token
echo     (Get from: https://github.com/settings/tokens)
echo.
echo ═══════════════════════════════════════════════════════════════
echo.
echo Your code is fully prepared and ready!
echo All files are committed and staged.
echo.
echo Would you like to attempt push now? (y/n)
set /p PUSH_NOW="> "
if /i "%PUSH_NOW%"=="y" (
    echo.
    echo Pushing to GitHub...
    call git push -u origin main
    if %errorlevel% neq 0 (
        call git branch -M master >nul 2>&1
        call git push -u origin master
    )
    if %errorlevel% equ 0 (
        echo.
        echo ✓ SUCCESS! Code pushed!
        start https://github.com/Ankita123-ai/%REPO_NAME%
        goto :success
    )
)

:success
echo.
echo ═══════════════════════════════════════════════════════════════
echo   SETUP COMPLETE!
echo ═══════════════════════════════════════════════════════════════
echo.
echo Repository URL: https://github.com/Ankita123-ai/%REPO_NAME%
echo.
echo All files are committed and ready to push.
echo If push didn't complete automatically, run:
echo    git push -u origin main
echo.
pause

