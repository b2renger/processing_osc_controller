void parse_patch(String[] lines, Tab tab) {
  for (int i = 0; i < lines.length; i++) {

    String[] s = split(lines[i], " ");

    ///////////////////////////////////////////////////////////////////
    // check for horizontal sliders
    if (s.length>10 && s[1].contains("obj") && s[4].contains("hsl")) {
      float x = map(int(s[2]), 0, patchWidth, 0, width);
      float y = map(int(s[3]), 0, patchHeight, 0, height);
      float w = map(int(s[5]), 0, patchWidth, 0, width);
      float h = map(int(s[6]), 0, patchHeight, 0, height);

      Slider s1 = cp5.addSlider(s[13])
        .setPosition(int(x), int(y))
        .setRange(int(s[7]), int(s[8]))
        .setSize(int(w), int(h))
        .setFont(font)
        .setColorBackground(cGuiback)
        .setColorForeground(cGuifront)
        .setColorActive(cActive)
        .setColorCaptionLabel(cCaption)
        .setColorLabel(cCaption)
        .setColorValue(cCaption)
        .moveTo(tab)
        ;  
      s1.getCaptionLabel().align(ControlP5.RIGHT, ControlP5.CENTER).setPaddingX(5);
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
