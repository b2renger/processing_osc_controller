
color cBack = #000000; // background
color cGuiback = #5A5858; // gui background
color cGuifront = #FF76B0; // gui foreground
color cCaption = #FFFFFF; // texts around

ArrayList<Controller> controllers;

void setup(){
  size(800,600);
  pixelDensity(1);
  textSize(18);
  
  controllers = new ArrayList();
  
  controllers.add(new HSlider(50, 50, 250, 50, "/hslider1", 0, 127));
  controllers.add(new VSlider(50, 150, 50, 250, "/vslider1", 0, 127));
  
  
}


void draw(){
  
  background(cBack);
  
  for (int i = 0 ; i < controllers.size() ; i++){
      Controller c = controllers.get(i);
      c.draw();
      c.update(mouseX, mouseY);
  }
  
}
