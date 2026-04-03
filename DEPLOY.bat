@echo off
REM Frank Media - Deploy to GitHub and Render
REM This script handles the complete deployment process

echo.
echo ============================================
echo Frank Media - Deployment Script
echo ============================================
echo.

REM Check if git is installed
where git >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Git is not installed or not in PATH
    echo Please install Git from https://git-scm.com
    pause
    exit /b 1
)

REM Check if already on GitHub
cd /d %~dp0
git remote get-url origin >nul 2>nul
if %ERRORLEVEL% EQ 0 (
    echo Git remote already configured
    git remote -v
) else (
    echo ERROR: Git remote not configured
    echo Please run setup first
    pause
    exit /b 1
)

echo.
echo ============================================
echo STEP 1: Verify GitHub Repository
echo ============================================
echo.
echo Go to: https://github.com/new
echo Create repository:
echo  - Name: frank-media
echo  - Public
echo  - Do NOT initialize with files
echo.
pause

echo.
echo ============================================
echo STEP 2: GitHub Authentication
echo ============================================
echo.
echo OPTION A: Personal Access Token (Recommended)
echo  1. Go to: https://github.com/settings/tokens
echo  2. Click "Generate new token" ^> "Tokens (classic)"
echo  3. Name: frank-media-deploy
echo  4. Select scopes: repo, admin:repo_hook
echo  5. Copy the token
echo.
echo OPTION B: SSH Key
echo  1. Already set up SSH? (check: ^> ssh -T git@github.com)
echo  2. If not, run: ssh-keygen -t ed25519
echo  3. Add key to https://github.com/settings/ssh/new
echo.
pause

echo.
echo ============================================
echo STEP 3: Push to GitHub
echo ============================================
echo.

call :push_to_github
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ERROR: Failed to push to GitHub
    pause
    exit /b 1
)

echo.
echo ============================================
echo STEP 4: Deploy to Render
echo ============================================
echo.
echo Go to: https://render.com
echo.
echo A. Sign up with GitHub (same account: kevin848)
echo.
echo B. The render.yaml file will guide auto-deployment:
echo    - Backend Service: frank-media-api
echo    - Frontend Service: frank-media-web
echo.
echo C. Manual setup (if not auto-detected):
echo.
echo    Backend:
echo    - New Web Service
echo    - Connect frank-media repo
echo    - Root Directory: backend
echo    - Build: npm install
echo    - Start: node src/index.js
echo    - Environment: Add ADMIN_PASSWORD=admin123
echo.
echo    Frontend:
echo    - New Static Site
echo    - Connect frank-media repo
echo    - Root Directory: frontend
echo    - Build Command: npm install && npm run build
echo    - Publish Directory: dist
echo    - Environment: Add VITE_API_URL=[backend-url]
echo.
pause

echo.
echo ============================================
echo SUCCESS!
echo ============================================
echo.
echo Your system is now deployed!
echo.
echo Next steps:
echo  1. Get your live URLs from Render dashboard
echo  2. Test the public website
echo  3. Test admin login (password: admin123)
echo  4. Share with customer for feedback
echo.
pause
exit /b 0

:push_to_github
echo Pushing to GitHub...
git push -u origin main 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo Push failed. Troubleshooting:
    echo.
    echo 1. Check GitHub authentication:
    echo    - Verify personal access token is correct
    echo    - Or ensure SSH key is configured
    echo.
    echo 2. Verify remote:
    echo    git remote -v
    echo.
    echo 3. Try again:
    echo    git push -u origin main
    echo.
    exit /b 1
)
echo Push successful!
git remote -v
exit /b 0
