# 📸 Frank Media - Professional Media Booking Platform

A modern, full-stack booking platform for Frank Media's photography and videography services with an integrated admin dashboard for managing bookings, pricing, and analytics.

## 🌟 Features

### Customer Portal
- 🎬 Browse service packages (Starter, Signature, Cinema)
- 📅 Easy booking form with date/location selection
- 💳 Integrated payment system (Stripe ready)
- 📧 Email confirmations
- 📱 Fully responsive design

### Admin Dashboard
- 📊 **Overview Tab** - Real-time business metrics
- 📅 **Bookings Tab** - Manage customer bookings (approve/reject/mark paid)
- ➕ **Add Booking Tab** - Manually create bookings from:
  - 📞 Phone calls
  - 📧 Email inquiries
  - 💬 WhatsApp messages
  - 🤝 In-person meetings
  - 📱 Social media
- 💰 **Rates Tab** - Update service pricing dynamically
- 📈 **Analytics Tab** - Revenue breakdown & booking statistics

## 🚀 Quick Start

### Prerequisites
- Node.js 18+
- npm or yarn
- PostgreSQL 14+ (local or managed)

### Local Development

```bash
# Install dependencies
npm install

# Initialize PostgreSQL schema + seed plans
npm --prefix backend run db:init

# Optional local DB fallback when PostgreSQL is unavailable
# backend/.env -> ALLOW_SQLITE_FALLBACK=true

# Run both backend and frontend
npm run dev

# Or run separately:
# Terminal 1 - Backend
cd backend
npm run dev

# Terminal 2 - Frontend
cd frontend
npm run dev
```

- Frontend: http://localhost:5173
- Backend: http://localhost:4000
- Admin: http://localhost:5173/admin (password: admin123)

### Build for Production

```bash
npm run build
```

## 📁 Project Structure

```
frank-media/
├── backend/
│   ├── src/
│   │   └── index.js          # Express API server
│   ├── package.json
│   └── .env.example
├── frontend/
│   ├── src/
│   │   ├── pages/
│   │   │   ├── Admin.tsx      # Admin dashboard
│   │   │   ├── Home.tsx
│   │   │   ├── Services.tsx
│   │   │   ├── Booking.tsx
│   │   │   └── ...
│   │   ├── components/
│   │   ├── lib/
│   │   │   └── api.ts         # API client
│   │   └── main.tsx
│   ├── package.json
│   └── vite.config.ts
├── DEPLOY_NOW.md             # Quick deployment guide
├── QUICK_DEPLOY.md           # 5-minute Render deployment
├── HOSTING_GUIDE.md          # Multiple hosting options
└── README.md                 # This file
```

## 🔧 Technology Stack

### Backend
- **Express.js** - Web framework
- **Node.js** - Runtime
- **Zod** - Data validation
- **Stripe** - Payment processing
- **CORS & Helmet** - Security
- **Rate Limiting** - Request throttling

### Frontend
- **React 19** - UI framework
- **TypeScript** - Type safety
- **Vite** - Build tool
- **TailwindCSS** - Styling
- **React Router** - Navigation
- **React Testing Library** - Testing

## 📋 API Endpoints

### Public Endpoints
- `GET /api/health` - Health check
- `GET /api/plans` - Get all service plans
- `GET /api/plans/:planId` - Get single plan
- `POST /api/payments/checkout-session` - Create payment session
- `GET /api/payments/session/:sessionId` - Verify payment
- `POST /api/contact` - Submit contact form

### Admin Endpoints (Requires Authentication)
- `POST /api/admin/verify` - Verify admin password
- `GET /api/admin/bookings` - Get all bookings
- `POST /api/admin/bookings` - Create booking manually
- `PUT /api/admin/bookings/:id` - Update booking status
- `GET /api/admin/stats` - Get business statistics
- `PUT /api/admin/plans/:planId` - Update plan pricing

## 🔐 Security

- Admin authentication via password
- CORS protection
- Rate limiting (120 requests per 15 min)
- Security headers via Helmet
- Input validation with Zod
- Environment variables for sensitive data

## 💳 Payment Processing

- **Development**: Mock payment mode (test bookings without charges)
- **Production**: Stripe integration (requires API keys)
- Automatic booking reference generation
- Payment status tracking

## 📊 Admin Features

### Real-Time Data
- Live booking count
- Revenue tracking
- Pending approvals counter
- Booking status distribution

### Booking Management
- View all customer bookings
- Approve/reject pending bookings
- Mark payment received
- Cancel bookings
- Create bookings from any source

### Pricing Management
- Update service package prices
- Changes apply immediately
- Displayed to new customers

### Analytics
- Revenue by service package
- Booking source tracking
- Monthly trends (ready for database)

## 🌐 Deployment

### Quick Deploy (Render.com - 5 minutes)
See `DEPLOY_NOW.md` for exact commands

### Other Options
See `HOSTING_GUIDE.md` for:
- Vercel + Railway
- DigitalOcean App Platform
- Heroku
- AWS

## 📱 Responsive Design

- ✅ Mobile-first approach
- ✅ Tablet optimized
- ✅ Desktop enhanced
- ✅ Touch-friendly buttons
- ✅ Readable typography

## 🎨 Customization

### Colors & Branding
Edit CSS variables in:
- `frontend/src/styles/global.css`

### Service Plans
Update in:
- `backend/src/index.js` (plans object)
- `frontend/src/data/plans.ts`

### Admin Password
Set via environment variable:
```
ADMIN_PASSWORD=your_secure_password
```

## 📞 Support

### Common Issues

**API Connection Failed**
- Check `VITE_API_URL` environment variable
- Ensure backend is running
- Verify CORS settings

**Admin Password Not Working**
- Check `ADMIN_PASSWORD` environment variable
- Verify correct password format
- Clear browser cache & try again

**Payment Not Processing**
- Confirm Stripe keys are set
- Check payment mode setting
- Verify currency format

## 📈 Next Steps

1. **Customize Content**
   - Add your logo & branding
   - Update service descriptions
   - Add portfolio images

2. **Setup Payments**
   - Get Stripe account
   - Add Stripe API keys
   - Test payment flow

3. **Production Ready**
   - Configure custom domain
   - Setup email notifications
   - Enable SMS messages
   - Configure DB backups and monitoring

## 📄 License

Private project - Frank Media Services

## 👤 Admin Panel

Access admin dashboard:
```
URL: /admin
Default Password: admin123
```

⚠️ **Important**: Change admin password before going live!

---

**Frank Media - Professional Media Services Management Platform**

Built with ❤️ using modern web technologies
