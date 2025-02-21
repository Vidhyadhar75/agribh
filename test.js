const mqtt = require('mqtt');

// MQTT broker URL
const brokerUrl = 'mqtt://192.168.48.1:1883'; // Replace with your broker URL

// List of topics to publish to
const topics = [
    'air/temperature', 'air/humidity', 'air/pressure', 'air/voc', 'air/altitude',
    'soil/moisture1', 'soil/moisture2', 'soil/ph',
    'water/motor', 'water/fogger', 'water/tank_level'
  ];

// Message to send
const message = '5';

// Connect to the MQTT broker
const client = mqtt.connect(brokerUrl);

client.on('connect', () => {
    console.log('Connected to MQTT broker');

    // Function to publish messages with a delay
    const publishWithDelay = (index) => {
        if (index < topics.length) {
            const topic = topics[index];
            client.publish(topic, message, (err) => {
                if (err) {
                    console.error(`Failed to publish to ${topic}:`, err);
                } else {
                    console.log(`Message sent to ${topic}: ${message}`);
                }
            });

            // Schedule the next message after 10 seconds
            setTimeout(() => {
                publishWithDelay(index + 1);
            }, 0);// 10 seconds delay
        } else {
            // All messages sent, close the connection
            client.end();
            console.log('All messages sent. Connection closed.');
        }
    };

    // Start publishing messages
    publishWithDelay(0);
});

client.on('error', (err) => {
    console.error('Connection error:', err);
});

client.on('close', () => {
    console.log('Connection closed');
});