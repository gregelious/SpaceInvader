public class Barrier {
  int locX;
  int locY;
  int size;
  int hP;
  color c;
  
  public Barrier (int x, int y) {
    locX = x;
    locY = y;
    size = 3;
    hP = 500;
    c = color(10, random(50) + 200, 10);
  }
  
  public Barrier (int x, int y, int size, int hP) {
    locX = x;
    locY = y;
    hP = 100;
    c = color(10, random(50) + 200, 10);
    this.size = size;
    this.hP = hP;
  }
  
  int getSize() {
    return size;
  }

  void setSize(int newSize) {
    size = newSize;
  }

  int getHP() {
    return hP;
  }

  void setHP(int newHP) {
    hP = newHP;
  }
  
  void display() {
    fill(c);
    noStroke();
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
  }
}
