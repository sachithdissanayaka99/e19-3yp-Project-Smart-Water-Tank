var awsIot = require('aws-iot-device-sdk');

var device = awsIot.device({
    keyPath: 'private_key.key',
    certPath: 'device_cert.crt',
    caPath: 'AmazonRootCA1.pem',
    clientId: 'TheWayIAm',
    host: 'arxgw2h3ywh22-ats.iot.us-east-1.amazonaws.com',
    thingName: 'iTank_01'
});




device.on('error', function(error) {
    console.error('Error:', error);
});

device.on('close', function() {
    console.log('Connection closed');
});

device.on('reconnect', function() {
    console.log('Reconnecting...');
});

device.on('offline', function() {
    console.log('Device is offline');
});


module.exports = { awsIot, device }; 