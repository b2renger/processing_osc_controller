PGraphics pg;
boolean radial = true;
float w,h;
void setup() {


  size (1000, 1000, JAVA2D);
  w = width;
  h = height;
  pg = createGraphics(int(w), int(h), JAVA2D);
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
    for (float angle = 0; angle <= TWO_PI; angle+=0.001) {
      for ( float rad = 0; rad <= h*.45; rad +=0.1) {
        float hu = map(angle, 0, TWO_PI, 0, 360);
        float sat=100; 
        float br=100;      
        if (rad < h*.23) {
          sat = map( rad, 0, h*.23, 0, 100);
        } else {
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
  pg.save("color_wheel.png");
}


void draw() {
  //background(0);
  image(pg,0,0);
}
