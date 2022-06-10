public class Intermediate extends Enemy {

  public Intermediate(int x, int y) {
    locX = x;
    locY = y;
    c = color(255);
    size = 1;
    hP = 150;
    velocity = 2;
  }
  
  void move() {
    if ((int)random(60) == 1) {
      locY += 1;
    }
    if (locX >= 1000) {
      locX = 15;
    }
    locX += velocity;
  }  
  
}
