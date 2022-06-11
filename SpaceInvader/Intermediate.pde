public class Intermediate extends Enemy {
  int chop;
  int pause;

  public Intermediate(int x, int y) {
    locX = x;
    locY = y;
    c = color(255);
    size = 1;
    hP = 150;
    velocity = 2;
    strafe = (int)random(2);
    chop = 0;
    pause = 30;
  }

  void move() {
    chop++;
    if (basics.size() < 0 && chop%pause == 0) {
      velocity = 20;
      locY += 20;
    } else if (basics.size() > 0) {
      if (basics.size() < 2) {
        velocity = 15;
      }
      else if (basics.size() < 4) {
        velocity = 8;
      }
      else if (basics.size() < 8) {
        velocity = 5;
      }
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
