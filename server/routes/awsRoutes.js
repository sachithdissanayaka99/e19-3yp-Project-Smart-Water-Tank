const express = require("express");
const router = express.Router();
const { device } = require("../config/awsConfig");
const waterLevelModel = require("../models/water_level_model");

let latestWaterLevel = null;
let latestTopic = null;


router.get("/tank-exits", async (req, res) => {

  
  try {
    const waterLevelModels = await waterLevelModel.findOne({
      userId:  req.query.userId,
    });



    if (waterLevelModels) {
      return res
        .status(200)
        .json({ message: "Email already exists", success: true });
    } else {
      try {
        res
          .status(200)
          .send({ message: "User registered successfully", success: false });
      } catch (err) {
        res
          .status(500)
          .send({ message: "Error creating user", success: false, err });
      }
    }
  } catch (err) {
    res
      .status(500)
      .send({ message: "Error creating user", success: false, err });
  }
});



router.post("/tank-registration", async (req, res) => {

    console.log("Received request:", req.body.tankId);
  try {
    const waterLevelModels = await waterLevelModel.findOne({
      tankId: req.body.tankId,
    });

    if (waterLevelModels) {
      return res
        .status(200)
        .json({ message: "TankID already exists", success: true });
    } else {
      try {
        const newWaterLevelModels = new waterLevelModel(req.body);
        await newWaterLevelModels.save();
        res
          .status(200)
          .send({ message: "User registered successfully", success: true });
      } catch (err) {
        res
          .status(500)
          .send({ message: "Error creating user", success: false, err });
      }
    }
  } catch (err) {
    res
      .status(500)
      .send({ message: "Error creating user", success: false, err });
  }
});

router.post("/send-input-valve", async (req, res) => {
  try {
    var dynamicData = "Hello from the frontend!";

    device.publish("esp32/sub", dynamicData);
    console.log("Message Sent....");

    res.status(200).send({ message: "Data sent to AWS IoT", success: true });
  } catch (err) {
    res
      .status(500)
      .send({ message: "Error sending data to AWS IoT", success: false, err });
  }
});

router.get("/receive-water-level", async (req, res) => {
  try {
    console.log("Connected to AWS IoT");
    device.subscribe("esp32/pub");

    device.on("message", function (topic, payload) {
      console.log(`Received message on topic ${topic}: ${payload.toString()}`);

      try {
        const receivedData = payload.toString();
        latestWaterLevel = receivedData;
        latestTopic = topic;

        console.log(`Received message on topic ${topic}:`, receivedData);
        res.status(200).json({
          message: "Data received from AWS IoT",
          success: true,
          data: {
            topic: latestTopic,
            waterLevel: latestWaterLevel,
          },
        });
      } catch (error) {
        console.error("Error:", error);
        res.status(500).json({
          message: "Error receiving data from AWS IoT",
          success: false,
          error: error,
          rawPayload: payload.toString(),
        });
      }
    });

    console.log("Waiting for messages...");
  } catch (err) {
    res.status(500).send({
      message: "Error receiving data from AWS IoT",
      success: false,
      err,
    });
  }
});

module.exports = router;
