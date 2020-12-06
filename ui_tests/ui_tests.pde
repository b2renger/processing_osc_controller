/* TODO :
 - text label

 - tabbed interface : function moveTo / based on Hradio
 - setters for rounded / innerPadding
 - onChange functions
 - getters for values
 - change
 
 */

color cBack = #000000; // background
color cGuiback = #5A5858; // gui background
color cGuifront = #FF76B0; // gui foreground
color cCaption = #FFFFFF; // texts around

ArrayList<Controller> controllers;

NumberField nf;

void setup() {
  size(800, 800);
  pixelDensity(1);
  textSize(18);

  controllers = new ArrayList();

  controllers.add(new HSlider(50, 50, 250, 50, "/hslider1", 0, 127));
  controllers.add(new VSlider(50, 150, 50, 250, "/vslider1", 0, 127));
  controllers.add(new Button(150, 150, 100, 50, "/button1"));
  controllers.add(new Toggle(150, 250, 100, 50, "/toggle1"));
  controllers.add(new NumberField(150, 350, 150, 50, "Ip adress"));
  controllers.add(new HRadio(350, 50, 300, 50, "/hradio1", 6));
  controllers.add(new VRadio(350, 150, 50, 200, "/vradio1", 4));
  controllers.add(new Pad(450, 150, 200, 200, "/pad1", 0,127));
  controllers.add(new ColorSelector(450, 400, 200, 200, "/color1"));
}


void draw() {

  background(cBack);

  for (int i = 0; i < controllers.size(); i++) {
    Controller c = controllers.get(i);

    c.draw();
    c.update(mouseX, mouseY);
  }
}


void keyReleased() {
  for (int i = 0; i < controllers.size(); i++) {
    Controller c = controllers.get(i);
    if (c.getClass().getSimpleName().contains("NumberField")) {  
      NumberField nf = (NumberField) c;
      if (key != CODED) {
        if (key == BACKSPACE) {
          nf.removeLast();
        } else if (key == ENTER) {
          nf.focus = false;
        } else {
          nf.fillup(key);
        }
      }
    }
  }
}
