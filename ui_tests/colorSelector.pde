
class ColorSelector extends Controller {
  float w, h;
  float rounded = 10;
  float r = 255, g = 0, b =0;
  float borderTolerance = 10;
  boolean radial = true;
  PImage img;

  ColorSelector(float xpos, float ypos, float w, float h, String label) {
    super( xpos, ypos, label);
    this.w = w;
    this.h = h;

    img = loadImage("color_wheel.png");
    img.loadPixels();
  }

  void draw() {
    noStroke();
    fill(cBack);
    rect(xpos, ypos, w, h, rounded);

    image(img, xpos, ypos, w, h);

    fill(r, g, b);
    noStroke();
    rect(xpos, ypos + h*.95, w, h*.05);

    fill(255);
    textAlign(LEFT, BOTTOM);
    text(label, xpos, ypos);

    fill(255);
    textAlign(RIGHT, BOTTOM);
    text("("+int(r) +","+int(g)+","+int(b)+")", xpos + w, ypos);
  }

  void update(float mx, float my) {
    if (mx > xpos -  borderTolerance && mx <xpos + w  +  borderTolerance 
      && my> ypos - borderTolerance && my < ypos +h + borderTolerance  && mousePressed) {
      float ex = map(mx, xpos, xpos +w, 0, img.width);
      float wy = map(my, ypos, ypos +w, 0, img.height);  
      color c = img.get(int(ex), int(wy));
      r = red(c);
      g = green(c);
      b = blue(c);
    }
  }
}
