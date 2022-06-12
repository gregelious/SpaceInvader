public class Intermediate extends Enemy {

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
    avatar = loadImage("intermediateimage.png");
  }

  void move() {
    chop++;
    if (basics.size() < 1 && chop%pause == 0) {
      velocity = 12;
      locY += 8;
    } else if (basics.size() > 0) {
      if (basics.size() < 2) {
        velocity = 12;
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
