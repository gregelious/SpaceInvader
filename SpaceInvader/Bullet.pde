public class Bullet {
  int locX;
  int locY;
  int velocity;
  //int acceleration;
  int size;
  int dmg;
  int mode;
  color c;

  public Bullet(int x, int y, int vel, int mode, int dam) {
    locX = x;
    locY = y;
    velocity = vel;
    this.mode = mode;
    size = 1;
    dmg = dam;
    if (mode == 1) {
      c = color(10, random(50) + 200, 10);
    } else {
      c = color(255);
    }
  }

  public Bullet(int x, int y, int mode) {
    locX = x;
    locY = y;
    if(mode == 2) {
    velocity = 6;
    }
    else {
      velocity = 12;
    }
    this.mode = mode;
    size = 1;
    dmg = 100;
    if (mode == 1) {
      c = color(10, random(50) + 200, 10);
    } else {
      c = color(255);
    }
  }

  void display() {
    fill(c);
    noStroke();
    rect(locX - 4*size, locY - 16*size, 8*size, 32*size);
  }

  void move() {
    //mode 1 = up, 2 = down
    if (mode == 1) {
      locY = locY - velocity;
    }
    else {
      locY = locY + velocity;
    }
  }

  int getDmg() {
    return dmg;
  }
  
  int getMode() {
    return mode;
  }
  
  int getLocX() {
    return locX;
  }
  
  int getLocY() {
    return locY;
  }
}
