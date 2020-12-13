
color cBack = #000000; // background
color cGuiback = #5A5858; // gui background
color cGuifront = #FF76B0; // gui foreground
color cCaption = #FFFFFF; // texts around

GUI g;



void setup() {
  fullScreen();
  orientation(PORTRAIT);
 
  
  textSize(46);
  
  String[] n = {"tab1", "tab2", "tab3", "tab4"};
  g = new GUI(120, n);
  populateGUI();
  

}


void draw() {

  background(cBack);
  g.updateControllers();

}


void keyReleased() {
  g.forwardKeyEvent();
}


void populateGUI() {
  Controller c= new Button(width*0.33, height*0.75, width*0.33, 120, "/button1");
  c.moveTo(0);
  g.addController(c);
  c.register(new CallBackHandler(c) {
    public void onEvent() {
      println(c.label, c.value);
    }
  }
  );


  c = new Toggle(width*0.33, height*0.5, width*0.33, 120, "/toggle1");
  c.moveTo(0);
  g.addController(c);
  c.register(new CallBackHandler(c) {
    public void onEvent() {
      println(c.label, c.value);
    }
  }
  );

  c = new NumberField(width*0.33, height*0.25, width*0.33, 120, "Ip adress");
  c.moveTo(0);
  g.addController(c);
  c.register(new CallBackHandler(c) {
    public void onEvent() {
      if (c.getClass().getSimpleName().contains("NumberField")) {
        NumberField nf = (NumberField) c;
        println(nf.label, nf.content);
      }
    }
  }
  );

  c =new TextLabel(50,height*0.90, "text to give information about something", color(255));
  c.moveTo(0);
  g.addController(c);
  
  
  c = new HSlider(width*0.1, height*.33, width*0.8, 120, "/hslider1", 0, 127);
  c.moveTo(1);
  g.addController(c);
  c.register(new CallBackHandler(c) {
    public void onEvent() {
      println(c.label, c.value);
    }
  }
  );

  c = new HRadio(width*0.1, height*.66, width*0.8, 120, "/hradio1", 6);
  c.moveTo(1);
  g.addController(c);
  c.register(new CallBackHandler(c) {
    public void onEvent() {
      println(c.label, c.value);
    }
  }
  );

  c = new VSlider(width*0.25, height*0.33, 120, height*0.33, "/vslider1", 0, 127);
  c.moveTo(2);
  g.addController(c);
  c.register(new CallBackHandler(c) {
    public void onEvent() {
      println(c.label,  c.value);
    }
  }
  );

  c = new VRadio(width*0.75, height*0.33, 120, height*0.33, "/vradio1", 5);
  c.moveTo(2);
  g.addController(c);
  c.register(new CallBackHandler(c) {
    public void onEvent() {
      println(c.label, c.value);
    }
  }
  );

  c = new Pad(width*.2, height*.1, width*.6, height*0.35, "/pad1", 0, 127);
  c.moveTo(3);
  g.addController(c);
  c.register(new CallBackHandler(c) {
    public void onEvent() {
      if (c.getClass().getSimpleName().contains("Pad")) {
        Pad p = (Pad) c;
        println(p.label, p.xvalue, p.yvalue);
      }
    }
  }
  );

  c =new ColorSelector(width*.2, height*.6, width*.6, height*0.35, "/color1");
  c.moveTo(3);
  g.addController(c);
  c.register(new CallBackHandler(c) {
    public void onEvent() {
      if (c.getClass().getSimpleName().contains("ColorSelector")) {
        ColorSelector cs = (ColorSelector) c;
        println(cs.label, cs.r, cs.g, cs.b);
      }
    }
  }
  );
}
