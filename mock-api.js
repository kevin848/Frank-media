const http = require('http');
const url = require('url');

const port = 4001;

// Mock data
const bookings = [
  {
    id: '1',
    customerName: 'Test User',
    email: 'test@example.com',
    phone: '0784386585',
    plan: 'Signature Story',
    amount: 650000,
    currency: 'RWF',
    eventDate: '2024-12-15',
    status: 'confirmed',
    createdAt: new Date().toISOString()
  }
];

const plans = [
  {
    id: 'starter',
    name: 'Starter Shoot',
    label: 'Great for intimate events',
    amountCents: 350000,
    currency: 'RWF',
    turnaround: '72 hours'
  },
  {
    id: 'signature',
    name: 'Signature Story',
    label: 'Most booked',
    amountCents: 650000,
    currency: 'RWF',
    turnaround: '5 business days'
  },
  {
    id: 'cinema',
    name: 'Cinema Production',
    label: 'High-end campaigns',
    amountCents: 1200000,
    currency: 'RWF',
    turnaround: '7 business days'
  }
];

const server = http.createServer((req, res) => {
  // Enable CORS
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') {
    res.writeHead(200);
    res.end();
    return;
  }

  const parsedUrl = url.parse(req.url, true);
  const path = parsedUrl.pathname;

  // Health check
  if (path === '/api/health') {
    res.writeHead(200, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ status: 'ok', timestamp: new Date().toISOString() }));
    return;
  }

  // Get plans
  if (path === '/api/plans') {
    res.writeHead(200, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify(plans));
    return;
  }

  // Admin verify
  if (path === '/api/admin/verify' && req.method === 'POST') {
    res.writeHead(200, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ success: true }));
    return;
  }

  // Get bookings
  if (path === '/api/admin/bookings') {
    res.writeHead(200, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify(bookings));
    return;
  }

  // Get stats
  if (path === '/api/admin/stats') {
    const stats = {
      totalBookings: bookings.length,
      totalRevenue: bookings.reduce((sum, b) => sum + b.amount, 0),
      pendingBookings: bookings.filter(b => b.status === 'pending').length,
      confirmedBookings: bookings.filter(b => b.status === 'confirmed').length,
      paidBookings: bookings.filter(b => b.status === 'paid').length
    };
    res.writeHead(200, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify(stats));
    return;
  }

  // 404 for other routes
  res.writeHead(404, { 'Content-Type': 'application/json' });
  res.end(JSON.stringify({ error: 'Not found' }));
});

server.listen(port, () => {
  console.log(`🔧 Mock API running at: http://localhost:${port}`);
  console.log(`📊 Available endpoints:`);
  console.log(`   GET  /api/health`);
  console.log(`   GET  /api/plans`);
  console.log(`   POST /api/admin/verify`);
  console.log(`   GET  /api/admin/bookings`);
  console.log(`   GET  /api/admin/stats`);
});
