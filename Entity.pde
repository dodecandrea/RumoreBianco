public class Entity {
  
  public Entity(PVector pos, PVector objective) {
    this.pos = pos;
    randVel = new PVector(0, 0);
    objVel = new PVector(0, 0);
    this.objective = objective;
    rnd = new PVector(random(width), random(height));
    this.randScaling = random(0.001, 0.0005);
    this.objScaling = random(0.01, 0.005);
    this.randMomentum = random(0.99, 0.993);
    this.objMomentum = random(0.2, 0.2);
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
    
    dist.mult(objScaling);
    rndDist.mult(randScaling);
    randVel = PVector.add(randVel, rndDist);
    objVel = PVector.add(objVel, dist);
    randVel.mult(map(RMSdistance, min, max, 0.0f, 1.0f));
    objVel.mult(map(RMSdistance, min, max, 1.0f, 0.0f));
    
    pos.add(objVel);
    pos.add(randVel);
  }
  
  public void update() {
    applyForce();
  }
  
  public void changeObjective(PVector newObj) {
    this.objective = newObj;
  }
  
  float randScaling;
  float objScaling;
  float randMomentum;
  float objMomentum;
  PVector pos;
  PVector randVel;
  PVector objVel;
  PVector rnd;
  PVector objective;
  PVector other;
  ArrayList<Entity> pointsInSpace;
  ArrayList<PVector> tail;
}
