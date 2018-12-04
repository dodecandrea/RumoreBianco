System system;

PImage img;

PFont font;
float fontCorrection;
float halfWidth, halfHeight;

ArrayList<PVector> points;

void setup() {
  //size(1280, 720, P2D);
  fullScreen(P2D);
  background(0);
  
  halfWidth = width/2;
  halfHeight = height/2;
  
  img = loadImage("nero.png");
  img.resize(width, height);
  img.filter(INVERT);
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
      points.add(new PVector(floor(y%img.width), floor(y/img.width)));
    }
  }
  
  system = new System(3000);
  system.start();
  
}

void draw() {
  background(249, 66, 58);
  
  for(Entity e : system.entities) {
      e.display();
  }
}

//¥•$#
