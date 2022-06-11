public class Hard extends Enemy {

  public Hard(int x, int y) {
    locX = x;
    locY = y;
    c = color(255);
    size = 2;
    hP = 250;
    strafe = 0;
    chop = 0;
    pause = 120;
  }
  
  void move() {
    chop++;
    if (chop%pause == 0) {
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
