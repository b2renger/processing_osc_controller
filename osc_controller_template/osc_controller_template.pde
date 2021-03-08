/*
This is a template to run on a desktop computer
- you can "scan" the network for devices to communicate with
- you can the connect to one device and send it some values

You cannot run this example, and the "receiver_processing_template.pde" on the same machine 
 */

import oscP5.*;
import netP5.*;


OscP5 oscP5;
NetAddress myRemoteLocation;

String ip = "127.0.0.1";
int inPort = 12000;
int outPort = 10000;

boolean AUTO_DISCOVERY = true;
ArrayList<Client> available_clients;
int selected_client = -1;

String[] pages = {"Settings", "test"}; // name of the pd patch to use as layout
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


  oscP5 = new OscP5(this, inPort);
  myRemoteLocation = new NetAddress(ip, outPort);



  g = new GUI(50, pages);
  available_clients = new ArrayList();


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
  if (AUTO_DISCOVERY) auto_discovery();

}

void keyReleased() {
  g.forwardKeyEvent(key);
}
