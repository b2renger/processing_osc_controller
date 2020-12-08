class Controller {
  float xpos, ypos;
  String label;
  color colorBack;
  color colorFront;
  int tabId = -1;
  
  Controller(float xpos, float ypos, String label) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.label = label;
    colorBack = cGuiback;
    colorFront = cGuifront;
  }

  void draw() {
  }
  void update(float mx, float my) {
  }
  void moveTo(int tabId){
    this.tabId = tabId;
  }
}
