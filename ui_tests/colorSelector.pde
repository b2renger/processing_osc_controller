
class ColorSelector extends Controller {

  float rounded = 10;
  float ex = 0;
  float wy = 0;
  float xvalue = 0;
  float yvalue= 0;

  float r = 255, g = 0, b =0;

  float borderTolerance = 10;

  PGraphics pg;

  ColorSelector(float xpos, float ypos, float w, float h, String label) {
    super( xpos, ypos, w, h, label);

    pg = createGraphics(int(w), int(h));
    pg.beginDraw();

    float sat=100; 
    float br=100;
    pg.colorMode(HSB, 360, 100, 100, 100);
    for (float i = 0; i <   w; i++) {
      for (float j = 0; j <  h*0.85; j++) {

        float hu = map(j, 0, h*.85, 0, 360);
        if ( i <= w*.5 ) {
          sat = map(i, 0, w*.5, 0, 100);
        } else if (i>w*.5 && i <w*.5) {
          sat = 100;
          br = 100;
        } else if (i>=w*.5) {
          br = map(i, w*.5, w, 100, 0);
        }
        pg.stroke(hu, sat, br);
        pg.point(i, j);
      }
    } 
    pg.endDraw(); 
    //pg.loadPixels();
  }

  void draw() {
    noStroke();
    fill(colorBack);
    rect(xpos, ypos, w, h, rounded);

    image(pg, xpos, ypos, w, h);
     
    fill(r,g,b);
    noStroke();
    rect(xpos, ypos + h*.85, w , h*.15);

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
      float ex = map(mx, xpos, xpos +w , 0, pg.width);
      float wy = map(my, ypos, ypos +w , 0, pg.height);  
      color c = pg.get(int(ex), int(wy));
      r = red(c);
      g = green(c);
      b = blue(c);
    }
  }
}
