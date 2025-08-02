// server.js
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
const PORT = 3000;

let reports = []; // In-memory data store

app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Endpoint to receive lost/found item submissions
app.post('/submit', (req, res) => {
  const data = req.body;
  reports.push(data);
  res.json({ message: 'Report submitted successfully' });
});

// Endpoint for admin to fetch data
app.get('/admin-data', (req, res) => {
  res.json(reports);
});

app.listen(PORT, () => console.log(`Server running on http://localhost:${PORT}`));
