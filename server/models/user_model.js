const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
    fullName: {
        type: String,
        required: true,
        min: 6,
        max: 255
    },

    email: {
        type: String,
        required: true,
        min: 6,
        max: 255
    },

    password: {
        type: String,
        required: true,
        min: 6,
        max: 1024
    },

    isAdministrator: {
        type: Boolean,
        default: false
    },

    seenNotifications: {
        type: Array,
        default: []
    },

    unreadNotifications: {
        type: Array,
        default: []
    },

     

    

}, { timestamps: true }
)

const userModel = mongoose.model('User', userSchema);

module.exports = userModel;