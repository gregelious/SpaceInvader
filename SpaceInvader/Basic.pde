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
      locX = locX + 3;
      if (locX > width) {
        locX = 985;
        strafe = 1;
      }
    }
    if (strafe == 1) {
      locX = locX - 3;
      if (locX < 0) {
        locX = 15;
        strafe = 0;
      }
    }
  }
  
}
