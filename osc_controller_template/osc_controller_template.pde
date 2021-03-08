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
int port = 10000;

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


  oscP5 = new OscP5(this, 12000);
  myRemoteLocation = new NetAddress(ip, port);



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

  for (int i = 0; i < g.controllers.size(); i++) {
    Controller c = g.controllers.get(i);
    if (g.tabs.value == 0) {
      textSize(fontSize);
      textAlign(CENTER, CENTER);
      text("there is " + available_clients.size() + " client(s) available", width*0.5, height*0.4);
      if (selected_client == -1 || available_clients.size() < 1 ){
        text("no client selected", width*0.5, height*0.5);
      }
      else if (available_clients.size() > 0 ) {
        Client cl = available_clients.get(selected_client);
        text("client number : " + selected_client, width*0.5, height*0.5);
        text("client name : " + cl.name, width*0.5, height*0.55);
        
        ip = available_clients.get(selected_client).ip;
        port = int(available_clients.get(selected_client).port);
      }
    }
  }
}

void keyReleased() {
  g.forwardKeyEvent(key);
}
