# 🌐 Netlify Deployment Guide

## Quick Deploy (2 minutes)

### Option A: Drag & Drop (Easiest)
1. Go to: https://netlify.com
2. Sign up/login with GitHub
3. Click "Drag and drop your site output here"
4. Drag the entire `frontend/dist` folder
5. **INSTANT LIVE URL!** 🎉

### Option B: GitHub Connect (Auto-deploy)
1. Click "Add new site" → "Import an existing project"
2. Connect GitHub → Select `kevin848/frank-media`
3. Settings:
   - Build command: `npm install && npm run build`
   - Publish directory: `frontend/dist`
   - Base directory: `frontend`
4. Click "Deploy site"

## Environment Variables (Important!)
After deployment, go to Site settings → Environment variables:
- `VITE_API_URL`: `https://your-backend-url.vercel.app` (if you deploy backend)
- Or use mock API for now: Leave empty

## What You Get
- 🌐 Live URL: `https://your-name-123456.netlify.app`
- 🔐 Admin: `https://your-name-123456.netlify.app/admin`
- 📱 Mobile responsive
- 💾 Free SSL certificate
- 🚀 Global CDN

## Test After Deployment
1. Visit your Netlify URL
2. Test booking form
3. Visit `/admin` → Login: `admin123`
4. Test dashboard functionality

## Need Backend?
For full admin functionality, deploy backend separately:
- Backend: Render.com, Vercel, or Railway
- Add API URL to Netlify environment variables

## Success!
Your Frank Media website will be live and shareable! 🎯
