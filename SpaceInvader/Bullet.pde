public class Bullet {
  int locX;
  int locY;
  int velocity;
  int acceleration;
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
      c = color(random(50) + 200, 10, 10);
    }
    else {
      c = color(10, 10, random(50) + 200);
    }
  }
  
  void display() {
    fill(c);
    noStroke();
    rect(locX, locY, 10*size, 40*size);
  }
  
  void move() {
  //mode 1 = up, 2 = down
  }
  
  int getDmg() {
    return dmg;
  }
}
