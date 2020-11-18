void parse_patch(String[] lines) {
  for (int i = 0; i < lines.length; i++) {
    //println(i, lines[i]);

    String[] s = split(lines[i], " ");
    //println(s[0]);

    // check for horizontal sliders
    if (s.length>10 && s[1].contains("obj") && s[4].contains("hsl")) {
      //println("hslider detected");
      Slider s1 = cp5.addSlider(s[13])
        .setPosition(int(s[2]), int(s[3]))
        .setRange(int(s[7]), int(s[8]))
        .setSize(int(s[5]), int(s[6]))
        ;
      s1.addCallback(new CallbackListener() {
        public void controlEvent(CallbackEvent theEvent) {
          if (theEvent.getAction()==ControlP5.ACTION_BROADCAST) {
            Controller c = theEvent.getController();
            //println(index, c.getLabel(), c.getValue());
            sendFloatMessage("/"+c.getLabel(), c.getValue());
          }
        }
      }
      );
    }
  }
}
