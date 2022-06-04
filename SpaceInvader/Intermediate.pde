public class Intermediate extends Enemy {

  public Intermediate(int x, int y) {
    locX = x;
    locY = y;
    c = color(10, random(20) + 170, 100);
    size = 1;
    hP = 150;
    strafe = 0;
  }
  
  void move() {
    if (strafe == 0) {
      locX = locX + 5;
      if (locX > width) {
        strafe = 1;
      }
    }
    if (strafe == 1) {
      locX = locX - 5;
      if (locX < 0) {
        strafe = 0;
      }
    }
  }  
  
}
