# 🚀 COPY-PASTE DEPLOYMENT GUIDE FOR RENDER.COM

## ⚡ You're logged in to Render.com - Follow these EXACT steps

---

## STEP 1: CREATE BACKEND SERVICE (5 minutes)

**In Render.com dashboard:**

1. Click **"New +"** button (top right)
2. Select **"Web Service"**
3. You'll see "Connect a repository" - Click **"GitHub"**
4. Select repository: **`frank-media`** (if not shown, might need to authorize GitHub)

### Fill in these EXACT values:

| Field | Value |
|-------|-------|
| **Name** | frank-media-api |
| **Runtime** | Node |
| **Region** | Oregon (or your choice) |
| **Branch** | main |
| **Root Directory** | backend |
| **Build Command** | npm install |
| **Start Command** | node src/index.js |
| **Plan** | Free |

### Environment Variables - COPY THESE EXACTLY:

Click "Add Environment Variable" and paste each line:

```
NODE_ENV
production

PORT
4000

ADMIN_PASSWORD
admin123

PAYMENT_MODE
mock

ALLOWED_ORIGINS
*
```

### Then:
5. Scroll down and click **"Create Web Service"**
6. Wait 2-3 minutes for deployment
7. When done, you'll see a URL like: `https://frank-media-api.onrender.com`
8. **✅ COPY THIS URL - YOU'LL NEED IT NEXT**

---

## STEP 2: CREATE FRONTEND SERVICE (5 minutes)

**In Render.com dashboard:**

1. Click **"New +"** button again
2. Select **"Static Site"** (NOT Web Service this time)
3. Select repository: **`frank-media`**

### Fill in these EXACT values:

| Field | Value |
|-------|-------|
| **Name** | frank-media-web |
| **Branch** | main |
| **Root Directory** | frontend |
| **Build Command** | npm install && npm run build |
| **Publish Directory** | dist |
| **Plan** | Free |

### Environment Variables - PASTE EXACTLY:

```
VITE_API_URL
https://frank-media-api.onrender.com
```

⚠️ **IMPORTANT**: Replace `frank-media-api` with your actual backend service name if different (you'll see the URL from Step 1)

### Then:
4. Click **"Create Static Site"**
5. Wait 2-3 minutes for deployment
6. When done, you'll see a URL like: `https://frank-media-web.onrender.com`

---

## ✅ YOU'RE LIVE!

Your system is now deployed:

| Component | URL |
|-----------|-----|
| Website | `https://frank-media-web.onrender.com` |
| Admin Panel | `https://frank-media-web.onrender.com/admin` |
| API | `https://frank-media-api.onrender.com` |

---

## 🧪 TEST IT IMMEDIATELY

### Test 1: Visit Website
```
Go to: https://frank-media-web.onrender.com

✓ Page should load
✓ Click "Get Started" or "Book Now"
✓ Try submitting a booking
✓ Should see success message
```

### Test 2: Admin Panel
```
Go to: https://frank-media-web.onrender.com/admin

✓ Login form should appear
✓ Enter password: admin123
✓ Dashboard should load with 5 tabs
✓ Create a test booking
✓ Approve it to verify it works
```

### If pages don't load:
- Wait 1-2 more minutes (Render takes time)
- Refresh browser (Ctrl+F5 hard refresh)
- Check Render dashboard for errors (click service → Logs tab)

---

## 📋 Deployment Complete Checklist

- [ ] Backend service created and deployed
- [ ] Backend URL obtained
- [ ] Frontend service created with correct VITE_API_URL
- [ ] Frontend service deployed
- [ ] Website loads (https://frank-media-web.onrender.com)
- [ ] Admin login works (password: admin123)
- [ ] Can create a test booking
- [ ] Analytics shows the booking

---

## 🎉 DONE!

Your system is now:
- ✅ On GitHub: https://github.com/kevin848/frank-media
- ✅ Live Backend: https://frank-media-api.onrender.com
- ✅ Live Frontend: https://frank-media-web.onrender.com
- ✅ Admin Ready: Use password `admin123`

---

## 📧 Share with Customer

```
Hi [Customer Name],

Your booking system is now live!

🌐 Website: https://frank-media-web.onrender.com

🔐 Admin Panel: https://frank-media-web.onrender.com/admin
   Password: admin123

Please test the booking form and admin features.
Send me your feedback!
```

---

## 🆘 If Deployment Fails

### Backend won't deploy?
1. Go to backend service in Render
2. Click "Logs" tab
3. Look for error messages
4. Common fixes:
   - Check Build Command is exactly: `npm install`
   - Check Start Command is exactly: `node src/index.js`
   - Check Root Directory is exactly: `backend`

### Frontend won't deploy?
1. Go to frontend service in Render
2. Click "Logs" tab
3. Look for error
4. Common fixes:
   - Check VITE_API_URL matches your backend URL exactly
   - No typos in URL
   - Make sure backend deployed first

### Admin login not working?
- Password is exactly: `admin123` (lowercase, no spaces)
- Try clearing browser cache
- Try incognito/private window

### Can't connect to API?
- Verify VITE_API_URL matches backend URL
- Wait another minute (services take time to warm up)
- Check browser console (F12) for errors

---

## ⚡ Next Steps After Deployment

1. **Share URLs with customer** (website + admin)
2. **Get feedback** on features, design, branding
3. **Implement feedback** in next iteration
4. **Setup next phase**: Email, real Stripe, custom domain

---

**YOU'RE DONE!** System is live in 15 minutes! 🎊
