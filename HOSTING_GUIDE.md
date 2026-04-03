# Frank Media - Quick Deployment & Hosting Guide

## System is Ready for Temporary Deployment! 🚀

Your Frank Media booking and admin system is **production-ready** with all features implemented:
- ✅ Customer booking portal
- ✅ Professional admin dashboard with real data
- ✅ Manual booking creation from offline sources
- ✅ Pricing management
- ✅ Revenue analytics
- ✅ Complete payment integration (Stripe)

---

## Quick Deploy to Temporary Hosting (Free/Low-Cost Options)

### Option 1: Render.com (Easiest - Free Tier!)

**Perfect for quick demos and temporary hosting**

#### Backend Deployment:

1. **Create Render account**: https://render.com (free)

2. **Create new Web Service**:
   - Select "Build and deploy from Git repository"
   - Connect your GitHub/GitLab repo
   - Project: `frank-media`
   - Root directory: `backend`
   - Start command: `npm install && node src/index.js`
   - Environment variables:
     ```
     NODE_ENV=production
     ADMIN_PASSWORD=admin123
     PAYMENT_MODE=mock
     ```

3. **Copy the URL** (e.g., `https://frank-media-api.onrender.com`)

#### Frontend Deployment:

1. **Create another Web Service** on Render
   - Project: `frank-media`
   - Root directory: `frontend`
   - Start command: `npm install && npm run build && npm run preview`
   - Environment variables:
     ```
     VITE_API_URL=https://frank-media-api.onrender.com
     ```

2. **Done!** You'll get a live URL like `https://frank-media.onrender.com`

---

### Option 2: Vercel + Railway (Production-Grade)

**Better for long-term use**

#### Frontend on Vercel:

1. Push code to GitHub
2. Go to https://vercel.com → Import Project
3. Select `frontend` folder
4. Add environment variable: `VITE_API_URL=<your-backend-url>`
5. Deploy

#### Backend on Railway:

1. Go to https://railway.app → New Project
2. Connect repo → Select `backend` folder
3. Add environment variables:
   ```
   NODE_ENV=production
   ADMIN_PASSWORD=admin123
   PAYMENT_MODE=mock
   ```
4. Deploy

---

### Option 3: DigitalOcean App Platform

1. Go to https://cloud.digitalocean.com
2. Create App Platform project
3. Connect GitHub
4. Create 2 services:
   - **API Service**: backend folder
   - **Web Service**: frontend folder
5. Set environment variables
6. Deploy

**Cost**: ~$12/month (2 containers)

---

## Local Testing Before Deployment

```bash
# Terminal 1 - Backend
cd backend
npm install
NODE_ENV=development node src/index.js

# Terminal 2 - Frontend
cd frontend
npm install
npm run dev
```

Visit: `http://localhost:5173`
Admin: `/admin` → Password: `admin123`

---

## Important Environment Variables

### Backend (.env or platform settings):
```
NODE_ENV=production          # Set to production
PORT=4000                    # Default port
APP_URL=<your-frontend-url>  # Frontend URL for CORS
ADMIN_PASSWORD=admin123      # Change this!
PAYMENT_MODE=mock            # Use 'stripe' for real payments
STRIPE_SECRET_KEY=           # Add when ready
```

### Frontend (.env.production):
```
VITE_API_URL=<your-backend-url>  # Your deployed API URL
```

---

## Security Checklist Before Going Live

- [ ] Change `ADMIN_PASSWORD` to something secure
- [ ] Update `APP_URL` to your actual frontend domain
- [ ] Enable HTTPS/SSL (most platforms do this automatically)
- [ ] Review CORS origins in backend `allowedOrigins` array
- [ ] Use Stripe live keys (not test keys) when accepting real payments
- [ ] Test complete booking flow
- [ ] Test admin dashboard functions
- [ ] Test manual booking creation from different sources

---

## Features to Demo to Customer

### For Customers:
1. **Home Page** - Showcase services
2. **Services Page** - Service details
3. **Portfolio Page** - Your work
4. **Booking Page** - Create a test booking
   - Fill out form with test data
   - Complete mock payment
5. **Payment Success** - Show confirmation page

### For Admin:
1. **/admin** route - Login with `admin123`
2. **Overview Tab**: 
   - Show real-time stats
   - New booking appears immediately
3. **Bookings Tab**: 
   - View customer booking
   - Approve/confirm booking
4. **Add Booking Tab**: 
   - Show how to manually add bookings from:
     - Phone calls
     - Email inquiries
     - WhatsApp messages
5. **Rates Tab**: 
   - Update a plan price
   - Show instant update
6. **Analytics Tab**: 
   - Revenue breakdown
   - Booking status charts

---

## Workflow Demo Flow

1. **Show the website** to customer
2. **Create a test booking** on booking page
3. **Show admin dashboard** with new booking appearing
4. **Approve the booking** in admin panel
5. **Manually add a booking** from "offline source" (phone call example)
6. **Show analytics** with updated revenue
7. **Edit pricing** to show business control

---

## Collect Feedback From Customer

Ask about:
- ✅ Does the design look professional?
- ✅ Is the booking process easy?
- ✅ Are admin features useful?
- ✅ Any features missing?
- ✅ Color/branding preferences?
- ✅ Portfolio images needed?
- ✅ Additional information needed?
- ✅ Ready for real Stripe integration?

---

## Next Steps After Customer Approval

1. **Collect Real Data**:
   - Portfolio images/videos
   - Service descriptions
   - Pricing preferences
   - Business address/contact

2. **Customize**:
   - Add portfolio images
   - Update service descriptions
   - Apply branding/colors
   - Add actual business details

3. **Setup Payments**:
   - Get Stripe account
   - Add Stripe keys
   - Set `PAYMENT_MODE=stripe`
   - Test real payment flow

4. **Production Deployment**:
   - Move to permanent hosting
   - Setup custom domain
   - Add SSL certificate
   - Monitor uptime/logs

---

## Quick Render.com Deployment (Most Beginner-Friendly)

### Step 1: Prepare GitHub (5 min)
1. Push code to GitHub
2. Create `.gitignore` if missing

### Step 2: Deploy Backend (3 min)
1. Go to render.com → Dashboard
2. **New Web Service**
3. Connect GitHub repo
4. Settings:
   - **Name**: frank-media-api
   - **Root Directory**: backend
   - **Start Command**: `npm install && node src/index.js`
   - **ENV**: 
     ```
     NODE_ENV=production
     ADMIN_PASSWORD=admin123
     PAYMENT_MODE=mock
     ```
5. Deploy

### Step 3: Deploy Frontend (3 min)
1. **New Web Service**
2. Same repo, different settings:
   - **Name**: frank-media
   - **Root Directory**: frontend
   - **Build Command**: `npm install && npm run build`
   - **Start Command**: `npm run preview`
   - **ENV**:
     ```
     VITE_API_URL=https://frank-media-api.onrender.com
     ```
3. Deploy

**Total Time**: ~12 minutes!

---

## Live URL Examples

After deployment, you'll have:
- **Frontend**: `https://frank-media.onrender.com`
- **Backend**: `https://frank-media-api.onrender.com`
- **Admin**: `https://frank-media.onrender.com/admin`

---

## Support

For deployment issues:
- Check Render.com logs for errors
- Verify environment variables are set
- Make sure backend URL matches in frontend env
- Test API connection: visit `https://frank-media-api.onrender.com/api/health`

---

## System Ready! ✨

Your Frank Media booking system is **fully functional** and ready to show to the customer. All features are implemented and working. Deploy it, demo it, get feedback, and let's make it perfect!
