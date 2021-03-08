
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

void sendArrayMessage(String addrPattern, float[] array) {
  OscMessage myMessage = new OscMessage(addrPattern);
  for (int i = 0; i < array.length; i++) {
    myMessage.add(array[i]);
  }
  oscP5.send(myMessage, myRemoteLocation);
}

void sendStringMessage(String addrPattern, String value) {
  OscMessage myMessage = new OscMessage(addrPattern);
  myMessage.add(value); 
  oscP5.send(myMessage, myRemoteLocation);
}

void sendColorMessage(String addrPattern, color c) {
  OscMessage myMessage = new OscMessage(addrPattern);
  myMessage.add(red(c)); 
  myMessage.add(green(c)); 
  myMessage.add(blue(c)); 
  myMessage.add(alpha(c)); 
  oscP5.send(myMessage, myRemoteLocation);
}


// receiveing responses from the scan and store them in the available_clients arraylist
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  //print("### received an osc message.");
  //print(" addrpattern: "+theOscMessage.addrPattern());
  //println(" typetag: "+theOscMessage.typetag());
  
  if (theOscMessage.checkAddrPattern("/ready")==true) {
    
    String name = theOscMessage.get(0).stringValue();
    String ip = theOscMessage.toString().split(" ")[0].split(":")[0].split("/")[1];
    String port = theOscMessage.toString().split(" ")[0].split(":")[1];
    println(name, ip, port);
    Client client = new Client(name, ip, port);
    available_clients.add(client);
    
    println("available clients number : " + available_clients.size());
    
    
  }
}

// data holder for available clients 
class Client{
  String name;
  String ip; 
  String port;
  
  Client(String name, String ip, String port){
    this.name = name;
    this.ip = ip;
    this.port = port;
  }
  
  
}
