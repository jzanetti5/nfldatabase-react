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
    const result = await pool.query('SELECT * FROM drafted');
    res.json(result.rows);
  } catch (err) {
    console.error('Error executing query', err.stack);
    res.status(500).send(err);
  }
});

// Define a route to get colleges
app.get('/api/colleges', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM college');
    res.json(result.rows);
  } catch (err) {
    console.error('Error executing query', err.stack);
    res.status(500).send(err);
  }
});

// Define a route to get players by position
app.get('/api/players/position/:position', async (req, res) => {
  const { position } = req.params;
  try {
    const result = await pool.query('SELECT * FROM player WHERE p_postion = $1', [position]);
    res.json(result.rows);
  } catch (err) {
    console.error('Error executing query', err.stack);
    res.status(500).send(err);
  }
});

// Define a route to get teams
app.get('/api/teams', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM team');
    res.json(result.rows);
  } catch (err) {
    console.error('Error executing query', err.stack);
    res.status(500).send(err);
  }
});

// Define a route to get stats by player ID
app.get('/api/stats/player/:playerId', async (req, res) => {
  const { playerId } = req.params;
  console.log(`Fetching stats for player ID: ${playerId}`); // Log the player ID in the console
  try {
    const result = await pool.query(`
      SELECT 
        s.*, 
        p.p_firstname, 
        p.p_lastname, 
        p.p_teamabrev, 
        p.p_postion 
      FROM 
        stats s 
      JOIN 
        player p 
      ON 
        s.s_playerid = p.p_playerid 
      WHERE 
        s.s_playerid = $1
    `, [playerId]);
    if (result.rows.length === 0) {
      res.status(404).send('Player stats not found');
    } else {
      res.json(result.rows);
    }
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