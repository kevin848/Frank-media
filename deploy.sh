#!/bin/bash

# Frank Media - Bash Deployment Script (for macOS/Linux)
# This script handles GitHub push and provides Render deployment steps

set -e

clear

echo "============================================"
echo "Frank Media - Deployment Script"
echo "============================================"
echo ""

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "ERROR: Git is not installed"
    echo "Please install from: https://git-scm.com"
    exit 1
fi

echo "✓ Git is installed"
echo ""

# Step 1: Create GitHub repository
echo "============================================"
echo "STEP 1: Create GitHub Repository"
echo "============================================"
echo ""
echo "Go to: https://github.com/new"
echo ""
echo "Settings:"
echo "  • Name: frank-media"
echo "  • Public"
echo "  • Do NOT initialize with files"
echo "  • Create repository"
echo ""
read -p "Press Enter once repository is created..."

# Step 2: Authentication
echo ""
echo "============================================"
echo "STEP 2: GitHub Authentication"
echo "============================================"
echo ""
echo "OPTION A: Personal Access Token (Recommended)"
echo "  1. Go to: https://github.com/settings/tokens"
echo "  2. Click 'Generate new token' > 'Tokens (classic)'"
echo "  3. Name: frank-media-deploy"
echo "  4. Scopes: repo, admin:repo_hook"
echo "  5. Copy the token"
echo ""
echo "OPTION B: SSH Key"
echo "  1. Generate: ssh-keygen -t ed25519"
echo "  2. Add to: https://github.com/settings/ssh/new"
echo ""
read -p "Press Enter once credentials are ready..."

# Step 3: Push to GitHub
echo ""
echo "============================================"
echo "STEP 3: Push to GitHub"
echo "============================================"
echo ""

echo "Pushing code..."
if git push -u origin main; then
    echo ""
    echo "✓ Push successful!"
    echo ""
    echo "Your code is on GitHub:"
    git remote -v
else
    echo ""
    echo "✗ Push failed!"
    echo ""
    echo "Troubleshooting:"
    echo "  • Verify personal access token"
    echo "  • Check SSH key setup"
    echo "  • Verify remote: git remote -v"
    exit 1
fi

# Step 4: Deploy to Render
echo ""
echo "============================================"
echo "STEP 4: Deploy to Render"
echo "============================================"
echo ""
echo "Go to: https://render.com"
echo ""
echo "A. Sign up with GitHub (account: kevin848)"
echo ""
echo "B. Deploy from render.yaml file:"
echo "   • Backend: frank-media-api"
echo "   • Frontend: frank-media-web"
echo ""
echo "C. Or manually create services:"
echo ""
echo "   BACKEND:"
echo "   • Type: Web Service"
echo "   • Root: backend"
echo "   • Build: npm install"
echo "   • Start: node src/index.js"
echo ""
echo "   FRONTEND:"
echo "   • Type: Static Site"
echo "   • Root: frontend"
echo "   • Build: npm install && npm run build"
echo "   • Publish: dist"
echo "   • Set VITE_API_URL to backend URL"
echo ""
read -p "Press Enter once deployment is complete..."

echo ""
echo "============================================"
echo "SUCCESS!"
echo "============================================"
echo ""
echo "Next steps:"
echo "  1. Get live URLs from Render"
echo "  2. Test the website"
echo "  3. Test admin (password: admin123)"
echo "  4. Share with customer"
echo ""
