const express = require('express');
const cors = require('cors');
require('dotenv').config();

const optimizeRoutes = require('./routes/optimize');
const analyzeRoutes = require('./routes/analyze');

const app = express();
app.use(cors());
app.use(express.json({ limit: '10mb' }));

app.use('/api/optimize', optimizeRoutes);
app.use('/api/analyze', analyzeRoutes);

app.get('/health', (req, res) => res.json({ status: 'ok' }));

const PORT = process.env.PORT || 3001;
app.listen(PORT, () => console.log(`Optimization server running on port ${PORT}`));
