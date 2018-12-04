public class Entity {
  
  public Entity(PVector pos, PVector objective) {
    this.pos = pos;
    vel = new PVector(0, 0);
    this.objective = objective;
    rnd = new PVector(random(width), random(height));
    this.scaling = random(0.001, 0.0005);
    this.momentum = random(0.99, 0.993);
    pointsInSpace = new ArrayList();
    tail = new ArrayList();
  }
  
  public void display() {
    fill(0, map(PVector.sub(objective, pos).mag(), 350, 0, 0, 255));
    strokeWeight(5);
    point(pos.x, pos.y);
  }
  
  public void addPointInSpace(ArrayList<Entity> p) {
    this.pointsInSpace = p;
  }
  
  public void applyForce() {
    if(PVector.sub(new PVector(random(width), random(height)), pos).mag() < 30) {
      rnd = new PVector(random(width), random(height));
    }
    PVector rndDist = PVector.sub(rnd, pos);
    PVector dist = PVector.sub(objective, pos);
    
    dist.mult(scaling);
    rndDist.mult(scaling);
    
    dist.mult(map(mouseX, 0, width, 0.0f, 1.0f));
    rndDist.mult(map(mouseX, 0, width, 1.0f, 0.0f));
    vel.add(rndDist);
    vel.add(dist);
    vel.mult(momentum);
    pos.add(vel);
  }
  
  public void update() {
    applyForce();
  }
  
  float scaling;
  float momentum;
  PVector pos;
  PVector vel;
  PVector rnd;
  PVector objective;
  PVector other;
  ArrayList<Entity> pointsInSpace;
  ArrayList<PVector> tail;
}
