@echo off
echo ========================================
echo Pushing to GitHub Repository
echo Repository: https://github.com/Ankita123-ai/To-Do-list
echo ========================================
echo.

echo Step 1: Removing old remote...
git remote remove origin 2>nul

echo Step 2: Adding your GitHub repository...
git remote add origin https://github.com/Ankita123-ai/To-Do-list.git

echo Step 3: Adding all files...
git add .

echo Step 4: Committing changes...
git commit -m "Initial commit: Todo App with custom gradient background"

echo.
echo Step 5: Pushing to GitHub...
echo.
git push -u origin main

if %errorlevel% neq 0 (
    echo.
    echo Trying 'master' branch instead...
    git push -u origin master
)

echo.
echo ========================================
echo Done! Check your repository at:
echo https://github.com/Ankita123-ai/To-Do-list
echo ========================================
pause

