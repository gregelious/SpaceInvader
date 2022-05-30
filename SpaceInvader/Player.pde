public class Player extends Characters {
  String bulletType;
  
  String getBulletType() {
    return bulletType;
  }
  
  void setBulletType(String newBullet) {
    bulletType = newBullet;
  }
  
  void moveLeft() {
    locX = locX - 1;
  }
  
  void moveRight() {
    locX = locX + 1;
  }
}
