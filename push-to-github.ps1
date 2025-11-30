# PowerShell script to push Todo App to GitHub
# Run this by right-clicking and selecting "Run with PowerShell"

Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  PUSHING TODO APP TO GITHUB" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Repository: https://github.com/Ankita123-ai/To-Do-list" -ForegroundColor Yellow
Write-Host ""

# Step 1: Initialize Git
Write-Host "[1/6] Initializing Git repository..." -ForegroundColor Green
if (-not (Test-Path .git)) {
    git init
    Write-Host "   ✓ Git repository initialized" -ForegroundColor Green
} else {
    Write-Host "   ✓ Git repository already exists" -ForegroundColor Green
}
Write-Host ""

# Step 2: Configure remote
Write-Host "[2/6] Setting up remote repository..." -ForegroundColor Green
git remote remove origin 2>$null
git remote add origin https://github.com/Ankita123-ai/To-Do-list.git
Write-Host "   ✓ Remote configured" -ForegroundColor Green
Write-Host ""

# Step 3: Add all files
Write-Host "[3/6] Adding all files..." -ForegroundColor Green
git add -A
Write-Host "   ✓ All files staged" -ForegroundColor Green
Write-Host ""

# Step 4: Commit
Write-Host "[4/6] Committing changes..." -ForegroundColor Green
git commit -m "Initial commit: Todo App with custom gradient background" 2>&1 | Out-Null
Write-Host "   ✓ Changes committed" -ForegroundColor Green
Write-Host ""

# Step 5: Set branch
Write-Host "[5/6] Setting branch to main..." -ForegroundColor Green
git branch -M main 2>$null
Write-Host "   ✓ Branch set to main" -ForegroundColor Green
Write-Host ""

# Step 6: Push
Write-Host "[6/6] Pushing to GitHub..." -ForegroundColor Green
Write-Host ""
Write-Host "⚠ AUTHENTICATION REQUIRED" -ForegroundColor Yellow
Write-Host ""
Write-Host "When prompted:" -ForegroundColor White
Write-Host "  Username: Ankita123-ai" -ForegroundColor White
Write-Host "  Password: Use Personal Access Token (not your password)" -ForegroundColor White
Write-Host ""
Write-Host "Get token at: https://github.com/settings/tokens" -ForegroundColor Cyan
Write-Host ""
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

$result = git push -u origin main 2>&1

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "================================================================" -ForegroundColor Green
    Write-Host "  ✓ SUCCESS! Code pushed to GitHub!" -ForegroundColor Green
    Write-Host "================================================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "View your repository:" -ForegroundColor Cyan
    Write-Host "https://github.com/Ankita123-ai/To-Do-list" -ForegroundColor Yellow
    Write-Host ""
    Start-Process "https://github.com/Ankita123-ai/To-Do-list"
} else {
    Write-Host ""
    Write-Host "Push output:" -ForegroundColor Yellow
    Write-Host $result -ForegroundColor Red
    Write-Host ""
    Write-Host "Trying 'master' branch..." -ForegroundColor Yellow
    git branch -M master 2>$null
    $result2 = git push -u origin master 2>&1
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "✓ SUCCESS! Code pushed to GitHub!" -ForegroundColor Green
        Start-Process "https://github.com/Ankita123-ai/To-Do-list"
    } else {
        Write-Host ""
        Write-Host "================================================================" -ForegroundColor Red
        Write-Host "  ⚠ PUSH FAILED" -ForegroundColor Red
        Write-Host "================================================================" -ForegroundColor Red
        Write-Host ""
        Write-Host "Possible reasons:" -ForegroundColor Yellow
        Write-Host "1. Authentication failed - use Personal Access Token" -ForegroundColor White
        Write-Host "2. Repository doesn't exist or no access" -ForegroundColor White
        Write-Host "3. Network issues" -ForegroundColor White
        Write-Host ""
        Write-Host "Error details:" -ForegroundColor Yellow
        Write-Host $result2 -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

