# 🧪 Frank Media - Testing Guide

Complete testing procedures for all features in the booking platform.

## 🚀 Pre-Testing Setup

```bash
# Install dependencies
npm install

# Start backend (Terminal 1)
cd backend
npm run dev
# Backend running: http://localhost:4000

# Start frontend (Terminal 2)
cd frontend
npm run dev
# Frontend running: http://localhost:5173
```

## ✅ Public Features Testing

### 1. Home Page
- [ ] Page loads without errors
- [ ] All service packages display (Starter, Signature, Cinema)
- [ ] Navigation bar works
- [ ] Responsive on mobile/tablet/desktop
- [ ] "Get Started" button navigates to booking page

### 2. Services Page (`/services`)
- [ ] Displays all 3 service packages
- [ ] Package details readable
- [ ] Pricing displays correctly
- [ ] "Book Now" buttons scroll to booking form
- [ ] Load times are reasonable

### 3. Portfolio Page (`/portfolio`)
- [ ] Page loads
- [ ] Portfolio sections display
- [ ] Images load (or placeholder text appears)
- [ ] Layout is responsive

### 4. Booking Page (`/booking`)

#### Form Validation
- [ ] Can't submit empty form
- [ ] Date picker shows future dates only
- [ ] Phone number format validation (if any)
- [ ] Email validation works
- [ ] Plan selection is required

#### Form Submission
- [ ] Fill out all fields with test data:
  - Name: "John Smith"
  - Email: "john@example.com"
  - Phone: "555-0123"
  - Date: (select future date)
  - Package: (select one)
  - Location: "Downtown Studio"
- [ ] Click "Book Now"
- [ ] Success message displays
- [ ] Page remains accessible after booking

#### Payment Flow (Mock Mode)
- [ ] Payment button appears
- [ ] Click "Confirm Booking & Pay"
- [ ] Stripe modal appears (or demo payment page)
- [ ] Can complete payment flow
- [ ] Success/cancelled pages work

### 5. Pages
- [ ] About Page (`/about`) - Loads
- [ ] Services Page (`/services`) - Loads
- [ ] Portfolio Page (`/portfolio`) - Loads
- [ ] Contact Page (`/contact`) - Form works
- [ ] Terms Page (`/terms`) - Markdown renders
- [ ] Privacy Page (`/privacy`) - Markdown renders

### 6. Navigation
- [ ] All links work
- [ ] Mobile menu (hamburger) opens/closes
- [ ] Active page highlights
- [ ] Back buttons work

## 🔐 Admin Dashboard Testing

### Login Access
- [ ] Navigate to http://localhost:5173/admin
- [ ] Login form displays
- [ ] Placeholder text visible ("Enter admin password")
- [ ] Can type in password field
- [ ] "Login" button is clickable

### Admin Authentication
- [ ] Test with wrong password → Shows error message
- [ ] Test with correct password (`admin123`) → Redirects to dashboard
- [ ] Session persists (reload page → Still logged in)
- [ ] Click "Logout" → Returns to login page

### Dashboard Structure
- [ ] 5 tabs visible at top:
  1. Overview
  2. Bookings
  3. Add Booking
  4. Rates
  5. Analytics

## 📊 Tab 1: Overview

### Content Display
- [ ] "Welcome back" message shows admin name
- [ ] 4 metric cards display:
  - Total Bookings
  - Total Revenue
  - Pending Approvals
  - Confirmation Rate
- [ ] All numbers > 0 (if bookings exist)

### Real-Time Data
- [ ] Create a booking on public site
- [ ] Refresh admin dashboard
- [ ] New booking appears in metrics
- [ ] Charts and statistics update

## 📅 Tab 2: Bookings

### Data Display
- [ ] List shows all customer bookings
- [ ] Each booking shows:
  - Customer name
  - Date
  - Time
  - Package selected
  - Status (Pending/Confirmed/Paid/Cancelled)
  - Email & phone

### Booking Actions
For each pending booking, test:
- [ ] **Approve Button**
  - Status changes to "Confirmed"
  - Confirmation message appears
  - Page updates without reload
  
- [ ] **Reject Button**
  - Status changes to "Cancelled"
  - Rejection message appears
  
- [ ] **Mark Paid Button** (for confirmed bookings)
  - Status changes to "Paid"
  - Success notification shows

### Sorting & Filtering
- [ ] Can filter by status (if feature present)
- [ ] List shows pagination (if many bookings)

## ➕ Tab 3: Add Booking

