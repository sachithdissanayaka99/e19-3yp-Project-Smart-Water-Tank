import express from 'express';
import bodyParser from 'body-parser';
import mysql from 'mysql';
import cors from 'cors';
import jwt from 'jsonwebtoken';
import bcrypt from 'bcrypt';
import cookieParser from 'cookie-parser';

const app = express();
app.use(express.json());
app.use(cors());
app.use(cookieParser());


const db = mysql.createConnection(
    {
        host:"localhost",
        user:"root",
        password:"Srd@12345678910",
        database:"iTank",
    }
)


app.listen(8080, ()=>{
    console.log("Server is running on port 8080");
})

