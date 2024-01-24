const express = require('express');
const cors = require('cors');
const app = express();
const path = require('path');
require('dotenv').config();
const dbConfig = require('./config/dbConfig');
const awsConfig = require('./config/awsConfig');

app.use(express.json());

// Use the cors middleware with specific options to enable CORS for a particular origin
const corsOptions = {
    origin: 'http://54.208.4.191',
    methods: 'GET,HEAD,PUT,PATCH,POST,DELETE',
    credentials: true, // enable set cookie
};

app.use(cors(corsOptions));

const _dirname = path.dirname("");
const buildPath = path.join(_dirname, "../client/build");

app.use(express.static(buildPath));

app.get("/*", function (req, res) {
    res.sendFile(
        path.join(__dirname, "../client/build/index.html"),
        function (err) {
            if (err) {
                res.status(500).send(err);
            }
        }
    );
});

const userRoutes = require('./routes/userRoutes');
const adminRoutes = require('./routes/adminRoutes');
const hardwareRoutes = require('./routes/awsRoutes');

app.use('/api/user', userRoutes);
app.use('/admin/api/user', userRoutes);
app.use('/api/admin', adminRoutes);
app.use('/api/user/hardware', hardwareRoutes);

const port = process.env.PORT || 4000;

console.log(process.env.MONGO_URL);

app.listen(port, () => console.log(`Server running on port ${port}`));
