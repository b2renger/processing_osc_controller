
class HSlider extends Controller {

  float value, pos;
  float min, max;
  float rounded = 10;
  float borderTolerance = 10; // on left and right to have min max value more easily
  float innerPadding = 4; // padding between back and front
  
  HSlider(float xpos, float ypos, float w, float h, String label, float min, float max) {
    super( xpos, ypos, w, h, label);
    this.value = 0;
    this.pos = map(value, min, max, 0, w);
    this.min = min;
    this.max = max;
  }

  void draw() {
    noStroke();
    fill(colorBack);
    rect(xpos, ypos, w, h, rounded);

    fill(colorFront);
    pos = constrain(map(value, min, max, 0, w-innerPadding*2), 0, w-innerPadding*2);
    rect(xpos+innerPadding, ypos+innerPadding, pos, h-innerPadding*2, rounded);

    fill(255);
    textAlign(LEFT, BOTTOM);
    text(label , xpos, ypos);
    textAlign(RIGHT, BOTTOM);
    text(int(value), xpos + w, ypos);
  }

  void update(float mx, float my) {
    if (mx > xpos-borderTolerance && mx <xpos + w + borderTolerance 
      && my> ypos && my < ypos +h && mousePressed) {
      value = constrain(map(mx, xpos, xpos+ w, min, max), min, max);
    }
  }
}


class VSlider extends Controller {

  float value, pos;
  float min, max;
  float rounded = 10;
  float borderTolerance = 10; // on left and right to have min max value more easily
  float innerPadding = 4; // padding between back and front
  
  VSlider(float xpos, float ypos, float w, float h, String label, float min, float max) {
    super( xpos, ypos, w, h, label);
    this.value = 0;
    this.pos = map(value, min, max, 0,  w);
    this.min = min;
    this.max = max;
  }

  void draw() {
    noStroke();
    fill(colorBack);
    rect(xpos, ypos, w, h, rounded);

    fill(colorFront);
    pos = constrain(map(value, min, max, 0, h-innerPadding*2), 0, h-innerPadding*2);
    rect(xpos+innerPadding, ypos + h-innerPadding, w-innerPadding*2,- pos, rounded);

    fill(255);
    textAlign(CENTER, TOP);
    text(label , xpos + w/2, ypos +h);
    textAlign(CENTER, BOTTOM);
    text(int(value), xpos +w/2 , ypos);
  }

  void update(float mx, float my) {
    if (mx > xpos && mx <xpos + w  
      && my> ypos -borderTolerance && my < ypos +h + borderTolerance && mousePressed) {
      value = constrain(map(my, ypos+ h, ypos, min, max), min, max);
    }
  }
}
