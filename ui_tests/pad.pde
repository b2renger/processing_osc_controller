class Pad extends Controller {
  float w, h;
  float rounded = 10;
  float ex = 0;
  float wy = 0;
  float xvalue = 0;
  float yvalue= 0;
  float min = 0;
  float max = 127;
  float borderTolerance = 10;

  Pad(float xpos, float ypos, float w, float h, String label, float min, float max) {
    super( xpos, ypos, label);
    this.min = min;
    this.max = max;
    this.w = w;
    this.h = h;
    this.ex = xpos;
    this.wy = ypos;
  }

  void draw() {
    noStroke();
    fill(colorBack);
    rect(xpos, ypos, w, h, rounded);

    stroke(colorFront);
    line(ex, ypos, ex, ypos+h);
    line(xpos, wy, xpos +w, wy);

    fill(colorFront);
    ellipse(ex, wy, 10, 10);

    fill(255);
    textAlign(LEFT, BOTTOM);
    text(label, xpos, ypos);

    fill(255);
    textAlign(RIGHT, BOTTOM);
    text("("+int(xvalue) +","+int(yvalue)+")", xpos + w, ypos);
  }

  void update(float mx, float my) {
    if (mx > xpos -  borderTolerance && mx <xpos + w  +  borderTolerance 
      && my> ypos - borderTolerance && my < ypos +h + borderTolerance  && mousePressed) {
      xvalue = constrain(map(mx, xpos, xpos + w, min, max), min, max);
      yvalue = constrain(map(my, ypos, ypos +h, min, max), min, max);
      ex = constrain(mx, xpos, xpos +w);
      wy = constrain(my, ypos, ypos+h);
    }
  }
}
