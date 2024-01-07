const mongoose = require('mongoose');

const waterLevelSchema = new mongoose.Schema({

    userId:{
        type: String,
        required: true,
    },


    tankId: {
        type: String,
        required: true,
    
    },

    waterLevel: {
        type: String,
        required: true,
       
    },
  

}, { timestamps: true }
)

const waterLevelModel = mongoose.model('WaterLevel', waterLevelSchema);

module.exports = waterLevelModel;