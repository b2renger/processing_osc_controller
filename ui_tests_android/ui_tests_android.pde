/* TODO :
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
Tab tabs;

float minHeight = 120;

void setup() {
  fullScreen();
  orientation(PORTRAIT);
  
  textSize(46);

  String[] n = {"tab1", "tab2", "tab3", "tab4"};
  tabs = new Tab(minHeight, n);

  // all controllers
  controllers = new ArrayList();

  Controller c= new Button(width*0.33, height*.2, width*.33, minHeight, "/button1");
  c.moveTo(0);
  controllers.add(c);

  c = new Toggle(width*0.33, height*.4, width*.33, minHeight, "/toggle1");
  c.moveTo(0);
  controllers.add(c);

  c = new NumberField(width*0.33, height*.6, width*.33, minHeight, "Ip adress");
  c.moveTo(0);
  controllers.add(c);

  c =new TextLabel(width*.1, height*.8, "text to give information about something", color(255));
  c.moveTo(0);
  controllers.add(c);

  c = new HSlider(width*0.2, height*.33, width*.6, minHeight, "/hslider1", 0, 127);
  c.moveTo(1);
  controllers.add(c);

  c = new HRadio(width*0.2, height*.66, width*.6,minHeight, "/hradio1", 6);
  c.moveTo(1);
  controllers.add(c);

  c = new VSlider(width*0.33, height*.33, minHeight, height*.33, "/vslider1", 0, 127);
  c.moveTo(2);
  controllers.add(c);

  c = new VRadio(width*0.66, height*.33, minHeight, height*.33, "/vradio1", 12);
  c.moveTo(2);
  controllers.add(c);

  c = new Pad(width*.2, height*.15, width*.6, height*.33, "/pad1", 0, 127);
  c.moveTo(3);
  controllers.add(c);
  
  c =new ColorSelector(width*.2, height*.55, width*.6, height*.33, "/color1");
  c.moveTo(3);
  controllers.add(c);
}


void draw() {

  background(cBack);

  tabs.draw();
  tabs.update(mouseX, mouseY);

  for (int i = 0; i < controllers.size(); i++) {
    Controller c = controllers.get(i);
    if (c.tabId == tabs.value) {
      c.draw();
      c.update(mouseX, mouseY);
    }
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
