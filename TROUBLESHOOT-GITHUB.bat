@echo off
title Troubleshoot GitHub Push
color 0E
echo.
echo ================================================================
echo   TROUBLESHOOTING GITHUB PUSH
echo ================================================================
echo.

echo Checking Git status...
echo ----------------------------------------
git status
echo.
echo ----------------------------------------
echo.

echo Checking remote configuration...
echo ----------------------------------------
git remote -v
echo.
echo ----------------------------------------
echo.

echo Checking recent commits...
echo ----------------------------------------
git log --oneline -3 2>nul
if %errorlevel% neq 0 (
    echo No commits found yet
)
echo.
echo ----------------------------------------
echo.

echo Checking if files are tracked...
echo ----------------------------------------
git ls-files | find /c /v "" 2>nul
if %errorlevel% equ 0 (
    echo Files are tracked
) else (
    echo No files tracked yet - need to add and commit
)
echo.
echo ----------------------------------------
echo.

echo Attempting to push...
echo ----------------------------------------
echo.
git push -u origin main 2>&1
if %errorlevel% neq 0 (
    echo.
    echo Trying master branch...
    git push -u origin master 2>&1
)
echo.
echo ----------------------------------------
echo.

pause

