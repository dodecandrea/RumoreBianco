import java.util.Map;

public class System extends Thread{
 
  public System(int q) {
    entities = new ArrayList();
    for (int i = 0; i < q; i++) {
      PVector obj = phrases.get(0).get((int)random(phrases.get(0).size()));
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
      if(add > millis) {
        counter ++;
        ArrayList<Entity> entities = system.getEntities();
        ArrayList<PVector> points = phrases.get(counter%phrases.size());
        for(int i = 0; i < entities.size(); i++) {
          entities.get(i).changeObjective(points.get((int)random(points.size()-1)));
        }
        add = 0;
      }
      add += 30;
      delay(30);
    }
  }
  
  private ArrayList<Entity> getEntities() {
    return entities;
  }
  
  ArrayList<Entity> entities;
  private long add;
  private static final long millis = 450000;
}
