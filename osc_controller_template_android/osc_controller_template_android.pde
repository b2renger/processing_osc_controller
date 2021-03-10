
import oscP5.*;
import netP5.*;
import ketai.sensors.*;

OscP5 oscP5;
NetAddress myRemoteLocation;



int inPort = 12000;
int outPort = 10000;
String ip = "127.0.0.1";

// Change the following line to add your controllers
String[] pages = {"Settings", "Sensors", "test"}; // name of the pd patch to use as layout

// customisation stuff
PFont font ; // needs to loaded it in the setup below
color cBack = #000000; // background
color cGuiback = #5A5858; // gui background
color cGuifront = #FF76B0; // gui foreground
color cCaption = #FFFFFF; // texts around
int fontSize = 46;
int eltHeight = 100;


boolean AUTO_DISCOVERY = true;
// end of custom stuff
ArrayList<Client> available_clients;
int selected_client = -1;


GUI g;
int patchWidth = 600;
int patchHeight = 800;


void setup() {
  fullScreen();
  orientation(PORTRAIT);

  // load a custom font
  font = createFont("arial", fontSize);
  textSize(fontSize);


  oscP5 = new OscP5(this, inPort);
  myRemoteLocation = new NetAddress(ip, outPort);

  available_clients = new ArrayList();
  g = new GUI(eltHeight, pages);

  // add tab for each pd patch and populate it
  for (int i = 2; i < pages.length; i ++) { 
    String[] patch = loadStrings(pages[i] +".pd");
    // populate the tab with gui elements
    parse_patch(patch, i);
  }

  create_settings();
  create_sensorTab();
}


void draw() {
  background(cBack);
  g.updateControllers();

  if (AUTO_DISCOVERY) auto_discovery();

  if (g.tabs.value == 1) {
    stroke(cGuifront);
    draw_sensors();
    update_sensors();
  }
}

void keyReleased() {
  g.forwardKeyEvent(key);
}
