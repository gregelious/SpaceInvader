public class Intermediate extends Enemy {

  public Intermediate(int x, int y) {
    locX = x;
    locY = y;
    c = color(255);
    size = 1;
    hP = 150;
    velocity = 2;
    strafe = (int)random(2);
  }

  void move() {
    if (basics.size() < 0 && (int)random(30) == 1) {
      locY += 4;
    } else {
      velocity = basics.get(0).getVel() * 2;
      locY = basics.get(0).getLocY() - 40;
    }
    if (strafe != 0 && locX >= 1000) {
      locX = 0;
    }
    else if (strafe == 0 && locX <= 0) {
      locX = 1000;
    }
    if (strafe == 0) {
      locX -= velocity;
    } else {
      locX += velocity;
    }
  }
}
