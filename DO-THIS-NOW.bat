@echo off
echo.
echo ================================================================
echo   RUNNING GIT COMMANDS AUTOMATICALLY
echo ================================================================
echo.
echo This will execute all git commands to push your code.
echo.
pause

echo.
echo Executing commands...
echo.

echo [1] Initializing Git...
call git init
echo.

echo [2] Adding remote...
call git remote remove origin 2>nul
call git remote add origin https://github.com/Ankita123-ai/To-Do-list.git
echo.

echo [3] Adding all files...
call git add -A
echo.

echo [4] Committing...
call git commit -m "Initial commit: Todo App with custom gradient background"
echo.

echo [5] Setting branch...
call git branch -M main 2>nul
echo.

echo [6] Pushing to GitHub...
echo.
echo You will be prompted for GitHub credentials.
echo Username: Ankita123-ai
echo Password: Use Personal Access Token
echo.
call git push -u origin main

if %errorlevel% neq 0 (
    echo.
    echo Trying master branch...
    call git branch -M master 2>nul
    call git push -u origin master
)

echo.
echo Done! Check: https://github.com/Ankita123-ai/To-Do-list
echo.
pause

