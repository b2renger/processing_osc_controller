
class Button extends Controller {
  float w,h;
  float rounded = 10;

  float innerPadding = 4;
  boolean pressed = false;

  Button(float xpos, float ypos, float w, float h, String label) {
    super( xpos, ypos, label);
    this.w = w;
    this.h = h;
  }

  void draw() {
    noStroke();
    fill(colorBack);
    rect(xpos, ypos, w, h, rounded);
    if (pressed) {
      fill(colorFront);
      rect(xpos+innerPadding, ypos +innerPadding, w-innerPadding*2, h-innerPadding*2, rounded);
    }
    fill(255);
    textAlign(CENTER, BOTTOM);
    text(label, xpos + w/2, ypos);
  }

  void update(float mx, float my) {
    if (mx > xpos && mx <xpos + w  
      && my> ypos  && my < ypos +h  && mousePressed) {
      pressed = true;
    } else {
      pressed = false;
    }
  }
}
