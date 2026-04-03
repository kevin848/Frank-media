#!/usr/bin/env pwsh

# Frank Media - PowerShell Deployment Script
# Usage: .\DEPLOY.ps1

$ErrorActionPreference = "Stop"

function Main {
    Clear-Host
    
    Write-Host "============================================" -ForegroundColor Cyan
    Write-Host "Frank Media - Deployment Script" -ForegroundColor Cyan
    Write-Host "============================================" -ForegroundColor Cyan
    Write-Host ""

    # Check if git is installed
    $gitCheck = Get-Command git -ErrorAction SilentlyContinue
    if (-not $gitCheck) {
        Write-Host "ERROR: Git is not installed or not in PATH" -ForegroundColor Red
        Write-Host "Please install from: https://git-scm.com" -ForegroundColor Yellow
        Read-Host "Press Enter to exit"
        exit 1
    }

    # Verify we're in the right directory
    if (-not (Test-Path ".git")) {
        Write-Host "ERROR: Not in frank-media directory (no .git folder)" -ForegroundColor Red
        Read-Host "Press Enter to exit"
        exit 1
    }

    Write-Host "Git is installed ✓" -ForegroundColor Green
    Write-Host ""

    # Step 1: Verify repository
    Write-Host "============================================" -ForegroundColor Cyan
    Write-Host "STEP 1: Verify GitHub Repository" -ForegroundColor Cyan
    Write-Host "============================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Go to: https://github.com/new" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Create repository with these settings:" -ForegroundColor White
    Write-Host "  • Name: frank-media" -ForegroundColor Gray
    Write-Host "  • Public (for deployment)" -ForegroundColor Gray
    Write-Host "  • Do NOT initialize with README" -ForegroundColor Gray
    Write-Host "  • Click 'Create repository'" -ForegroundColor Gray
    Write-Host ""
    Read-Host "Press Enter once repository is created"

    # Step 2: Authentication
    Write-Host ""
    Write-Host "============================================" -ForegroundColor Cyan
    Write-Host "STEP 2: GitHub Authentication" -ForegroundColor Cyan
    Write-Host "============================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Choose authentication method:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "OPTION A: Personal Access Token (Recommended)" -ForegroundColor Green
    Write-Host "  1. Go to: https://github.com/settings/tokens" -ForegroundColor Gray
    Write-Host "  2. Click 'Generate new token' > 'Tokens (classic)'" -ForegroundColor Gray
    Write-Host "  3. Name: frank-media-deploy" -ForegroundColor Gray
    Write-Host "  4. Select scopes: repo, admin:repo_hook" -ForegroundColor Gray
    Write-Host "  5. Expiration: 30 days" -ForegroundColor Gray
    Write-Host "  6. Generate and COPY the token" -ForegroundColor Gray
    Write-Host ""
    Write-Host "OPTION B: SSH Key" -ForegroundColor Green
    Write-Host "  1. Test: ssh -T git@github.com" -ForegroundColor Gray
    Write-Host "  2. If error, generate: ssh-keygen -t ed25519" -ForegroundColor Gray
    Write-Host "  3. Add to: https://github.com/settings/ssh/new" -ForegroundColor Gray
    Write-Host ""
    Read-Host "Press Enter once you have your credentials ready"

    # Step 3: Push to GitHub
    Write-Host ""
    Write-Host "============================================" -ForegroundColor Cyan
    Write-Host "STEP 3: Push to GitHub" -ForegroundColor Cyan
    Write-Host "============================================" -ForegroundColor Cyan
    Write-Host ""

    try {
        Write-Host "Pushing code to GitHub..." -ForegroundColor Yellow
        Write-Host ""
        & git push -u origin main
        Write-Host ""
        Write-Host "✓ Push successful!" -ForegroundColor Green
        Write-Host ""
        Write-Host "Your code is now on GitHub:" -ForegroundColor Green
        & git remote -v
    }
    catch {
        Write-Host ""
        Write-Host "✗ Push failed!" -ForegroundColor Red
        Write-Host ""
        Write-Host "Troubleshooting:" -ForegroundColor Yellow
        Write-Host "  1. Verify credentials (token or SSH key)" -ForegroundColor Gray
        Write-Host "  2. Check remote: git remote -v" -ForegroundColor Gray
        Write-Host "  3. Manually try: git push -u origin main" -ForegroundColor Gray
        Read-Host "Press Enter to exit"
        exit 1
    }

    # Step 4: Deploy to Render
    Write-Host ""
    Write-Host "============================================" -ForegroundColor Cyan
    Write-Host "STEP 4: Deploy to Render.com" -ForegroundColor Cyan
    Write-Host "============================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Go to: https://render.com" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "A. Sign up with GitHub (use account: kevin848)" -ForegroundColor White
    Write-Host ""
    Write-Host "B. Deployment will auto-configure using render.yaml:" -ForegroundColor White
    Write-Host "   • Backend Service: frank-media-api" -ForegroundColor Gray
    Write-Host "   • Frontend Service: frank-media-web" -ForegroundColor Gray
    Write-Host ""
    Write-Host "C. Or manually deploy:" -ForegroundColor White
    Write-Host ""
    Write-Host "   BACKEND SERVICE:" -ForegroundColor Yellow
    Write-Host "   • Type: Web Service" -ForegroundColor Gray
    Write-Host "   • Root Directory: backend" -ForegroundColor Gray
    Write-Host "   • Build: npm install" -ForegroundColor Gray
    Write-Host "   • Start: node src/index.js" -ForegroundColor Gray
    Write-Host ""
    Write-Host "   FRONTEND SERVICE:" -ForegroundColor Yellow
    Write-Host "   • Type: Static Site" -ForegroundColor Gray
    Write-Host "   • Root Directory: frontend" -ForegroundColor Gray
    Write-Host "   • Build: npm install && npm run build" -ForegroundColor Gray
    Write-Host "   • Publish Dir: dist" -ForegroundColor Gray
    Write-Host ""
    Write-Host "   Set VITE_API_URL to your backend URL" -ForegroundColor Yellow
    Write-Host ""
    Read-Host "Press Enter once deployment is complete"

    # Success
    Write-Host ""
    Write-Host "============================================" -ForegroundColor Green
    Write-Host "DEPLOYMENT COMPLETE!" -ForegroundColor Green
    Write-Host "============================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Next Steps:" -ForegroundColor Yellow
    Write-Host "  1. Get live URLs from Render dashboard" -ForegroundColor Gray
    Write-Host "  2. Test public website" -ForegroundColor Gray
    Write-Host "  3. Test admin (/admin, password: admin123)" -ForegroundColor Gray
    Write-Host "  4. Share URLs with customer for feedback" -ForegroundColor Gray
    Write-Host ""
    Write-Host "Questions? See:" -ForegroundColor Yellow
    Write-Host "  • README.md" -ForegroundColor Gray
    Write-Host "  • DEPLOYMENT_STEPS.md" -ForegroundColor Gray
    Write-Host "  • TESTING.md" -ForegroundColor Gray
    Write-Host ""
    Read-Host "Press Enter to exit"
}

# Run main function
try {
    Main
}
catch {
    Write-Host ""
    Write-Host "ERROR: $_" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}
