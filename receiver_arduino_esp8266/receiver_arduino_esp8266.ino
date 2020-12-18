
#include <ESP8266WiFi.h>

#include <WiFiUdp.h>
#include <OSCMessage.h>
#include <OSCBundle.h>
#include <OSCData.h>

char ssid[] = "HUAWEI-B315-6EEC";          // your network SSID (name)
char pass[] = "JE38QBQE74T";                    // your network password

WiFiUDP Udp;
const IPAddress outIp(192, 168, 43, 146);     // remote IP (not needed for receive)
const unsigned int outPort = 12000;          // remote port (not needed for receive)
const unsigned int localPort = 10000;        // local port to listen for UDP packets (here's where we send the packets)


#include <Adafruit_NeoPixel.h>
#define PIN        14
#define NUMPIXELS 16
Adafruit_NeoPixel pixels(NUMPIXELS, PIN, NEO_GRB + NEO_KHZ800);

//
void setup() {
  Serial.begin(115200);

  // Connect to WiFi network
  Serial.println();
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);
  WiFi.begin(ssid, pass);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");

  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());

  Serial.println("Starting UDP");
  Udp.begin(localPort);
  Serial.print("Local port: ");
#ifdef ESP32
  Serial.println(localPort);
#else
  Serial.println(Udp.localPort());
#endif

  pixels.begin();

}

void colorCB(OSCMessage &msg) {
  float r = msg.getFloat(0);
  float g = msg.getFloat(1);
  float b = msg.getFloat(2);

  for (int i = 0; i < NUMPIXELS; i++) { // For each pixel...
    pixels.setPixelColor(i, pixels.Color(r, g, b));
  }
  pixels.show();   // Send the updated pixel colors to the hardware.

  Serial.print("message received");
}

void loop() {

  OSCBundle bundle;
  int size = Udp.parsePacket();

  if (size > 0) {
    while (size--) {
      bundle.fill(Udp.read());
    }
    bundle.dispatch("/color1", colorCB);
  }

}
