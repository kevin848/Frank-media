#!/bin/bash

# GitHub Pages Deployment Script
# Usage: ./deploy-github-pages.sh

echo "🚀 Deploying to GitHub Pages..."

# Navigate to frontend
cd frontend

# Create docs folder if it doesn't exist
mkdir -p docs

# Copy dist to docs folder (GitHub Pages default)
echo "📋 Preparing for GitHub Pages..."
rm -rf docs/*
cp -r dist/* docs/

# Update base path in index.html for GitHub Pages
sed -i 's|<base href="/">|<base href="/frank-media/">|' docs/index.html

# Go back to root
cd ..

# Add changes and push
echo "📤 Pushing to GitHub..."
git add frontend/docs
git commit -m "Deploy to GitHub Pages"
git push origin main

echo "✅ Deployment complete!"
echo "🌐 Your site will be live at: https://kevin848.github.io/frank-media/"
echo "⏱️ Wait 2-3 minutes for GitHub Pages to activate"
echo "🔐 Admin panel at: https://kevin848.github.io/frank-media/admin"
