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
      locX += 2;
      if (basics.get(basics.size() - 1).getLocX() > width) {
        //locX = 985;
        for (int i = 0; i < basics.size(); i++) {
        basics.get(i).setLocY(basics.get(i).getLocY() + 15);
        basics.get(i).setStrafe(1);
        }
      }
    }
    if (strafe == 1) {
      locX -= 2;
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
