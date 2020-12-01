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


class Button extends Controller {

  float rounded = 10;
  float borderTolerance = 10; // on left and right to have min max value more easily
  float innerPadding = 4;
  boolean pressed = false;

  Button(float xpos, float ypos, float w, float h, String label) {
    super( xpos, ypos, w, h, label);
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
    textAlign(CENTER, TOP);
    text(label, xpos + w/2, ypos +h);
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



class Toggle extends Controller {

  float rounded = 10;
  float borderTolerance = 10; // on left and right to have min max value more easily
  float innerPadding = 4;
  boolean checked = false;
  boolean change = true;

  Toggle(float xpos, float ypos, float w, float h, String label) {
    super( xpos, ypos, w, h, label);
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
    textAlign(CENTER, TOP);
    text(label, xpos + w/2, ypos +h);
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
