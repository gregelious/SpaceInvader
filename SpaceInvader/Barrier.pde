public class Barrier {
  int locX;
  int locY;
  int size;
  int hP;
  color c;
  
  public Barrier (int x, int y) {
    locX = x;
    locY = y;
    size = 1;
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
      ellipse(locX, locY, 25*size, 50*size);
    }
    else if (hP < 50) {
      ellipse(locX, locY, 25*size, 50*size);
    }
    else if (hP < 75) {
      ellipse(locX, locY, 18*size, 36*size);
    }
    else {
      ellipse(locX, locY, 25*size, 50*size);
    }
  }
}
