public class Player extends Characters {
  String bulletType;
  
  public Player() {
    locX = 500;
    locY = 615;
    c = color(random(50) + 200, 10, 10);
    hP = 300;
  }
  
  String getBulletType() {
    return bulletType;
  }
  
  void setBulletType(String newBullet) {
    bulletType = newBullet;
  }
  
  void moveLeft() {
    locX = locX - 4;
    if (locX < 15) {
      locX = 15;
    } 
  }
  
  void moveRight() {
    locX = locX + 4;
    if (locX > 985) {
      locX = 985;
    }
  }

}
