/*
this function will create a tab with sensor data for android
 with gui elements to activate/ desactivate the reading
 and elements to display the data
 */

KetaiAudioInput mic;
short[] audioData;
float audioAvg = 0;

void create_sensorTab() {
  
  
  // mic input
  Controller c = new Toggle(width*0.05, height*.10, width*.1, width*.1, "Mic");
  c.moveTo(1);
  g.addController(c);
  c.register(new CallBackHandler(c) {
    public void onEvent() {
      if (mic != null && mic.isActive()) {
        mic.stop();
      } else {
        mic.start();
      }
    }
  }
  );
  mic = new KetaiAudioInput(this);
  requestPermission("android.permission.RECORD_AUDIO", "initAudio");
}


void draw_sensors() {
  
  
  // mic input
  if (audioData != null){  
    for (int i = 0; i < audioData.length; i++) {
      if (i != audioData.length-1) {  
        line(map(i, 0, audioData.length, 0, width), map(audioData[i], -32768, 32767, height*0.25, height*0.15), 
          map(i+1, 0, audioData.length, 0, width), map(audioData[i+1], -32768, 32767, height*0.25, height*0.15));
      }
    }
  }
  ellipse(width*.8, height*.10 + width*0.05, 10 + audioAvg*width*0.7, 10 +audioAvg*width*0.7);
  textAlign(LEFT, CENTER);
  text(" audio level : " + nf(audioAvg, 0, 3), width*0.2, height*.10 + width*0.05);
  
}

void update_sensors() {
  
  sendFloatMessage("/mic", audioAvg);
}


void initAudio(boolean granted) {
  if (granted) {
    mic = new KetaiAudioInput(this);
    println("Audio recording permission granted");
  } else {
    println("Audio recording permission denied");
  }
}

void onAudioEvent(short[] _data) {
  audioData= _data;
  for (int i = 0; i < audioData.length; i++) {
    audioAvg += abs(audioData[i]);
  }
  audioAvg = audioAvg / audioData.length;
  audioAvg = map(audioAvg , 0, 32767, 0, 1);
}
