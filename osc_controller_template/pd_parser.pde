void parse_patch(String[] lines, Tab tab) {
  for (int i = 0; i < lines.length; i++) {

    String[] s = split(lines[i], " ");
    if (s.length>4) println(i, s[4], s.length);

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

    ///////////////////////////////////////////////////////////////////
    // check for vertical sliders
    if (s.length>10 && s[1].contains("obj") && s[4].contains("vsl")) {
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
      s1.getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE);
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

    ///////////////////////////////////////////////////////////////////
    // check buttons
    if (s.length>10 && s[1].contains("obj") && s[4].contains("bng")) {
      float x = map(int(s[2]), 0, patchWidth, 0, width);
      float y = map(int(s[3]), 0, patchHeight, 0, height);
      float w = map(int(s[5]), 0, patchWidth, 0, width);
      float h = map(int(s[7]), 0, patchHeight, 0, height);

      Button b = cp5.addButton(s[11])
        .setPosition(int(x), int(y))
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
      b.getCaptionLabel().align(ControlP5.CENTER, ControlP5.TOP_OUTSIDE);
      b.addCallback(new CallbackListener() {
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


    ///////////////////////////////////////////////////////////////////
    // check toggle
    if (s.length>10 && s[1].contains("obj") && s[4].contains("tgl")) {
      float x = map(int(s[2]), 0, patchWidth, 0, width);
      float y = map(int(s[3]), 0, patchHeight, 0, height);
      float w = map(int(s[5]), 0, patchWidth, 0, width);
      float h = map(int(s[5]), 0, patchHeight, 0, height);

      Toggle t = cp5.addToggle(s[9])
        .setPosition(int(x), int(y))
        .setSize(int(w), int(h*0.75))
        .setFont(font)
        .setColorBackground(cGuiback)
        .setColorForeground(cGuifront)
        .setColorActive(cActive)
        .setColorCaptionLabel(cCaption)
        .setColorLabel(cCaption)
        .setColorValue(cCaption)
        .setMode(ControlP5.SWITCH)
        .moveTo(tab)
        ;  
      t.getCaptionLabel().align(ControlP5.CENTER, ControlP5.TOP_OUTSIDE);
      t.addCallback(new CallbackListener() {
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

    ///////////////////////////////////////////////////////////////////
    // check for numbers 
    if (s.length>10 && s[1].contains("obj") && s[4].contains("nbx")) {
      float x = map(int(s[2]), 0, patchWidth, 0, width);
      float y = map(int(s[3]), 0, patchHeight, 0, height);
      float w = map(int(s[5])*fontSize, 0, patchWidth, 0, width); // pd uses a weird unit as width (eg characterd width)
      float h = map(int(s[6]), 0, patchHeight, 0, height);

      Numberbox n = cp5.addNumberbox(s[13])
        .setPosition(int(x), int(y))
        .setSize(int(w), int(h))
        .setMultiplier(0.1) // set the sensitifity of the numberbox
        .setDirection(Controller.HORIZONTAL) 
        .setFont(font)
        .setColorBackground(cGuiback)
        .setColorForeground(cGuifront)
        .setColorActive(cActive)
        .setColorCaptionLabel(cCaption)
        .setColorLabel(cCaption)
        .setColorValue(cCaption)
        .moveTo(tab)
        ;  
      n.getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE);
      n.addCallback(new CallbackListener() {
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


    //////////////////////////////////////////////////////////////////////////
    // check for touch surface eg  canvas with receive value set to "touch" 
    if (s.length>10 && s[1].contains("obj") && s[4].contains("cnv") && s[9].contains("touch")) {
      float x = map(int(s[2]), 0, patchWidth, 0, width);
      float y = map(int(s[3]), 0, patchHeight, 0, height);
      float w = map(int(s[6]), 0, patchWidth, 0, width); 
      float h = map(int(s[7]), 0, patchHeight, 0, height);
      Slider2D s2 = cp5.addSlider2D(s[10])
        .setPosition(int(x), int(y))
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
      s2.getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE);
      s2.addCallback(new CallbackListener() {
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

    //////////////////////////////////////////////////////////////////////////////////////
    // check for color selector surface eg  canvas with receive value set to "color" 
    if (s.length>10 && s[1].contains("obj") && s[4].contains("cnv") && s[9].contains("color")) {
      float x = map(int(s[2]), 0, patchWidth, 0, width);
      float y = map(int(s[3]), 0, patchHeight, 0, height);
      float w = map(int(s[6]), 0, patchWidth, 0, width);
      float h = map(int(s[7]), 0, patchHeight, 0, height);
      ColorWheel c = cp5.addColorWheel(s[10], int(x), int(y), int(h) )
        .setRGB(color(128, 0, 255))
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
      c.getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE);
      c.addCallback(new CallbackListener() {
        public void controlEvent(CallbackEvent theEvent) {
          if (theEvent.getAction()==ControlP5.ACTION_BROADCAST) {
            Controller c = theEvent.getController();
            //color col = color(100,100,100,1);
           //cp5.get(ColorWheel.class,"col").getRGB();
            println( c.getLabel(), (color)c.getValue());
            sendColorMessage("/"+c.getLabel(), (color)c.getValue());
           // println(c.getValue());
          }
        }
      }
      );
    }
  }
}
