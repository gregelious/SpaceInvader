public class Player extends Characters {
  String bulletType;
  
  public Player() {
    locX = 10;
    locY = 10;
    c = color(random(50) + 200, 10, 10);
    hP = 100;
  }
  
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
