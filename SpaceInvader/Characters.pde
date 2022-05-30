public class Characters {
  int hP;
  int locX;
  int locY;
  color c;
  
  int getHP() {
    return hP;
  }
  
  int getLocX() {
    return locX;
  }
  
  int getLocY() {
    return locY;
  }
  
  void move() {
  
  }
  
  void setHP(int newHP) {
    hP = newHP;
  }
  
  void display() {
    fill(c);
    noStroke();
    ellipse(locX, locY, 30, 30);
  }
}
