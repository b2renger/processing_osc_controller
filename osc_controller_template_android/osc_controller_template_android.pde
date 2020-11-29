// add gui elements

import oscP5.*;
import netP5.*;
import controlP5.*;

ControlP5 cp5;
OscP5 oscP5;
NetAddress myRemoteLocation;
String ip = "127.0.0.1";
int port = 9000;



String[] pages = {"test", "hslider_layout"}; // name of the pd patch to use as layout
PFont font ;
int patchWidth = 600;
int patchHeight = 800;

color cBack = #000000; // background
color cGuiback = #5A5858; // gui background
color cGuifront = #FF76B0; // gui foreground
color cActive = #FF76B0; // when last selected
color cCaption = #FFFFFF; // texts around
int radioItemsPerRow = 8;

int fontSize = 40;
int minHeight = 120;


void setup() {
  size(displayWidth, displayHeight);
  orientation(PORTRAIT);
  font = createFont("EuphemiaUCAS-Bold-48.vlw", fontSize);


  oscP5 = new OscP5(this, 12000);
  myRemoteLocation = new NetAddress(ip, port);

  cp5 = new ControlP5(this);

  // create a default tab for settings
  Tab t = cp5.addTab("default")
    .setWidth(int(width*(1./(pages.length + 1))))
    .setHeight(minHeight)
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
      .setHeight(minHeight)  
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

boolean keyboardOpen = false;

void draw() {
  background(cBack);

  if (iptext.isFocus() ||porttext.isFocus() ) {
    if (!keyboardOpen) {
      openKeyboard();
      keyboardOpen = true;
    }
  }


  if (!iptext.isFocus() && !porttext.isFocus() && keyboardOpen) {
    closeKeyboard();
    keyboardOpen = false;
  }
}
