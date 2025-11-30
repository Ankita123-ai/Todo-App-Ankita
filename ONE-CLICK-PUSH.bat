@echo off
cd /d "%~dp0"
echo Starting automatic push setup...
echo.

REM Configure git
git config user.name "Ankita123-ai" 2>nul
git config user.email "ankita@github.com" 2>nul

REM Initialize
if not exist .git git init

REM Setup remote
git remote remove origin 2>nul
git remote add origin https://github.com/Ankita123-ai/Todo-App-Ankita.git

REM Add and commit
git add -A
git commit -m "Initial commit: Todo App with custom gradient background" 2>nul
git branch -M main 2>nul

REM Try GitHub CLI first
where gh >nul 2>&1
if %errorlevel% equ 0 (
    gh auth status >nul 2>&1
    if %errorlevel% equ 0 (
        echo Using GitHub CLI to create and push...
        gh repo create Todo-App-Ankita --public --source=. --remote=origin --push 2>nul
        if %errorlevel% equ 0 (
            echo ✓ Success! Repository created and pushed!
            start https://github.com/Ankita123-ai/Todo-App-Ankita
            exit /b 0
        )
    )
)

REM Fallback to regular push
echo Pushing to GitHub...
echo Note: You may need to create repository first at https://github.com/new
echo.
git push -u origin main 2>nul
if %errorlevel% neq 0 (
    git branch -M master 2>nul
    git push -u origin master 2>nul
)

if %errorlevel% equ 0 (
    echo ✓ Success!
    start https://github.com/Ankita123-ai/Todo-App-Ankita
) else (
    echo.
    echo Setup complete but push needs authentication.
    echo Run: git push -u origin main
    echo Use Personal Access Token as password.
)

pause

