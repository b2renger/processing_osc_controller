
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

color cBack = #FFFFFF; // background
color cGuiback = #120078; // gui background
color cGuifront = #9d0191; // gui foreground
color cActive = #fd3a69; // when last selected
color cCaption = #FFFFFF; // texts around


void setup() {
  size(600, 800);
  //orientation(PORTRAIT);
  font = createFont("arial", 16);

  oscP5 = new OscP5(this, 12000);
  myRemoteLocation = new NetAddress(ip, port);

  cp5 = new ControlP5(this);

  // create a default tab for settings
  Tab t = cp5.addTab("default")
    .setWidth(int(width*(1./(pages.length + 1))))
    .setHeight(60)
    .setLabel("settings")   
    .setColorBackground(cGuiback)
    .setColorForeground(cGuifront)
    .setColorActive(cActive)
    .setColorLabel(cCaption)
    .setColorValue(cCaption);
  t.getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);
  t.getCaptionLabel().setFont(font);



  // add tab for each pd patch and populate it
  for (int i = 0; i < pages.length; i ++) { 
    // add a tab
    Tab t0 = cp5.addTab(pages[i])
      .setWidth(int(width*(1./(pages.length + 1))))
      .setHeight(60)  
      .setColorBackground(cGuiback)
      .setColorForeground(cGuifront)
      .setColorActive(cActive)
      .setColorLabel(cCaption)
      .setColorValue(cCaption);
    t0.getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);
    t0.getCaptionLabel().setFont(font);

    Tab tab = cp5.getTab(pages[i]);
    String[] patch = loadStrings(pages[i] +".pd");
    // populate the tab with gui elements
    parse_patch(patch, tab);
  }

  create_settings();
}


void draw() {
  background(cBack);
}
