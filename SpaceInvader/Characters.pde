public class Characters {
  int hP;
  int locX;
  int locY;
  color c;
  int velocity;
  PImage avatar;
  
  int getHP() {
    return hP;
  }
  
  int getLocX() {
    return locX;
  }
  
  int getLocY() {
    return locY;
  }
  
  void setLocX(int newLoc) {
    locX = newLoc;
  }
  
  void setLocY(int newLoc) {
    locY = newLoc;
  }
  
  void move() {
  
  }
  
  void setHP(int newHP) {
    hP = newHP;
  }
  
  int getVel() {
    return velocity;
  }
  
  void setVel(int newVel) {
    velocity = newVel;
  }
  
  void display() {
    fill(c);
    noStroke();
    ellipse(locX, locY, 30, 30);
  }
}
