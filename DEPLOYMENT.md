# Frank Media - Deployment Guide

This guide covers deploying Frank Media to production.

## Prerequisites

- Node.js 18+ installed
- npm or yarn package manager
- Environment variables configured (see below)

## Environment Variables

### Backend (.env)

```env
# Server configuration
PORT=4000
NODE_ENV=production
APP_URL=https://yourdomain.com

# Payment configuration (Stripe)
PAYMENT_MODE=stripe
STRIPE_SECRET_KEY=sk_live_your_actual_key_here
```

### Frontend (.env.production)

```env
VITE_API_URL=https://api.yourdomain.com
```

**Important**: Never commit actual API keys or secrets to version control. Use your platform's secret management system.

## Building for Production

### Build Both Frontend and Backend

```bash
npm run build
```

This will:
1. Build the frontend with optimizations (minification, code splitting)
2. Verify the backend code syntax

### Build Frontend Only

```bash
cd frontend
npm run build
npm run preview  # Preview the production build locally
```

### Backend in Production

```bash
cd backend
npm install --production  # Install only production dependencies
NODE_ENV=production node src/index.js
```

## Deployment Checklist

- [ ] All environment variables are set correctly
- [ ] `NODE_ENV=production` is set on backend server
- [ ] Frontend `.env.production` points to the correct API URL
- [ ] SSL/TLS certificate is configured (use HTTPS)
- [ ] CORS origins in backend allow your production domain
- [ ] Rate limiting is appropriate for your expected traffic
- [ ] Error logs are monitored for issues
- [ ] Database/storage is configured (if needed)
- [ ] Stripe keys are using production keys (not test keys)
- [ ] All security headers are in place (Helmet is configured)

## Security Best Practices

1. **Environment Secrets**: Use your platform's secret management:
   - AWS Secrets Manager
   - Heroku Config Vars
   - Vercel Environment Variables
   - Your hosting provider's secret management

2. **HTTPS Only**: Always use HTTPS in production

3. **CORS**: Update the `allowedOrigins` array in `backend/src/index.js` with your actual domain(s)

4. **Rate Limiting**: The API includes rate limiting (120 requests per 15 minutes). Adjust as needed.

5. **Helmet**: Security headers are configured via Helmet middleware.

6. **Input Validation**: All user inputs are validated with Zod schemas.

## Deployment Options

### Option 1: Traditional VPS (AWS EC2, DigitalOcean, Linode, etc.)

1. Install Node.js and npm
2. Clone the repository
3. Copy `.env` and `.env.production` files
4. Install dependencies: `npm install`
5. Build: `npm run build`
6. Use a process manager like PM2 to run the backend:
   ```bash
   npm install -g pm2
   pm2 start backend/src/index.js --name "frank-media-api"
   ```
7. Serve frontend with Nginx or Apache
8. Set up SSL with Let's Encrypt

### Option 2: Heroku

```bash
# Backend
cd backend
heroku create your-api-name
heroku config:set STRIPE_SECRET_KEY=sk_live_...
git push heroku main

# Frontend (optional - can be served separately)
cd ../frontend
npm run build
# Deploy dist folder to a CDN or static hosting
```

### Option 3: Vercel (Frontend) + Render/Railway (Backend)

**Frontend on Vercel**:
1. Connect GitHub repository
2. Set `VITE_API_URL` environment variable
3. Auto-deploys on push

**Backend on Render/Railway**:
1. Connect GitHub repository
2. Set environment variables in platform
3. Deploy

### Option 4: Docker

Create a multi-stage Dockerfile to containerize both services.

## Monitoring and Maintenance

1. **Log Monitoring**: Monitor logs for errors and warnings
2. **Uptime Monitoring**: Use services like StatusCake or Pingdom
3. **Performance**: Monitor response times and error rates
4. **Security**: Regular security audits and updates

## Troubleshooting

### "Checkout creation failed" Error

- Verify `STRIPE_SECRET_KEY` is set correctly
- Check CORS origins include your frontend URL
- Verify `APP_URL` matches your frontend domain

### CORS Errors

Update the `allowedOrigins` array in `backend/src/index.js`:

```javascript
const allowedOrigins = [
  appUrl,  // Uses APP_URL from .env
  "https://yourdomain.com",
  "https://www.yourdomain.com",
];
```

### API Connection Issues

Ensure:
1. Backend is running on the correct port
2. Frontend `VITE_API_URL` is set correctly
3. Firewall allows the API port
4. SSL certificates are valid (if using HTTPS)

## Support

For issues or questions about deployment, check the main README.md or contact support.
