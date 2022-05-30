public class Basic extends Enemy {
  
  public Basic(int x, int y) {
    locX = x;
    locY = y;
    c = color(10, 10, random(50) + 200);
    size = 1;
    hP = 100;
    strafe = 0;
  }
  
  void move() {
    if (strafe == 0) {
      locX = locX + 1;
      if (locX > width) {
        strafe = 1;
      }
    }
    if (strafe == 1) {
      locX = locX - 1;
      if (locX < 0) {
        strafe = 0;
      }
    }
  }
  
}
