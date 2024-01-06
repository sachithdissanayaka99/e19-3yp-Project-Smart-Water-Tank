const mongoose = require('mongoose');
mongoose.connect(process.env.MONGO_URL)

const connection = mongoose.connection;

connection.on('connected', () => {
    console.log('Mongoose Connected Successfully');
})

connection.on('error', (error) => {
    console.log('Mongoose default connection error: ' + error);
})

module.exports = mongoose; 