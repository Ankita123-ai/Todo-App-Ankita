@echo off
title Check GitHub Status
color 0B
cls
echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║     CHECK GITHUB REPOSITORY STATUS                          ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.

echo Checking Git status...
echo ═══════════════════════════════════════════════════════════════
echo.
git status
echo.
echo ═══════════════════════════════════════════════════════════════
echo.

echo Checking remote repository...
echo ═══════════════════════════════════════════════════════════════
echo.
git remote -v
echo.
echo ═══════════════════════════════════════════════════════════════
echo.

echo Checking if changes are committed...
echo ═══════════════════════════════════════════════════════════════
echo.
git log --oneline -3
echo.
echo ═══════════════════════════════════════════════════════════════
echo.

echo Checking if local is ahead of remote...
echo ═══════════════════════════════════════════════════════════════
echo.
git status -sb
echo.
echo ═══════════════════════════════════════════════════════════════
echo.

if %errorlevel% equ 0 (
    echo.
    echo If you see "ahead of" or uncommitted changes,
    echo run: COMMIT-AND-PUSH-CHANGES.bat
    echo.
) else (
    echo.
    echo ⚠ Git repository may not be initialized
    echo.
)

echo.
pause

