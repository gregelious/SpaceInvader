public class Barrier {
  int locX;
  int locY;
  float size;
  int hP;
  color c;

  public Barrier (int x, int y) {
    locX = x;
    locY = y;
    size = 2;
    hP = 1000;
    c = color(10, random(50) + 200, 10);
  }

  public Barrier (int x, int y, int size, int hP) {
    locX = x;
    locY = y;
    c = color(10, random(50) + 200, 10);
    this.size = size;
    this.hP = hP;
  }

  float getSize() {
    return size;
  }

  void setSize(float newSize) {
    size = newSize;
  }

  int getHP() {
    return hP;
  }

  void setHP(int newHP) {
    hP = newHP;
  }

  int getLocX() {
    return locX;
  }

  int getLocY() {
    return locY;
  }

  void display() {
    fill(c);
    noStroke();
    rect(locX - 22*size, locY-8*size, 44*size, 16*size);
    /**
     if (hP < 25) {
     rect(locX, locY, 10*size, 4*size);
     }
     else if (hP < 50) {
     rect(locX, locY, 20*size, 8*size);
     }
     else if (hP < 75) {
     rect(locX, locY, 30*size, 12*size);
     }
     else {
     rect(locX, locY, 40*size, 16*size);
     }
     **/
  }
}
