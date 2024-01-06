const express = require("express");
const router = express.Router();
const userModel = require("../models/user_model");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const authmiddleware = require("../middleware/authmiddleware");

router.get("/get-all-users", authmiddleware, async (req, res) => {
  
    try {
      const users = await userModel.find({ isAdministrator: false });
      res.status(200).send({
        success: true,
        data: users,
      });
    } catch (err) {
      res.status(500).send({ message: "Error reading data", success: false, err });
    }
  });
  
  
  
  router.get("/get-all-admin", authmiddleware, async (req, res) => {
    try {
      const counsellors = await userModel.find({ isAdministrator: true});
      res.status(200).send({
        success: true,
        data: counsellors,
      });
    } catch (err) {
      res.status(500).send({ message: "Error reading data", success: false, err });
    }
  });



  module.exports = router;