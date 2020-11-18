void create_settings(){
  cp5.addTextfield("ip")
    .setPosition(width*0.10, height*0.25)
    .setSize(int((width) *0.80 ), 60)
    .setFont(font)
    .setFocus(true)
    .setAutoClear(false).moveTo("default")
    .getCaptionLabel().align(ControlP5.RIGHT, ControlP5.CENTER)
    ;

  cp5.addTextfield("port")
    .setPosition(width*0.1, height*0.5)
    .setSize(int(width  *0.80 ), 60)
    .setFont(font)
    .setFocus(true)
    .setAutoClear(false).moveTo("default")
    .getCaptionLabel().align(ControlP5.RIGHT, ControlP5.CENTER)
    ;

  cp5.addBang("CONNECT")
    .setPosition(width*0.33, height*0.75)
    .setSize(int(width*0.33 ), 60)
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
