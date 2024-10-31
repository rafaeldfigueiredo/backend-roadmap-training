import app from './server.js';
import mongodb from 'mongodb';
import dotenv from 'dotenv'
import ReviewsDAO from './dao/reviewsDAO.js'

dotenv.config()

const MongoClient = mongodb.MongoClient;
const uri = process.env.MONGODB_URI

const port = 8000;

MongoClient.connect(uri).catch(err => {
    console.error(err.stack);
    process.exit(1)
}).then(async client => {
    await ReviewsDAO.injectDB(client)
    app.listen(port, () => {
        console.log(`Listening on http://localhost:${port}`);
    })
})