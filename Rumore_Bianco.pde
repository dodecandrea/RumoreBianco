import processing.serial.*;

System system;
Serial port;

PFont font;
float fontCorrection;
float halfWidth, halfHeight;
int instantDistance;
float RMSdistance;
int max;
int min; 

ArrayList<PVector> points;

void setup() {
  String portName = Serial.list()[1];
  //println(Serial.list()[0] + " " + Serial.list()[1]);
  port = new Serial(this, portName, 9600);
  port.clear();
  instantDistance = 0;
  RMSdistance = 0;
  max = 140;
  min = 50;
  
  size(1280, 720);
  //fullScreen();
  background(0);
  
  halfWidth = width/2;
  halfHeight = height/2;
  
  font = createFont("Arial", halfWidth/4);
  textFont(font);
  fontCorrection = textAscent()*0.25;
  textAlign(CENTER, CENTER);

  points = new ArrayList();

  background(0);
  text("Rumore Bianco", halfWidth, halfHeight);
  loadPixels();
  for(int y = 0; y < pixels.length; y++) {
    if(brightness(pixels[y]) > 128) {
      points.add(new PVector(floor(y%width), floor(y/width)));
    }
  }
  
  system = new System(3000);
  system.start();
  
}

void draw() {
  if( port.available() > 0) {
    String read = port.readStringUntil(10);
    try {
      instantDistance = Integer.parseInt(read.substring(0, read.length()-2));
      if(instantDistance < min) {
        instantDistance = min;
      }
      if(instantDistance > max) {
        instantDistance = max;
      }
    } catch(Exception e) {}
  }
  RMSdistance += ((int)instantDistance - RMSdistance) * 0.1;
  println(RMSdistance);
  background(249, 66, 58);

  for(Entity e : system.entities) {
      e.display();
  }
}

//¥•$#
