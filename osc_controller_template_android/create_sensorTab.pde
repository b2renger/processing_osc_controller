/*
this function will create a tab with sensor data for android
 with gui elements to activate/ desactivate the reading
 and elements to display the data
 */

// mic
KetaiAudioInput mic;
short[] audioData;
float audioAvg = 0;

// other sensors
KetaiSensor sensor;

// light
ArrayList<Float> lightData = new ArrayList();
float lightAvg = 0;
boolean lightOn = false;


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


  // other sensors
  sensor = new KetaiSensor(this);
  sensor.start();
  sensor.list();

  // light
  c = new Toggle(width*0.05, height*.2, width*.1, width*.1, "Light");
  c.moveTo(1);
  g.addController(c);
  c.register(new CallBackHandler(c) {
    public void onEvent() {
      lightOn = !lightOn;
    }
  }
  );
}


void draw_sensors() {


  // mic input
  if (audioData != null) {  
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


  // light input
  float rad;
  String label;
  if (lightOn) {
    rad = constrain(map(lightAvg, 0, 1024, 10, 100), 10, 150);
    label = nf(lightAvg, 0, 1);
  } else {
    rad = 10;
    label = nf(0, 0, 1);
  }
  ellipse(width*.8, height*.20 + width*0.05, rad, rad);
  text(" light level : " + label, width*0.2, height*.20 + width*0.05);
}

void update_sensors() {

  sendFloatMessage("/mic", audioAvg);

  if (lightOn) sendFloatMessage("/light", lightAvg);
}


// audio
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
  audioAvg = map(audioAvg, 0, 32767, 0, 1);
}

// light
void onLightEvent(float v) {
  lightData.add(v);
  if (lightData.size()> 15) lightData.remove(0);
  lightAvg = 0;
  for (int i = 0; i < lightData.size(); i ++) {
    lightAvg += lightData.get(i);
  }
  lightAvg = lightAvg / (float) lightData.size() ;
}
