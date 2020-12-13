/*
class for top level interaction :
 - lists all controllers and tabs and call their dedicated functions
 - Overloaded constructor for tabs or no tabs option
 */

class GUI {

  ArrayList<Controller> controllers;
  Tab tabs;
  boolean tabbed = false;

  GUI() {
    controllers = new ArrayList();
  }

  GUI(float minHeight, String[] tabsNames) { 
    controllers = new ArrayList();
    tabs = new Tab(minHeight, tabsNames);
    tabbed = true;
  }


  void addController(Controller c) {
    controllers.add(c);
  }

  void updateControllers() {
    if (tabbed) {
      tabs.draw();
      tabs.update(mouseX, mouseY);

      for (int i = 0; i < controllers.size(); i++) {
        Controller c = controllers.get(i);
        if (c.tabId == tabs.value) {
          c.draw();
          c.update(mouseX, mouseY);
        }
      }
    } else {
      for (int i = 0; i < controllers.size(); i++) {
        Controller c = controllers.get(i);
        c.draw();
        c.update(mouseX, mouseY);
      }
    }
  }

  void forwardKeyEvent(char k) {
    for (int i = 0; i < controllers.size(); i++) {
      Controller c = controllers.get(i);
      if (c.getClass().getSimpleName().contains("NumberField")) {  
        NumberField nf = (NumberField) c;
        if (k != CODED) {
          if (k == BACKSPACE) {
            nf.removeLast();
          } else if (k == ENTER) {
            nf.focus = false;
          } else {
            nf.fillup(k);
          }
        }
      }
    }
  }


  Controller getControllerByName(String name) {
    Controller r = null;
    for (int i = 0; i < controllers.size(); i++) {
      Controller c = controllers.get(i);
      if (c.label.contains(name)) r = c;
    }
    return r;
  }
}

/* A main controller class :
 - all components will extend this class
 - a function is used to register callback function through the use of the interface below
 */
class Controller {
  float xpos, ypos;
  String label;
  color colorBack;
  color colorFront;
  int tabId = -1;

  float value = 0;
  float pvalue = 0;
  CallBackHandler cbh;


  Controller(float xpos, float ypos, String label) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.label = label;
    colorBack = cGuiback;
    colorFront = cGuifront;
    cbh = new CallBackHandler(this);
  }

  void draw() {
  }
  void update(float mx, float my) {
  }
  void moveTo(int tabId) {
    this.tabId = tabId;
  }

  void onChange() {
    cbh.onEvent();
  };

  public void register(CallBackHandler cbh) {
    this.cbh = cbh;
  }
}

/* interface
 */
interface CallBack {                
  public void onEvent();
}

/* class to handle callbacks
 */
class CallBackHandler  implements CallBack {  
  Controller c;
  CallBackHandler (Controller c) {
    this.c = c;
  }
  public void onEvent( ) {
    //println("I've been called back");
  }
}
