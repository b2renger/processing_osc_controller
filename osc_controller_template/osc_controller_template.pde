// add gui elements

import oscP5.*;
import netP5.*;


OscP5 oscP5;
NetAddress myRemoteLocation;
String ip = "127.0.0.1";
int port = 9000;

String[] pages = {"Settings", "test", "hslider_layout"}; // name of the pd patch to use as layout
PFont font ;
int patchWidth = 600;
int patchHeight = 800;

color cBack = #000000; // background
color cGuiback = #5A5858; // gui background
color cGuifront = #FF76B0; // gui foreground
color cCaption = #FFFFFF; // texts around


int fontSize = 18;
int eltHeight = 50;

GUI g;

void setup() {
  size(600, 800);

  font = createFont("arial", fontSize);


  oscP5 = new OscP5(this, 12000);
  myRemoteLocation = new NetAddress(ip, port);

  g = new GUI(50, pages);


  // add tab for each pd patch and populate it
  for (int i = 1; i < pages.length; i ++) { 
    String[] patch = loadStrings(pages[i] +".pd");
    // populate the tab with gui elements
    parse_patch(patch, i);
  }

  create_settings();
}


void draw() {
  background(cBack);
  g.updateControllers();

  
}

void keyReleased(){
  g.forwardKeyEvent(key);
}
