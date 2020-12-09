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
int index = 0;

void setup() {
  size(800, 800);
  pixelDensity(1);
  textSize(18);

  String[] n = {"tab1", "tab2", "tab3", "tab4"};
  tabs = new Tab(50, n);

  // all controllers
  controllers = new ArrayList();

  Controller c= new Button(150, 250, 100, 50, "/button1");
  c.moveTo(0);
  controllers.add(c);
  c.register(new CallBackHandler(c) {
    //@Override
      public void onEvent() {
      println(c.label, 
        c.value);
    }
  }
  );

 
  c = new Toggle(150, 350, 100, 50, "/toggle1");
  c.moveTo(0);
  controllers.add(c);
  c.register(new CallBackHandler(c) {
    @Override
      public void onEvent() {
      println(c.label, 
        c.value);
    }
  }
  );
  
  

  c = new NumberField(150, 450, 150, 50, "Ip adress");
  c.moveTo(0);
  controllers.add(c);

  c =new TextLabel(50, 550, "text to give information about something", color(255));
  c.moveTo(0);
  controllers.add(c);

  c = new HSlider(50, 150, 250, 50, "/hslider1", 0, 127);
  c.moveTo(1);
  controllers.add(c);

  c = new HRadio(350, 150, 300, 50, "/hradio1", 6);
  c.moveTo(1);
  controllers.add(c);

  c = new VSlider(50, 250, 50, 250, "/vslider1", 0, 127);
  c.moveTo(2);
  controllers.add(c);

  c = new VRadio(350, 250, 50, 200, "/vradio1", 4);
  c.moveTo(2);
  controllers.add(c);

  c = new Pad(width*.33, width*.15, width*.33, 200, "/pad1", 0, 127);
  c.moveTo(3);
  controllers.add(c);

  c =new ColorSelector(width*.33, width*.50, 300, 300, "/color1");
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
