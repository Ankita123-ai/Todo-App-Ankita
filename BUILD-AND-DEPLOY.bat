@echo off
title Build and Prepare for Deployment
color 0A
cls
echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║     BUILD APP FOR DEPLOYMENT                                ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo This will build your app for production deployment.
echo.

echo ═══════════════════════════════════════════════════════════════
echo   Step 1: Installing dependencies...
echo ═══════════════════════════════════════════════════════════════
echo.

npm install

if %errorlevel% neq 0 (
    echo.
    echo ⚠ Installation had issues. Continuing anyway...
    echo.
)

echo.
echo ═══════════════════════════════════════════════════════════════
echo   Step 2: Building production version...
echo ═══════════════════════════════════════════════════════════════
echo.

npm run build

if %errorlevel% equ 0 (
    echo.
    echo ═══════════════════════════════════════════════════════════════
    echo   ✓ BUILD SUCCESSFUL!
    echo ═══════════════════════════════════════════════════════════════
    echo.
    echo Your production files are in the 'dist' folder.
    echo.
    echo ═══════════════════════════════════════════════════════════════
    echo   NEXT STEPS - DEPLOY TO:
    echo ═══════════════════════════════════════════════════════════════
    echo.
    echo Option 1: NETLIFY (Easiest - Already configured!)
    echo   1. Go to: https://app.netlify.com/
    echo   2. Sign up/Login with GitHub
    echo   3. Click "Add new site" → "Import from Git"
    echo   4. Select your repository
    echo   5. Deploy! (Settings auto-detected)
    echo.
    echo Option 2: VERCEL (Super fast!)
    echo   1. Go to: https://vercel.com/
    echo   2. Sign up/Login with GitHub
    echo   3. Import your repository
    echo   4. Deploy!
    echo.
    echo Option 3: DRAG & DROP (Quick test)
    echo   1. Go to: https://app.netlify.com/drop
    echo   2. Drag and drop the 'dist' folder
    echo   3. Done!
    echo.
    echo ═══════════════════════════════════════════════════════════════
    echo.
    echo Would you like to preview the production build? (y/n)
    set /p PREVIEW="> "
    if /i "%PREVIEW%"=="y" (
        echo.
        echo Starting preview server...
        echo Visit: http://localhost:4173
        echo.
        npm run preview
    )
) else (
    echo.
    echo ═══════════════════════════════════════════════════════════════
    echo   ⚠ BUILD FAILED
    echo ═══════════════════════════════════════════════════════════════
    echo.
    echo Check for errors above and fix them.
    echo Common issues:
    echo   - Missing dependencies: Run 'npm install'
    echo   - TypeScript errors: Check src files
    echo   - Configuration errors: Check vite.config.ts
    echo.
)

echo.
pause

