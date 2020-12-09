class Controller   {
  float xpos, ypos;
  String label;
  color colorBack;
  color colorFront;
  int tabId = -1;
  
  float value = 0;
  float pvalue = 0;
  CallBackHandler cbh;
  

  Controller(float xpos, float ypos, String label) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.label = label;
    colorBack = cGuiback;
    colorFront = cGuifront;
  }

  void draw() {
  }
  void update(float mx, float my) {
    
  }
  void moveTo(int tabId) {
    this.tabId = tabId;
  }
  
  void onChange(){
    if (pvalue != value){
      cbh.onEvent();
    } 
  };
  
  public void register(CallBackHandler cbh){
   this.cbh = cbh;
  }
}

//https://www.tutorialspoint.com/Callback-using-Interfaces-in-Java
//https://www.infoworld.com/article/2077462/java-tip-10--implement-callback-routines-in-java.html

interface CallBack {                
  public void onEvent();
}


class CallBackHandler implements CallBack {  
  @Override
  public void onEvent() {
    println("I've been called back");
  }
}
