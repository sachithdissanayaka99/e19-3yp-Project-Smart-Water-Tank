#include <pgmspace.h>

#define THINGNAME "iTank_01" // replace with thing name

const char WIFI_SSID[] = "mahelaekanayake10"; // replace with wifi ssid              
const char WIFI_PASSWORD[] = "12354678"; // replace with wifi password

const char AWS_IOT_ENDPOINT[] = "arxgw2h3ywh22-ats.iot.us-east-1.amazonaws.com"; // replace with iot endpoint

// Amazon Root CA 1 : 
static const char AWS_CERT_CA[] PROGMEM = R"EOF(
-----BEGIN CERTIFICATE-----

-----END CERTIFICATE-----
)EOF";

// Device Certificate
static const char AWS_CERT_CRT[] PROGMEM = R"KEY(
-----BEGIN CERTIFICATE-----

-----END CERTIFICATE-----
)KEY";

// Device Private key
static const char AWS_CERT_PRIVATE[] PROGMEM = R"KEY(
-----BEGIN RSA PRIVATE KEY-----

-----END RSA PRIVATE KEY-----
)KEY";
