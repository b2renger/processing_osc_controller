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

Slider s1 ;

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
  for (int i = 0; i < lines.length; i++) {
    println(i, lines[i]);

    String[] s = split(lines[i], " ");
    //println(s[0]);
    if (s.length>10 && s[1].contains("obj") && s[4].contains("hsl")) {

      println("hslider detected");

       s1 = cp5.addSlider(s[13])
        .setPosition(int(s[2]), int(s[3]))
        .setRange(int(s[7]), int(s[8]))
        .setSize(int(s[5]), int(s[6]))

        ;
      
      /*
      s1.addCallback(new CallbackListener() {
        public void controlEvent(CallbackEvent theEvent) {
          if (theEvent.getAction()==ControlP5.ACTION_BROADCAST) {
            println(s1.getValue());
            
            sendFloatMessage("/"+s1.getLabel(), s1.getValue());
          }
        }
      }
      );*/
    }
  }
}


void draw() {
  background(0);
}

void slider(float value) {
  sendFloatMessage("/slider1", value);
  println(value);
}


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



void sendIntMessage(String addrPattern, int value) {
  OscMessage myMessage = new OscMessage(addrPattern);
  myMessage.add(value); 
  oscP5.send(myMessage, myRemoteLocation);
}

void sendFloatMessage(String addrPattern, float value) {
  OscMessage myMessage = new OscMessage(addrPattern);
  myMessage.add(value); 
  oscP5.send(myMessage, myRemoteLocation);
}

void sendStringMessage(String addrPattern, String value) {
  OscMessage myMessage = new OscMessage(addrPattern);
  myMessage.add(value); 
  oscP5.send(myMessage, myRemoteLocation);
}

void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
}