### Form Fields
- [ ] All required fields present:
  - [x] Customer Name
  - [x] Email
  - [x] Phone
  - [x] Service Package (dropdown)
  - [x] Event Date
  - [x] Event Type
  - [x] Location
  - [x] Notes (optional)
  - [x] Booking Source (dropdown)

### Booking Sources
- [ ] Dropdown shows all 6 sources:
  - Phone Call
  - Email Inquiry
  - WhatsApp Message
  - In-Person Meeting
  - Social Media
  - Other

### Form Validation
- [ ] Can't submit with empty required fields
- [ ] Email must be valid format
- [ ] Date must be in future
- [ ] Phone number accepts various formats

### Booking Creation
Test creating a booking manually:

1. Fill form:
   - Name: "Phone Client"
   - Email: "phone@client.com"
   - Phone: "555-1111"
   - Package: "Signature"
   - Date: (select future date)
   - Event Type: "Wedding"
   - Location: "Hotel Ballroom"
   - Notes: "VIP client"
   - Source: "Phone Call"

2. Click "Create Booking"
   - [ ] Success notification appears
   - [ ] Form clears
   - [ ] New booking appears in Bookings tab
   - [ ] Source shows as "Phone Call"

### Multiple Sources Test
- [ ] Create 3 bookings with different sources
- [ ] Verify each source is recorded correctly
- [ ] Check analytics tab shows booking source breakdown

## 💰 Tab 4: Rates

### Current Pricing Display
- [ ] Shows all 3 packages:
  1. Starter ($499)
  2. Signature ($799)
  3. Cinema ($1,299)

- [ ] Each shows:
  - Package name
  - Current price
  - Description
  - Edit button

### Price Updates
For each package:
- [ ] Click edit button
- [ ] Price input field appears
- [ ] Change price (e.g., Signature: $899)
- [ ] Click save
- [ ] Success message appears
- [ ] Price updates immediately
- [ ] Go to booking page → New price shows

### Price Tracking
- [ ] New bookings use updated prices
- [ ] Existing bookings keep original prices
- [ ] Rates page always reflects latest prices

## 📈 Tab 5: Analytics

### Revenue Metrics
- [ ] Total Revenue displays
- [ ] Breakdown by package shows:
  - Starter bookings count & revenue
  - Signature bookings count & revenue
  - Cinema bookings count & revenue
- [ ] Math adds up: Total = Sum of packages

### Booking Statistics
- [ ] Total bookings count
- [ ] Status distribution shows:
  - Pending count
  - Confirmed count
  - Paid count
  - Cancelled count

### Booking Source Analysis
- [ ] Chart shows bookings by source
- [ ] At least one source has data
- [ ] Percentages add up to 100%
- [ ] Labels are readable

### Charts & Visualizations
- [ ] All charts render without errors
- [ ] Data matches other tabs
- [ ] No console errors when viewing analytics

## 🔄 Cross-Tab Integration Testing

### Create Booking Flow
1. Create booking from public site
2. [ ] Appears immediately in Bookings tab
3. [ ] Updates metrics in Overview tab
4. [ ] Shows in Analytics source breakdown
5. [ ] Apply when refreshing page → Still there

### Admin Create Booking Flow
1. Add booking from Admin "Add Booking" tab
2. [ ] Appears in Bookings tab with source
3. [ ] Updates Overview metrics
4. [ ] Analytics shows correct source
5. [ ] Status can be changed in Bookings tab

### Price Update Flow
1. Update price in Rates tab
2. [ ] Go to public booking page
3. [ ] New price displays
4. [ ] Create booking with new price
5. [ ] Price shows in analytics

### Status Change Flow
1. Booking in "Pending" status
2. [ ] Approve → Goes to "Confirmed"
3. [ ] Mark Paid → Goes to "Paid"
4. [ ] Overview numbers update
5. [ ] Analytics reflect change

## 🛡️ Security Testing

