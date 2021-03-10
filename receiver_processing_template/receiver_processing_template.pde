/**
 * based on oscP5parsing example by andreas schlegel
 * oscP5 website at http://www.sojamo.de/oscP5
 */

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

String sketchName = "processing_test";
int inPort = 10000;
int outPort = 12000;

color c; // being get from color1
float xpos; // being get from hslider1
float ypos; // being get from vslider1
float w; // being get from touch1 => xvalue
float h; // being get from touch1 => yvalue

boolean display = false; // being get from Toggle1

color backColor = color(0); // pressing button1 will get you a new random color

float sw = 1;
color strokeColor = color(0);
float n = 3.145;


void setup() {
  size(400, 400);
  frameRate(25);
  /* start oscP5, listening for incoming messages at port inPort
   port needs to match the one you are sending to !
   */
  oscP5 = new OscP5(this, inPort);
  println(oscP5.ip(), inPort);
  myRemoteLocation = new NetAddress("127.0.0.1", outPort);

  c = color(255, 0, 0);
  xpos = width*.5;
  ypos = height*.5;
  w = 10;
  h = 10;
}

void draw() {
  if (display) {
    background(backColor);
  }

  strokeWeight(sw);
  stroke(strokeColor);
  fill(c);
  ellipse(xpos, ypos, w, h);

  textAlign(CENTER, BOTTOM);
  text("sponsored by the number : " + n, width*.5, height);
}



/*
Parsing occurs here !
 */
void oscEvent(OscMessage theOscMessage) {
  /* check if theOscMessage has the address pattern we are looking for. */
  println("### received an osc message.");

  // this first one is for auto-identification - it shouldn't have to be edited
  if (theOscMessage.checkAddrPattern("/id")==true) { 
    println("id response " + inPort);
    OscMessage myMessage = new OscMessage("/ready");
    myMessage.add(sketchName); 
    myMessage.add("/" + oscP5.ip()); 
    myMessage.add(str(inPort)); 
    String []  ips = split( oscP5.ip(), '.'); // get the ip address pattern on this network
    String broad_IP = ips[0] +"."+ ips[1]+"." + ips[2]+"." + str(255); // replace last by 255 for broadcast
    // send a broadcasted message
    //println(oscP5.ip(), inPort);
    NetAddress map = new NetAddress(broad_IP, outPort);
    oscP5.send(myMessage, map);
    return;
  }  

  // below this lines are each controllers
  /*get values from the button input*/
  if (theOscMessage.checkAddrPattern("/bouton1")==true) { 
    
    backColor = color(random(255), random(255), random(255));
    return;
  }  

  /*get values from the toggle input*/
  if (theOscMessage.checkAddrPattern("/Toggle1")==true) { 
    float tvalue  = theOscMessage.get(0).floatValue();
    if (tvalue == 1)display = true;
    else display = false;
    return;
  }  

  /*get values from the hslider input*/
  if (theOscMessage.checkAddrPattern("/hslider1")==true) { 
    float x = theOscMessage.get(0).floatValue();
    xpos = map(x, 0, 127, 0, width);
    return;
  }  

  /*get values from the vslider input*/
  if (theOscMessage.checkAddrPattern("/vslider1")==true) { 
    float y = theOscMessage.get(0).floatValue();
    ypos = map(y, 127, 0, 0, height);
    return;
  }  

  /*get values from the hradio input*/
  if (theOscMessage.checkAddrPattern("/hradio1")==true) { 
    float v = theOscMessage.get(0).floatValue();
    sw = v*2;
    return;
  }  

  /*get values from the vradio input*/
  if (theOscMessage.checkAddrPattern("/vradio1")==true) { 
    float v = theOscMessage.get(0).floatValue();
    if (v == 0) {
      strokeColor = color(255, 0, 0);
    } else if (v == 1) {
      strokeColor = color(255, 255, 0);
    } else if (v == 2) {
      strokeColor = color(255, 255, 255);
    } else if (v == 3) {
      strokeColor = color(255, 0, 255);
    } else if (v == 4) {
      strokeColor = color(0, 0, 255);
    }
    return;
  }  

  /*get values from the pad input*/
  if (theOscMessage.checkAddrPattern("/touch1")==true) { 
    w = theOscMessage.get(0).floatValue();
    h = theOscMessage.get(1).floatValue();
    return;
  }  

  /*get values from the color selector color*/
  if (theOscMessage.checkAddrPattern("/color1")==true) { 
    float red = theOscMessage.get(0).floatValue();
    float green = theOscMessage.get(1).floatValue();
    float blue = theOscMessage.get(2).floatValue();
    c = color(red, green, blue);
    return;
  }  

  /*get values from the number input*/
  if (theOscMessage.checkAddrPattern("/number1")==true) { 
    n = theOscMessage.get(0).floatValue();
    return;
  }  

  // the line below could be useful for debugging incomming messages
  println("### received an osc message. with address pattern "+theOscMessage.addrPattern());
}
