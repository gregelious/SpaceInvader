public class Hard extends Enemy {
  
  int c;
  int pause;

  public Hard(int x, int y) {
    locX = x;
    locY = y;
    c = color(random(20) + 40, 70, 140);
    size = 2;
    hP = 250;
    strafe = 0;
    c = 0;
    pause = 60;
  }
  
  void move() {
    if (c%pause == 0) {
    locX = (int)random(970) + 15;
    }
    if (basics.size() > 0) {
      locY = basics.get(0).getLocY() - 80;
    }
    else if (intermediates.size() > 0) {
      locY = basics.get(0).getLocY() - 40;
    }
    else {
      locY = (int)random(488) + 120;
    }
  }
  
}
