public class Bullet {
  int locX;
  int locY;
  int velocity;
  int acceleration;
  int size;
  int dmg;
  int mode;
  
  public Bullet(int x, int y, int vel, int mode) {
    locX = x;
    locY = y;
    velocity = vel;
    this.mode = mode;
  }
  
  void display() {
    
  }
  
  void move() {
  //mode 1 = up, 2 = down
  }
  
  int getDmg() {
    return dmg;
  }
}
