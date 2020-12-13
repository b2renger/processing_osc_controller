
color cBack = #000000; // background
color cGuiback = #5A5858; // gui background
color cGuifront = #FF76B0; // gui foreground
color cCaption = #FFFFFF; // texts around

GUI g;

void setup() {
  size(800, 800);
  pixelDensity(1);
  textSize(18);

  String[] n = {"tab1", "tab2", "tab3", "tab4"};
  g = new GUI(50, n);
  populateGUI();
}


void draw() {
  background(cBack);
  g.updateControllers();
}


void keyReleased() {
  g.forwardKeyEvent(key);
}

void populateGUI() {
  Controller c= new Button(150, 250, 100, 50, "/button1");
  c.moveTo(0);
  g.addController(c);
  c.register(new CallBackHandler(c) {
    public void onEvent() {
      println(c.label, c.value);
    }
  }
  );


  c = new Toggle(150, 350, 100, 50, "/toggle1");
  c.moveTo(0);
  g.addController(c);
  c.register(new CallBackHandler(c) {
    public void onEvent() {
      println(c.label, c.value);
    }
  }
  );

  c = new NumberField(150, 450, 150, 50, "Ip adress");
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

  c =new TextLabel(50, 550, "text to give information about something", color(255));
  c.moveTo(0);
  g.addController(c);

  c = new HSlider(50, 150, 250, 50, "/hslider1", 0, 127);
  c.moveTo(1);
  g.addController(c);
  c.register(new CallBackHandler(c) {
    public void onEvent() {
      println(c.label, c.value);
    }
  }
  );


  c = new HRadio(350, 150, 300, 50, "/hradio1", 6);
  c.moveTo(1);
  g.addController(c);
  c.register(new CallBackHandler(c) {
    public void onEvent() {
      println(c.label, c.value);
    }
  }
  );

  c = new VSlider(50, 250, 50, 250, "/vslider1", 0, 127);
  c.moveTo(2);
  g.addController(c);
  c.register(new CallBackHandler(c) {
    public void onEvent() {
      println(c.label,  c.value);
    }
  }
  );

  c = new VRadio(350, 250, 50, 200, "/vradio1", 4);
  c.moveTo(2);
  g.addController(c);
  c.register(new CallBackHandler(c) {
    public void onEvent() {
      println(c.label, c.value);
    }
  }
  );

  c = new Pad(width*.33, width*.15, width*.33, 200, "/pad1", 0, 127);
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

  c =new ColorSelector(width*.33, width*.50, 300, 300, "/color1");
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
