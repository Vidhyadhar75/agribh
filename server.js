    const express = require('express');
    const bodyParser = require('body-parser');
    const cors = require('cors');
    const mqtt = require('mqtt');
    const mysql = require('mysql2');

    const app = express();
    const port = 3001;

    // MySQL Connection
    const db = mysql.createConnection({
    host: '34.100.191.61',
    user: 'root',
    password: 'Maybe123',
    database: 'agri'
    });

    db.connect(err => {
    if (err) {
        console.error('MySQL Connection Error:', err);
    } else {
        console.log('Connected to MySQL Database');
    }
    });

    // MQTT Connection
    const mqttClient = mqtt.connect('mqtt://34.131.227.56:1883');

    // Topics for IoT Data
    const topics = [
    'air/temperature', 'air/humidity', 'air/pressure', 'air/voc', 'air/altitude',
    'soil/moisture1', 'soil/moisture2', 'soil/ph',
    'water/motor', 'water/fogger', 'water/tank_level'
    ];
    
    mqttClient.on('connect', () => {
    console.log('Connected to MQTT Broker');
    topics.forEach(topic => mqttClient.subscribe(topic));
    });

    mqttClient.on('message', (topic, message) => {
    const value = message.toString();
    console.log(`Received: ${topic} -> ${value}`);

    // Store Data in MySQL
    const sql = `INSERT INTO sensor_data (topic, value, timestamp) VALUES (?, ?, NOW())`;
    db.query(sql, [topic, value], (err) => {
        if (err) console.error('MySQL Insert Error:', err);
    });
    let column = "";
    if (topic === "air/temperature") column = "temp";
    else if (topic === "air/humidity") column = "hum";
    else if (topic === "air/pressure") column = "airpressure";
    else if (topic === "air/voc") column = "voc";
    else if (topic === "air/altitude") column = "altitude";
    else if (topic === "soil/moisture1") column = "moisture1";
    else if (topic === "soil/moisture2") column = "moisture2";
    else if (topic === "soil/ph") column = "ph";

    if (column) {
        const sql2 = `
        INSERT INTO sensor_readings (${column})
        VALUES (?) 
        ON DUPLICATE KEY UPDATE ${column} = VALUES(${column});
        `;
        db.query(sql2, [value], (err) => {
        if (err) console.error('MySQL Insert Error in sensor_readings:', err);
        });
    }
    });

    // Middleware   
    app.use(cors());
    app.use(bodyParser.json());

    // API to fetch latest sensor data
    app.get('/api/latest', (req, res) => {
    const latestDataQuery = `
        SELECT * FROM sensor_data 
        WHERE timestamp = (SELECT MAX(timestamp) FROM sensor_data)`;

    db.query(latestDataQuery, (err, results) => {
        if (err) return res.status(500).json({ error: err.message });
        res.json(results);
    });
    });

    // API to control water motor and fogger
    app.post('/api/control/:device', (req, res) => {
        const { device } = req.params;
        const { state } = req.body;
    
        console.log(`Received request to set ${device} to ${state}`); // Log the request
    
        if (!['motor', 'fogger'].includes(device) || !['on', 'off'].includes(state)) {
            console.log("Invalid request"); // Log invalid requests
            return res.status(400).json({ message: 'Invalid request' });
        }
    
        mqttClient.publish(`water/${device}`, state);
        console.log(`Published to MQTT: water/${device} = ${state}`); // Log MQTT publish
        res.status(200).json({ message: `${device} turned ${state}` });
    });




    // API to fetch water tank level
    app.get('/api/water-tank', (req, res) => {
    db.query("SELECT value FROM sensor_data WHERE topic = 'water/tank_level' ORDER BY timestamp DESC LIMIT 1", (err, results) => {
        if (err) return res.status(500).json({ error: err.message });
        res.json(results.length > 0 ? { tankLevel: results[0].value } : { tankLevel: "Unknown" });
    });
    });

    app.post('/api/predicted-growth', (req, res) => {
        const { growth_percentage } = req.body;
        
        if (!growth_percentage) {
            return res.status(400).json({ message: 'Growth percentage is required' });
        }
        
        console.log(`Received predicted growth percentage: ${growth_percentage}`);
        
        // Insert the predicted growth percentage into the growth_predictions table
        const sql = `INSERT INTO growth_predictions (growth_percentage) VALUES (?)`;
        
        db.query(sql, [growth_percentage], (err) => {
            if (err) {
                console.error('MySQL Insert Error in growth_predictions:', err);
                return res.status(500).json({ message: 'Error saving growth percentage' });
            }
            res.status(200).json({
                message: 'Growth percentage received and saved successfully',
                growth_percentage: growth_percentage,
            });
        });
    });
    app.post('/api/submit-commodity', (req, res) => {
        const { commodity } = req.body;
      
        if (!commodity) {
          return res.status(400).json({ message: 'Commodity is required' });
        }
      
        let table = '';
        if (commodity === 'Barley') table = 'barleyex';
        else if (commodity === 'Rice') table = 'ricex';
        else if (commodity === 'Wheat') table = 'wheatex';
      
        const sql = `SELECT * FROM ${table}`;  // Fetching the full table
        db.query(sql, (err, results) => {
          if (err) return res.status(500).json({ error: err.message });
          res.json(results);  // Return full table data
        });
      });
      
      app.post('/api/market-insights', (req, res) => {
  const { crop, attribute } = req.body;
  
  if (!crop || !attribute) {
    return res.status(400).json({ message: 'Crop and attribute are required' });
  }

  const tableName = `${crop.toLowerCase()}ex`; // Table names: wheatex, ricex, barleyex
  const query = `SELECT * FROM ${tableName} WHERE Attribute = ? ORDER BY YearOfProjection DESC`;

  db.query(query, [attribute], (err, results) => {
    if (err) {
      console.error('MySQL Query Error:', err);
      return res.status(500).json({ message: 'Database error' });
    }
    res.json(results);
  });
});
app.get('/results', (req, res) => {
    db.query('SELECT * FROM plant_disease_results', (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});


app.post("/api/get-financials", (req, res) => {
    const { table } = req.body;
  
    // Validate table name to prevent SQL injection
    const validTables = ["RiceMark", "WheatMark", "BarleyMark"];
    if (!validTables.includes(table)) {
      return res.status(400).json({ error: "Invalid table selection" });
    }
  
    const query = `SELECT * FROM ${table} ORDER BY SlNo ASC`;
  
    db.query(query, (err, results) => {
      if (err) {
        console.error("Error fetching financial data:", err);
        return res.status(500).json({ error: "Database query failed" });
      }
      res.json(results);
    });
  });
    // API to fetch the latest predicted growth percentage
    app.get('/api/latest-predicted-growth', (req, res) => {
        const sql = "SELECT growth_percentage, timestamp FROM growth_predictions ORDER BY timestamp DESC LIMIT 1";

        db.query(sql, (err, results) => {
            if (err) {
                return res.status(500).json({ error: err.message });
            }

            if (results.length > 0) {
                res.json({
                    growth_percentage: results[0].growth_percentage,
                    timestamp: results[0].timestamp,
                });
            } else {
                res.status(404).json({ message: 'No predicted growth data found' });
            }
        });
    });


    app.listen(port, () => console.log(`Server running on port ${port}`));
