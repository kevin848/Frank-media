# 🚀 Frank Media - Deploy to Render.com (5 Minutes!)

## What You'll Get
- Live website URL: `https://frank-media.onrender.com`
- Live admin dashboard: `https://frank-media.onrender.com/admin`
- Free temporary hosting (no credit card needed for demo)

## Prerequisites
1. GitHub account (free)
2. Render.com account (free - sign up with GitHub)

## Step-by-Step Deployment

### 1. Push Code to GitHub

```bash
cd c:\Users\USER\frank-media
git init
git add .
git commit -m "Initial commit - Frank Media booking system"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/frank-media.git
git push -u origin main
```

Or just upload manually to GitHub.

### 2. Deploy Backend on Render

1. Go to **https://render.com**
2. Click **New +** → **Web Service**
3. **Connect GitHub** (select frank-media repo)
4. Fill in:
   - **Name**: `frank-media-api`
   - **Runtime**: Node
   - **Root Directory**: `backend`
   - **Build Command**: `npm install`
   - **Start Command**: `node src/index.js`

5. Click **Advanced** and add Environment Variables:
   ```
   NODE_ENV = production
   ADMIN_PASSWORD = admin123
   PAYMENT_MODE = mock
   PORT = 4000
   ```

6. Click **Create Web Service**
7. Wait for build to complete (~2 min)
8. **Copy the URL** (looks like `https://frank-media-api.onrender.com`)

### 3. Deploy Frontend on Render

1. Click **New +** → **Web Service** (same project)
2. **Connect same GitHub repo**
3. Fill in:
   - **Name**: `frank-media-web`
   - **Runtime**: Node
   - **Root Directory**: `frontend`
   - **Build Command**: `npm install && npm run build`
   - **Start Command**: `npm run preview`

4. Click **Advanced** and add Environment Variables:
   ```
   VITE_API_URL = https://frank-media-api.onrender.com
   ```
   *(Use the backend URL from step 2)*

5. Click **Create Web Service**
6. Wait for build to complete (~3 min)
7. **Copy the URL** (looks like `https://frank-media-web.onrender.com`)

### 4. Done! 🎉

- **Website**: `https://frank-media-web.onrender.com`
- **Admin**: `https://frank-media-web.onrender.com/admin`
- **Password**: `admin123`

---

## Test the Live Demo

### Customer Flow:
1. Visit the website
2. Go to **Booking** page
3. Fill out test booking details
4. Complete mock payment
5. See success page

### Admin Flow:
1. Visit `/admin`
2. Login with password: `admin123`
3. See the test booking in dashboard
4. Approve the booking
5. **Add Booking** → Manually create a booking from "phone call"
6. **Analytics** → See updated stats

---

## Share with Customer

Give them this URL:
```
https://frank-media-web.onrender.com
```

Tell them:
- "This is your live booking website"
- "Try booking a service - it's free"
- "Admin can be shown at `/admin` route"
- "All changes are saved in real-time"

---

## Common Issues

### Backend not connecting?
1. Check the API URL in frontend env: should match your backend Render URL
2. Wait 2-3 minutes - Render takes time to start
3. Visit `https://frank-media-api.onrender.com/api/health` to test

### "Service not found" error?
1. Make sure you deployed BOTH backend and frontend
2. Check that backend deployed successfully
3. Verify environment variables are set correctly

### Form won't submit?
1. Check browser console for errors
2. Verify API URL in frontend settings
3. Make sure backend is running (check Render dashboard)

---

## Important Notes

- **Free tier sleeps after 15 minutes of inactivity** - first request will be slow
- **Password is visible in code** - change `ADMIN_PASSWORD` before real deployment
- **No database** - bookings are stored in memory (lost on restart)
- **Perfect for demo** - customer will see production-like experience

---

## Next Steps After Customer Approves

1. **Get feedback** - what works, what needs changing
2. **Customize** - add real portfolio images, business details
3. **Add Stripe** - real payment processing (optional for demo)
4. **Permanent hosting** - use DigitalOcean, AWS, or keep on Render (paid)
5. **Custom domain** - point yoursite.com to the app

---

## Render.com Free Tier Benefits

✅ Free hosting  
✅ Auto-deploy on GitHub push  
✅ SSL/HTTPS included  
✅ Automatic restarts  
✅ 500 hours/month  
✅ Easy scaling later

---

## That's It!

Your Frank Media booking system is now LIVE and you can show it to customers!

Questions? The system has full error handling and logging - check the Render.com dashboard logs if anything goes wrong.
