import java.util.Map;

public class System extends Thread{
 
  public System(int q) {
    entities = new ArrayList();
    for (int i = 0; i < q; i++) {
      PVector obj = points.get((int)random(points.size()));
      float a = random(TWO_PI);
      entities.add(new Entity(new PVector(random(width), random(height)), obj));
    }
    int times = (int)random(q/6);
    for(int i = 0; i < times; i++) {
      ArrayList<Entity> p = new ArrayList();
      p.add(entities.get((int)random(entities.size())));
      entities.get((int)random(entities.size())).addPointInSpace(p);
    }
    add = 0;
  }
  
  @Override
  public void run() {
    while(true) {
      for(Entity e : entities) {
        e.update();
      }
      if(add < millis) {
        add += 30;
      } else {
        add = 0;
        for(Entity e : entities) {
          e.applyForce();
        }
      }
      delay(30);
    }
  }
  
  ArrayList<Entity> entities;
  private long add;
  private static final long millis = 450000;
}
