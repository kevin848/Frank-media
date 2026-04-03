# 🚀 Deploy Frank Media to GitHub & Render.com

## Step 1: Initialize Git & Push to GitHub

Run these commands in PowerShell from your project directory:

```powershell
cd C:\Users\USER\frank-media

# Initialize git repository
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit - Frank Media booking system"

# Rename branch to main
git branch -M main

# Add remote (replace kevin848 with your username)
git remote add origin https://github.com/kevin848/frank-media.git

# Push to GitHub
git push -u origin main
```

---

## Step 2: Create GitHub Repository

1. Go to **github.com**
2. Click **+** (top right) → **New repository**
3. Name it: `frank-media`
4. Leave other settings default
5. Click **Create repository**

---

## Step 3: Deploy Backend to Render

1. Go to **https://render.com**
2. Sign up with GitHub account (kevin848)
3. Click **New +** → **Web Service**
4. **Connect GitHub** → Select `frank-media`
5. Fill in:
   - **Name**: `frank-media-api`
   - **Root Directory**: `backend`
   - **Runtime**: Node
   - **Build Command**: `npm install`
   - **Start Command**: `node src/index.js`

6. Click **Advanced** → Add these **Environment Variables**:
   ```
   NODE_ENV = production
   ADMIN_PASSWORD = admin123
   PAYMENT_MODE = mock
   PORT = 4000
   ```

7. Click **Create Web Service**
8. **Wait 2-3 minutes** for deployment
9. **Copy the URL** when it's done (e.g., `https://frank-media-api.onrender.com`)

---

## Step 4: Deploy Frontend to Render

1. In Render dashboard, click **New +** → **Web Service** (same repo)
2. **Connect GitHub** → Select `frank-media` again
3. Fill in:
   - **Name**: `frank-media-web`
   - **Root Directory**: `frontend`
   - **Runtime**: Node
   - **Build Command**: `npm install && npm run build`
   - **Start Command**: `npm run preview`

4. Click **Advanced** → Add **Environment Variable**:
   ```
   VITE_API_URL = https://frank-media-api.onrender.com
   ```
   *(Use the API URL from Step 3)*

5. Click **Create Web Service**
6. **Wait 2-3 minutes** for deployment

---

## Step 5: You're Live! 🎉

Once both services finish deploying:

**Website URL**: `https://frank-media-web.onrender.com`
**Admin URL**: `https://frank-media-web.onrender.com/admin`
**Admin Password**: `admin123`

---

## Share With Customer

Send them this URL:
```
https://frank-media-web.onrender.com
```

Tell them:
- "This is your live Frank Media booking website"
- "You can test booking a service"
- "It's completely free and ready for feedback"

---

## Test The System

### Customer Testing:
1. Visit `https://frank-media-web.onrender.com`
2. Go to **Booking** page
3. Fill out a test booking:
   - Customer Name: "John Test"
   - Email: "john@test.com"
   - Phone: "0784123456"
   - Select a plan
   - Enter event date & details
4. Complete mock payment
5. See success page

### Admin Testing:
1. Visit `https://frank-media-web.onrender.com/admin`
2. Login: password `admin123`
3. See the test booking in dashboard
4. Try all features:
   - Approve/reject bookings
   - **Add Booking** → Create booking from "phone call"
   - **Rates** → Edit a plan price
   - **Analytics** → View stats

---

## If Something Goes Wrong

### "Can't connect to backend"
- Copy your backend URL from Render
- Go to frontend service settings
- Update `VITE_API_URL` env variable
- Wait for redeploy (1-2 min)

### "Service not found"
- Click the service in Render
- Check the **Logs** tab for errors
- Wait 2-3 minutes for full startup

### "API health check failed"
- Visit `https://frank-media-api.onrender.com/api/health`
- Should show: `{"ok":true,"service":"frank-media-api",...}`

---

## GitHub Repo Structure (What Gets Pushed)

```
frank-media/
├── backend/
│   ├── src/index.js
│   ├── package.json
│   └── .gitignore
├── frontend/
│   ├── src/
│   ├── package.json
│   └── vite.config.ts
├── .gitignore
├── package.json
├── QUICK_DEPLOY.md
├── HOSTING_GUIDE.md
├── DEPLOYMENT.md
└── README.md
```

---

## Next Steps After Going Live

1. **Share with customer** - Get their feedback
2. **Track issues** - Note what they request
3. **Plan updates** - Prepare customizations based on feedback
4. **Scale up** - Move to permanent hosting when ready

---

## Total Time: ~10 Minutes

✅ Push to GitHub: 2 min
✅ Setup Render backend: 3 min
✅ Setup Render frontend: 3 min
✅ Wait for deployment: 2 min

---

**You're about to go live! Follow the steps above and your Frank Media system will be online.** 🚀
