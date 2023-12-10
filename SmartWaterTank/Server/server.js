const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');
const bodyParser = require('body-parser');
const bcrypt = require('bcrypt'); // Add this line

const app = express();
app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'Srd@12345678910',
    database: 'iTank',
});

app.post('/register', async (req, res) => {
    const fullName = req.body.fullName;
    const email = req.body.email;
    const plainPassword = req.body.password;

    console.log(fullName, email, plainPassword);

    try {
        const hashedPassword = await bcrypt.hash(plainPassword, 10);

        db.query(
            "INSERT INTO users (`fullName`, `email`, `password`) VALUES (?, ?, ?)",
            [fullName, email, hashedPassword],
            (err, result) => {
                if (err) {
                    console.error(err);
                    return res.json('Error');
                }
                return res.json(result);
            }
        );
    } catch (error) {
        console.error(error);
        return res.json('Error');
    }
});

app.listen(8081, () => {
    console.log('Server is running on port 8081');
});
