public class Basic extends Enemy {
  
  public Basic(int x, int y) {
    locX = x;
    locY = y;
    c = color(255);
    size = 1;
    hP = 100;
    strafe = 0;
    velocity = 1;
    chop = 0;
    pause = 40;
  }
  
  void move() {
    chop++;
    if (strafe == 0 && chop%pause == 0) {
        locX += velocity * 15;
    }
    if (strafe == 1 && chop%pause == 0) {
      locX -= velocity * 15;
    }
  }
  
}
