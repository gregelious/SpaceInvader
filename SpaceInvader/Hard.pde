public class Hard extends Enemy {

  public Hard(int x, int y) {
    locX = x;
    locY = y;
    c = color(random(20) + 40, 70, 140);
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
