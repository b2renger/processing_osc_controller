import oscP5.*;
import netP5.*;
import controlP5.*;

ControlP5 cp5;

OscP5 oscP5;
NetAddress myRemoteLocation;
String ip = "127.0.0.1";
int port = 1234;

float marginX = 0.015;
float marginY = 0.01;

String[] lines ;



void setup() {
  size(800, 600);

  oscP5 = new OscP5(this, 12000);
  myRemoteLocation = new NetAddress(ip, port);

  PFont font = createFont("arial", 18);


  cp5 = new ControlP5(this);

  cp5.addTextfield("ip")
    .setPosition(width*marginX, width*marginY)
    .setSize(int((width - marginX*2) *0.31 ), 40)
    .setFont(font)
    .setFocus(true)
    .setAutoClear(false)
    .getCaptionLabel().align(ControlP5.RIGHT, ControlP5.CENTER)
    ;

  cp5.addTextfield("port")
    .setPosition(width*marginX + (width - marginX*2)*0.33, width*marginY)
    .setSize(int((width - marginX*2) *0.31 ), 40)
    .setFont(font)
    .setFocus(true)
    .setAutoClear(false)
    .getCaptionLabel().align(ControlP5.RIGHT, ControlP5.CENTER)
    ;

  cp5.addBang("CONNECT")
    .setPosition(width*marginX + (width - marginX*2)*0.66, width*marginY)
    .setSize(int((width - marginX*2) *0.31 ), 40)
    .setFont(font)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
    ;




  lines = loadStrings("interface_simple.pd");
  parse_patch(lines);


}


void draw() {
  background(0);
}

/*
void slider(float value) {
 sendFloatMessage("/slider1", value);
 println(value);
 }
 */

public void ip(String _ip) {
  println(_ip);
  ip =_ip;
}

public void port(String _port) {
  port =int(_port);
}

public void CONNECT() {
  myRemoteLocation = new NetAddress(ip, port);
  println(ip, port, "new remote location ...");
}
