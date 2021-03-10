void auto_discovery(){
  for (int i = 0; i < g.controllers.size(); i++) {
    Controller c = g.controllers.get(i);
    if (g.tabs.value == 0) {
      textSize(fontSize);
      textAlign(CENTER, CENTER);
      text("there is " + available_clients.size() + " client(s) available", width*0.5, height*0.4);
      if (selected_client == -1 || available_clients.size() < 1 ){
        text("no client selected", width*0.5, height*0.5);
      }
      else if (available_clients.size() > 0 ) {
        Client cl = available_clients.get(selected_client);
        text("client number : " + selected_client, width*0.5, height*0.5);
        text("client name : " + cl.name, width*0.5, height*0.55);
        
        ip = available_clients.get(selected_client).ip;
        //outPort = int(available_clients.get(selected_client).port);
        /* for some reason "receiver_processing_template" doesn't broadcast the right port number
        so every communication will  happen on the outPort given at the start of the program*/
      }
    }
  }
}
