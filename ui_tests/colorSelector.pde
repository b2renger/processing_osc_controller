
class ColorSelector extends Controller {

  float rounded = 10;
  float r = 255, g = 0, b =0;
  float borderTolerance = 10;
  boolean radial = true;
  PGraphics pg;

  ColorSelector(float xpos, float ypos, float w, float h, String label) {
    super( xpos, ypos, w, h, label);

    pg = createGraphics(int(w), int(h));
    pg.beginDraw();


    pg.colorMode(HSB, 360, 100, 100, 100);

    if (!radial) {
      float sat=100; 
      float br=100;
      for (float i = 0; i <   w; i++) {
        for (float j = 0; j <  h*0.95; j++) {

          float hu = map(j, 0, h*.95, 0, 360);
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
    } else {

      for (float angle = 0; angle <= TWO_PI; angle+=0.01) {

        for ( float rad = 0; rad <= h*.45; rad +=0.1) {
          float hu = map(angle, 0, TWO_PI, 0, 360);
          float sat=100; 
          float br=100;
          
          if (rad < h*.23){
            sat = map( rad, 0, h*.23, 0, 100);
          }
          else{
            br = map( rad, h*.25, h*.45, 100, 0);
          }
          float x =  w*.5 + rad*cos(angle);
          float y =  h*.5 + rad*sin(angle);
          pg.stroke(hu, sat, br);
          pg.point(x, y);
        }
      }
    }
    pg.endDraw();
  }

  void draw() {
    noStroke();
    fill(cBack);
    rect(xpos, ypos, w, h, rounded);

    image(pg, xpos, ypos, w, h);

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
      float ex = map(mx, xpos, xpos +w, 0, pg.width);
      float wy = map(my, ypos, ypos +w, 0, pg.height);  
      color c = pg.get(int(ex), int(wy));
      r = red(c);
      g = green(c);
      b = blue(c);
    }
  }
}
