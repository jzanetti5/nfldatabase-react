const express = require('express');
const { Pool } = require('pg');
const cors = require('cors');
const app = express();
const port = 3001;

// Use the CORS middleware
app.use(cors());

// Create a connection pool to the PostgreSQL database
const pool = new Pool({
  host: '/tmp',
  port: 8888,
  user: 'james',
  database: 'james'
});

// Define a route to get rookies
app.get('/api/rookies', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM player WHERE p_rookieStatus = 1');
    res.json(result.rows);
  } catch (err) {
    console.error('Error executing query', err.stack);
    res.status(500).send(err);
  }
});

// Define a route for the root URL
app.get('/', (req, res) => {
  res.send('Welcome to the NFL Rookies API');
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});