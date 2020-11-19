
// add a global variable PORTRAIT VS LANDSCAPE and provide pd-template for landscape
// add global variables to store color mods
// add gui elements
// add sensors values for android ? (with ketai ?)

import oscP5.*;
import netP5.*;
import controlP5.*;

ControlP5 cp5;
OscP5 oscP5;
NetAddress myRemoteLocation;
String ip = "127.0.0.1";
int port = 1234;



String[] pages = {"hslider_layout"}; // name of the pd patch to use as layout
PFont font ;
int patchWidth = 600;
int patchHeight = 800;


void setup() {
  size(600, 800);
  //orientation(PORTRAIT);
  font = createFont("arial", 18);

  oscP5 = new OscP5(this, 12000);
  myRemoteLocation = new NetAddress(ip, port);

  cp5 = new ControlP5(this);
  
  // create a default tab for settings
  cp5.addTab("default")
    .setWidth(int(width*(1./(pages.length + 1))))
    .setHeight(40)
    .setLabel("settings")   
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
    ;
  
  // add tab for each pd patch and populate it
  for (int i = 0; i < pages.length; i ++) { 
    // add a tab
    cp5.addTab(pages[i])
      .setWidth(int(width*(1./(pages.length + 1))))
      .setHeight(40)  
      .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
      ;
    Tab tab = cp5.getTab(pages[i]);
    String[] patch = loadStrings(pages[i] +".pd");
    // populate the tab with gui elements
    parse_patch(patch, tab);
  }

  create_settings();
}


void draw() {
  background(180);
}
