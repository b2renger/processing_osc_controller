class Controller {
  float xpos, ypos;
 
  String label;
  color colorBack;
  color colorFront;

  Controller(float xpos, float ypos, float w, float h, String label) {
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
}
