
class NumberField extends Controller {
  float w, h;
  boolean focus = false;
  String content = "";
  float innerPadding = 4;
  float rounded = 10;
  char pkey='a';
  boolean change = true;

  NumberField(float xpos, float ypos, float w, float h, String label) {
    super(xpos, ypos, w, h, label);
    this.w = w;
    this.h = h;
  }

  void draw() {
    noStroke();
    fill(colorBack);
    rect(xpos, ypos, w, h, rounded);
    if (focus) {
      noFill();
      stroke(colorFront);
      strokeWeight(innerPadding);
      rect(xpos, ypos, w, h, rounded);
      strokeWeight(1);
    }

    fill(255);
    textAlign(LEFT, TOP);
    text(label, xpos, ypos +h);

    textAlign(LEFT, CENTER);
    text(content, xpos + innerPadding, ypos +h/2);
  }

  void update(float mx, float my) {
    if (mousePressed) {
      if (mx > xpos && mx <xpos + w  
        && my> ypos  && my < ypos +h  && !focus) {
        focus = true;
      }
    } else if (mx < xpos || mx >xpos + w  
      || my< ypos  || my > ypos +h  && focus) {
      focus = false;
    }
  }

  void fillup(char c) {
    if (focus) {
      if (c =='.' || c=='0' || c=='1' || c=='2' || c=='3' || c=='4'
        || c=='5' || c=='6' || c=='7' || c=='8' || c=='9'
        ) {
        content +=c;
      }
    }
  }

  void removeLast() {
    if (focus && content.length()>0) {
      content = content.substring(0, content.length()-1);
    }
  }
}
