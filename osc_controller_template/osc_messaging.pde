
void sendIntMessage(String addrPattern, int value) {
  OscMessage myMessage = new OscMessage(addrPattern);
  myMessage.add(value); 
  oscP5.send(myMessage, myRemoteLocation);
}

void sendFloatMessage(String addrPattern, float value) {
  OscMessage myMessage = new OscMessage(addrPattern);
  myMessage.add(value); 
  oscP5.send(myMessage, myRemoteLocation);
}

void sendStringMessage(String addrPattern, String value) {
  OscMessage myMessage = new OscMessage(addrPattern);
  myMessage.add(value); 
  oscP5.send(myMessage, myRemoteLocation);
}

void sendColorMessage(String addrPattern, color c) {
  OscMessage myMessage = new OscMessage(addrPattern);
  println(red(c), green(c), blue(c), alpha(c));
  myMessage.add(red(c)); 
  myMessage.add(green(c)); 
  myMessage.add(blue(c)); 
  myMessage.add(alpha(c)); 
  oscP5.send(myMessage, myRemoteLocation);
}


void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
}
