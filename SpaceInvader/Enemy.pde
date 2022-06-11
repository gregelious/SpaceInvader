public class Enemy extends Characters {
  int size;
  int strafe;
  int chop;
  int pause;
  
  int getSize() {
    return size;
  }
  
  void setSize(int newSize) {
    size = newSize;
  }
  int getStrafe() {
    return strafe;
  }
  
  void setStrafe(int newStrafe) {
    strafe = newStrafe;
  }
  
  void setPause(int p) {
    pause = p;
  }
  
  int getPause() {
    return pause;
  }
}