### Authentication
- [ ] Wrong password → Error message (doesn't leak info)
- [ ] Admin session stores in localStorage
- [ ] Logout clears session
- [ ] Direct URL access to /admin without login → Redirects

### Password Security
- [ ] Different browser → Requires login again
- [ ] Clear cache → Requires login again
- [ ] Password not visible in URL or code

### Data Privacy
- [ ] Admin data doesn't display publicly
- [ ] Public users can't access admin endpoints
- [ ] Booking details aren't exposed in HTML source

## 🎨 UI/UX Testing

### Responsive Design
Test on different screen sizes:

**Desktop (1920px width)**
- [ ] All elements visible
- [ ] Navigation bar shows full links
- [ ] Tables readable
- [ ] Charts display properly

**Tablet (768px width)**
- [ ] Layout reflows appropriately
- [ ] Mobile menu not visible
- [ ] Forms easy to fill
- [ ] Touch targets sufficient

**Mobile (375px width)**
- [ ] Hamburger menu appears
- [ ] Navigation works
- [ ] Forms stack vertically
- [ ] Text readable (16px+)
- [ ] Buttons tappable (44px+)

### Visual Consistency
- [ ] Colors consistent throughout
- [ ] Fonts readable
- [ ] Spacing looks intentional
- [ ] Icons display correctly
- [ ] No broken images

### Interactive Elements
- [ ] Buttons have hover states
- [ ] Form inputs show focus state
- [ ] Loading spinners appear when needed
- [ ] Error messages styled clearly
- [ ] Success messages show and fade

## 🔍 Performance Testing

### Load Times
- [ ] Public site initial load < 3 seconds
- [ ] Admin dashboard loads quickly
- [ ] No lag when typing in forms
- [ ] Page transitions are smooth

### Data Operations
- [ ] Creating booking is instant
- [ ] Approving booking is instant
- [ ] Updating price is instant
- [ ] No duplicate submissions on double-click

### Browser Console
- [ ] No JavaScript errors
- [ ] No warnings related to code (ignore external libs)
- [ ] Network requests all succeed (200/201)
- [ ] No CORS errors

## 📱 API Endpoint Testing

### Backend Health
```bash
curl http://localhost:4000/api/health
# Expected: { "message": "Server is running" }
```

### Get Plans
```bash
curl http://localhost:4000/api/plans
# Expected: Array of 3 plan objects
```

### Admin Endpoints (with password)
```bash
# Verify password
curl -X POST http://localhost:4000/api/admin/verify \
  -H "Content-Type: application/json" \
  -d '{"password":"admin123"}'
# Expected: { "passwordHash": "..." }

# Get bookings
curl http://localhost:4000/api/admin/bookings \
  -H "Authorization: Bearer <passwordHash>"
# Expected: Array of bookings

# Get stats
curl http://localhost:4000/api/admin/stats \
  -H "Authorization: Bearer <passwordHash>"
# Expected: { totalBookings, totalRevenue, ... }
```

### Notification Channel Test (Admin only)
Use the Admin dashboard button `Test notifications` (top-right), or call the API directly:

```bash
curl -X POST http://localhost:4000/api/admin/notifications/test \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YWRtaW4xMjM=" \
  -d '{"recipient":"admin"}'
```

Expected result:
- `delivery.admin.delivered: true` when at least one channel works.
- If all channels fail, API still returns success but `delivery.admin.delivered: false` and logs errors.

## 🐛 Known Issues & Workarounds

| Issue | Workaround |
|-------|-----------|
| Admin session lost | Refresh browser while logged in |
| Numbers don't update | Click back to Overview tab |
| Payment stuck | Hard refresh (Ctrl+Shift+R) the page |
| Form won't submit | Clear form cache: Ctrl+Shift+Delete |

## ✅ Final Checklist

Before declaring system ready:

- [ ] All public pages load without errors
- [ ] Booking form works end-to-end
- [ ] Payment flow completes (mock or real)
- [ ] Admin login works with correct password
- [ ] Admin can view all bookings
- [ ] Admin can approve/reject/mark paid
- [ ] Admin can create bookings manually
- [ ] Admin can update prices
- [ ] Analytics display accurate data
- [ ] Responsive design works on all sizes
- [ ] No JavaScript errors in console
- [ ] Mobile menu works correctly
- [ ] Performance is acceptable (< 3sec load)

## 📊 Test Report Template

```markdown
## Frank Media - Test Report
Date: [Date]
Tester: [Name]
Browser: [Browser/Version]
Device: [Device Type]

### Results
- Public Features: ✅ PASS / ⚠️ ISSUES / ❌ FAIL
- Admin Dashboard: ✅ PASS / ⚠️ ISSUES / ❌ FAIL
- API Endpoints: ✅ PASS / ⚠️ ISSUES / ❌ FAIL
- Responsive Design: ✅ PASS / ⚠️ ISSUES / ❌ FAIL
- Performance: ✅ PASS / ⚠️ ISSUES / ❌ FAIL

### Issues Found
1. [Issue Description]
   - Steps to reproduce
   - Expected behavior
   - Actual behavior
   - Severity: Critical / High / Medium / Low

### Sign-off
System Status: ✅ READY FOR DEPLOYMENT / ⚠️ NEEDS FIXES / ❌ NOT READY
```

---

**Questions?** Check `README.md` or `DEPLOY_NOW.md` for more information.
