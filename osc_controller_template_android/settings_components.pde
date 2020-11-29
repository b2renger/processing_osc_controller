Textfield iptext;
Textfield porttext;

void create_settings() {
  iptext= cp5.addTextfield("ip")
    .setPosition(width*0.10, height*0.25)
    .setSize(int((width) *0.80 ), 80)
    .setFont(font)
    //.setFocus(true)
    .setColorBackground(cGuiback)
    .setColorForeground(cGuifront)
    .setColorActive(cActive)
    .setColorCaptionLabel(cCaption)
    .setColorLabel(cCaption)
    .setColorValue(cCaption)
    .setAutoClear(false).moveTo("default");
  iptext.getCaptionLabel().align(ControlP5.RIGHT, ControlP5.CENTER).setPaddingX(5)
    ;

  porttext = cp5.addTextfield("port")
    .setPosition(width*0.1, height*0.5)
    .setSize(int(width  *0.80 ), 80)
    .setFont(font)
    //.setFocus(true)
    .setColorBackground(cGuiback)
    .setColorForeground(cGuifront)
    .setColorActive(cActive)
    .setColorCaptionLabel(cCaption)
    .setColorLabel(cCaption)
    .setColorValue(cCaption)
    .setAutoClear(false).moveTo("default");
  porttext.getCaptionLabel().align(ControlP5.RIGHT, ControlP5.CENTER).setPaddingX(5)
    ;

  cp5.addBang("CONNECT")
    .setPosition(width*0.33, height*0.75)
    .setSize(int(width*0.33 ), 80)
    .setColorBackground(cGuiback)
    .setColorForeground(cGuifront)
    .setColorActive(cActive)
    .setColorCaptionLabel(cCaption)
    .setColorLabel(cCaption)
    .setColorValue(cCaption)
    .setFont(font).moveTo("default")
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
    ;
}

// callbacks
public void ip(String _ip) {
  ip =_ip;
}

public void port(String _port) {
  port =int(_port);
}

public void CONNECT() {
  myRemoteLocation = new NetAddress(ip, port);
  println(ip, port, "connecting to new remote location ...");
}
