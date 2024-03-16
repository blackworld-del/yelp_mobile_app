const express = require('express');
const bodyParser = require('body-parser');
const MongoClient = require('mongodb').MongoClient;

const app = express();
const port = 3000;

// Middleware to parse JSON request bodies
app.use(bodyParser.json());

// MongoDB connection URL
const mongoUrl = 'mongodb+srv://orichimaru:WalidOrichimaru12_@yelp.sxeaopk.mongodb.net/?retryWrites=true&w=majority';
const dbName = 'Yelp';

// Route to handle category-based search
app.get('/search', async (req, res) => {
    const selectedCategory = req.query.category; // Assuming category is passed as a query parameter
    try {
        // Connect to MongoDB
        const client = await MongoClient.connect(mongoUrl);
        const db = client.db(dbName);

        // Query MongoDB to find businesses with the selected category
        const businesses = await db.collection('business').find(
            { categories: { $regex: new RegExp(selectedCategory, 'i') } }
        ).toArray();

        // Close the MongoDB connection
        client.close();

        res.json(businesses);
    } catch (error) {
        console.error('Error:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

// Start the server
app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
