
class Toggle extends Controller {
  float w, h;
  float rounded = 10;
  float borderTolerance = 10; // on left and right to have min max value more easily
  float innerPadding = 4;
  boolean checked = false;
  boolean change = true;

  Toggle(float xpos, float ypos, float w, float h, String label) {
    super( xpos, ypos, label);
    this.w = w;
    this.h = h;
  }

  void draw() {
    noStroke();
    fill(colorBack);
    rect(xpos, ypos, w, h, rounded);
    if (checked) {
      fill(colorFront);
      rect(xpos+innerPadding, ypos +innerPadding, w-innerPadding*2, h-innerPadding*2, rounded);
    }
    fill(255);
    textAlign(CENTER, BOTTOM);
    text(label, xpos + w/2, ypos );
  }

  void update(float mx, float my) {
    if (mousePressed) {
      if (mx > xpos && mx <xpos + w  
        && my> ypos  && my < ypos +h  && change) {
        change = false;
        checked = ! checked;
      }
    } else {
      change = true;
    }
  }
}
