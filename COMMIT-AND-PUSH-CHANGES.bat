@echo off
title Commit and Push Cleanup Changes to GitHub
color 0A
cls
echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║     COMMIT AND PUSH CLEANUP CHANGES TO GITHUB               ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo This will commit all deletions and push to GitHub.
echo.

echo Checking Git status...
echo ═══════════════════════════════════════════════════════════════
echo.
git status
echo.
echo ═══════════════════════════════════════════════════════════════
echo.

echo Adding all changes (including deletions)...
git add -A
echo ✓ Changes staged
echo.

echo Committing changes...
git commit -m "Clean up: Remove unnecessary helper files and scripts"
echo ✓ Changes committed
echo.

echo Pushing to GitHub...
git push origin main

if %errorlevel% neq 0 (
    echo.
    echo Trying master branch...
    git push origin master
)

if %errorlevel% equ 0 (
    echo.
    echo ═══════════════════════════════════════════════════════════════
    echo   ✓ SUCCESS! All changes pushed to GitHub!
    echo ═══════════════════════════════════════════════════════════════
    echo.
    echo Your GitHub repository is now clean!
    echo.
) else (
    echo.
    echo ═══════════════════════════════════════════════════════════════
    echo   ⚠ Push failed - Check authentication
    echo ═══════════════════════════════════════════════════════════════
    echo.
    echo Run manually:
    echo   git push origin main
    echo.
    echo Use Personal Access Token as password if needed.
    echo.
)

echo.
pause

