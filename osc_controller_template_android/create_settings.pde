
void create_settings() {

  Controller c;
  
  // MANUAL Config gui
  if (!AUTO_DISCOVERY) {
    c = new NumberField(width*0.25, height*.25, width*.5, eltHeight, "Ip adress");
    c.moveTo(0);
    g.addController(c);
    c.register(new CallBackHandler(c) {
      public void onEvent() {
        if (c.getClass().getSimpleName().contains("NumberField")) {
          NumberField nf = (NumberField) c;
          ip = nf.content;
          //println(nf.label, nf.content);
        }
      }
    }
    );
    c = new NumberField(width*0.25, height*.5, width*.5, eltHeight, "Port number");
    c.moveTo(0);
    g.addController(c);
    c.register(new CallBackHandler(c) {
      public void onEvent() {
        if (c.getClass().getSimpleName().contains("NumberField")) {
          NumberField nf = (NumberField) c;
          outPort = int(nf.content);
          //println(nf.label, nf.content);
        }
      }
    }
    );
    c= new Button(width*0.25, height*.75, width*.5, eltHeight, "Connect");
    c.moveTo(0);
    g.addController(c);
    c.register(new CallBackHandler(c) {
      public void onEvent() {

        myRemoteLocation = new NetAddress(ip, outPort);
        println(ip, outPort, "connecting to new remote location ...");
        //println(c.label, c.value);
      }
    }
    );
  } 
  
  // AUTO-DICOVERY CONFIG
  else {

    c= new Button(width*0.25, height*.25, width*.5, eltHeight, "Scan");
    c.moveTo(0);
    g.addController(c);
    c.register(new CallBackHandler(c) {
      public void onEvent() {
        available_clients = new ArrayList();
        String []  ips = split( oscP5.ip(), '.'); // get the ip address pattern on this network
        String broad_IP = ips[0] +"."+ ips[1]+"." + ips[2]+"." + str(255); // replace last by 255 for broadcast
        // send a broadcasted message
        NetAddress map = new NetAddress(broad_IP, outPort);
        OscMessage myMessage = new OscMessage("/id");
        myMessage.add(random(1122)); 
        oscP5.send(myMessage, map);
        // results will be received and parsed in the osc_messaging tab =>with the void oscEvent function
      }
    }
    );

    c= new Button(width*0.75, height*.5, width*.05, eltHeight, ">");
    c.moveTo(0);
    g.addController(c);
    c.register(new CallBackHandler(c) {
      public void onEvent() {
        selected_client += 1;
        if (selected_client > available_clients.size()-1) selected_client = 0;
       
      }
    }
    );

    c= new Button(width*0.2, height*.5, width*.05, eltHeight, "<");
    c.moveTo(0);
    g.addController(c);
    c.register(new CallBackHandler(c) {
      public void onEvent() {
        selected_client -= 1;
        if (selected_client < 0) selected_client = available_clients.size()-1;
       
      }
    }
    );

    c= new Button(width*0.25, height*.75, width*.5, eltHeight, "Connect");
    c.moveTo(0);
    g.addController(c);
    c.register(new CallBackHandler(c) {
      public void onEvent() {

        myRemoteLocation = new NetAddress(ip, outPort);
        println(ip, outPort, "connecting to new remote location ...");
        //println(c.label, c.value);
      }
    }
    );
  }
}
