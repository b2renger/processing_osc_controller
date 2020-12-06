class TextLabel extends Controller {

  color colorBack;
  color colorFront;
  color c;

  TextLabel(float xpos, float ypos, String label, color c) {
    super(xpos,ypos,label);
    this.c = c;  
  }

  void draw() {
    fill(this.c);
    textAlign(LEFT, TOP);
    text(this.label, this.xpos,this.ypos);
  }
  void update(float mx, float my) {
  }
}
