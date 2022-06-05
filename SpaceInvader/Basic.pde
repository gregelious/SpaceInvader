public class Basic extends Enemy {
  
  public Basic(int x, int y) {
    locX = x;
    locY = y;
    c = color(255);
    size = 1;
    hP = 100;
    strafe = 0;
    velocity = 1;
  }
  
  void move() {
    if (strafe == 0) {
      locX += velocity;
      if (basics.get(basics.size() - 1).getLocX() > width) {
        //locX = 985;
        for (int i = 0; i < basics.size(); i++) {
        basics.get(i).setLocY(basics.get(i).getLocY() + 15);
        basics.get(i).setStrafe(1);
        }
      }
    }
    if (strafe == 1) {
      locX -= velocity;
      if (basics.get(0).getLocX() < 0) {
        //locX = 15;
        for (int i = 0; i < basics.size(); i++) {
        basics.get(i).setLocY(basics.get(i).getLocY() + 15);
        basics.get(i).setStrafe(0);
        }
      }
    }
  }
  
  int getStrafe() {
    return strafe;
  }
  
  void setStrafe(int newStrafe) {
    strafe = newStrafe;
  }
  
}
