class Controller {
  float xpos, ypos;
  float w, h;
  String label;
  color colorBack;
  color colorFront;

  Controller(float xpos, float ypos, float w, float h, String label) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.w = w;
    this.h = h;
    this.label = label;
    colorBack = cGuiback;
    colorFront = cGuifront;
  }

  void draw() {
  }
  void update(float mx, float my) {
  }
}
