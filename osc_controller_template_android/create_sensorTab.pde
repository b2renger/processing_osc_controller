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

// Accel
ArrayList<Float> accX = new ArrayList();
float accXAvg = 0;
ArrayList<Float> accY = new ArrayList();
float accYAvg = 0;
ArrayList<Float> accZ = new ArrayList();
float accZAvg = 0;
boolean accOn = false;

// Orientation
ArrayList<Float> oriX = new ArrayList();
float oriXAvg = 0;
ArrayList<Float> oriY = new ArrayList();
float oriYAvg = 0;
ArrayList<Float> oriZ = new ArrayList();
float oriZAvg = 0;
boolean oriOn = false;


float anchorX;

void create_sensorTab() {
  anchorX = width*0.1;

  // mic input
  Controller c = new Toggle(anchorX, height*.10, width*.1, width*.1, "Mic");
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
  c = new Toggle(anchorX, height*.25, width*.1, width*.1, "Light");
  c.moveTo(1);
  g.addController(c);
  c.register(new CallBackHandler(c) {
    public void onEvent() {
      lightOn = !lightOn;
    }
  }
  );

  // accel
  c = new Toggle(anchorX, height*.4, width*.1, width*.1, "Accelerometer");
  c.moveTo(1);
  g.addController(c);
  c.register(new CallBackHandler(c) {
    public void onEvent() {
      accOn = !accOn;
    }
  }
  );

  // orientation
  c = new Toggle(anchorX, height*.65, width*.1, width*.1, "Orientation");
  c.moveTo(1);
  g.addController(c);
  c.register(new CallBackHandler(c) {
    public void onEvent() {
      oriOn = !oriOn;
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
  textAlign(CENTER, CENTER);
  text(" audio level : " + nf(audioAvg, 0, 3), width*0.5, height*.10 + width*0.05);


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
  ellipse(width*.8, height*.25 + width*0.05, rad, rad);
  text(" light level : " + label, width*0.5, height*.25 + width*0.05);

  // accel
  // accelX
  for (int i = 0; i < accX.size(); i++) {
    if (i != accX.size()-1) {  
      float v = accX.get(i);
      float vn = accX.get(i+1);
      line(map(i, 0, accX.size(), 0, width), map(v, -10, 10, height*0.45, height*0.5), 
        map(i+1, 0, accX.size(), 0, width), map(vn, -10, 10, height*0.45, height*0.5));
    }
  }
  rad = map(abs(accXAvg), 0, 9, 0, 50);
  ellipse(width*.8, height*.45 + width*0.05, 10 + rad, 10  +rad);
  text(" accel X : " + nf(accXAvg, 0, 3), width*0.5, height*.45 + width*0.05);
  // accelY
  for (int i = 0; i < accY.size(); i++) {
    if (i != accY.size()-1) {  
      float v = accY.get(i);
      float vn = accY.get(i+1);
      line(map(i, 0, accY.size(), 0, width), map(v, -10, 10, height*0.5, height*0.55), 
        map(i+1, 0, accY.size(), 0, width), map(vn, -10, 10, height*0.5, height*0.55));
    }
  }
  rad = map(abs(accYAvg), 0, 9, 0, 50);
  ellipse(width*.8, height*.5 + width*0.05, 10 + rad, 10  +rad);
  text(" accel Y : " + nf(accYAvg, 0, 3), width*0.5, height*.5 + width*0.05);
  // accelZ
  for (int i = 0; i < accZ.size(); i++) {
    if (i != accZ.size()-1) {  
      float v = accZ.get(i);
      float vn = accZ.get(i+1);
      line(map(i, 0, accZ.size(), 0, width), map(v, -10, 10, height*0.55, height*0.6), 
        map(i+1, 0, accZ.size(), 0, width), map(vn, -10, 10, height*0.55, height*0.6));
    }
  }
  rad = map(abs(accZAvg), 0, 9, 0, 50);
  ellipse(width*.8, height*.55 + width*0.05, 10 + rad, 10  +rad);
  text(" accel Z : " + nf(accYAvg, 0, 3), width*0.5, height*.55 + width*0.05);



  // orientation
}

void update_sensors() {

  sendFloatMessage("/mic", audioAvg);

  if (lightOn) sendFloatMessage("/light", lightAvg);

  if (accOn) { 
    sendFloatMessage("/accX", accXAvg);
    sendFloatMessage("/accY", accYAvg);
    sendFloatMessage("/accZ", accZAvg);
  }
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
  if (lightData.size()> 25) lightData.remove(0);
  lightAvg = 0;
  for (int i = 0; i < lightData.size(); i ++) {
    lightAvg += lightData.get(i);
  }
  lightAvg = lightAvg / (float) lightData.size() ;
}

// accel event
void onAccelerometerEvent(float x, float y, float z) {
  if (accOn) {
    accX.add(x);
    accY.add(y);
    accZ.add(z);

    if (accX.size()> 30) accX.remove(0);
    if (accY.size()> 30) accY.remove(0);
    if (accZ.size()> 30) accZ.remove(0);

    for (int i = 0; i < accX.size(); i ++) {
      accXAvg += accX.get(i);
      accYAvg += accY.get(i);
      accZAvg += accZ.get(i);
    }
    accXAvg = accXAvg / (float) accX.size() ;
    accYAvg = accYAvg / (float) accY.size() ;
    accZAvg = accZAvg / (float) accZ.size() ;
  }
}

// orientation event
void onRotationVectorEvent(float x, float y, float z) {
  
  
}
