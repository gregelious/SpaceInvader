public class Player extends Characters {
  String bulletType;
  
  public Player() {
    locX = 80;
    locY = 608;
    c = color(10, random(50) + 200, 10);
    hP = 100;
    velocity = 5;
    avatar = loadImage("spaceship.png");
  }
  
  public Player(int x, int y) {
    locX = x;
    locY = y;
    c = color(10, random(50) + 200, 10);
    hP = 100;
    velocity = 5;
    avatar = loadImage("spaceship.png");
  }
  
  String getBulletType() {
    return bulletType;
  }
  
  void setBulletType(String newBullet) {
    bulletType = newBullet;
  }
  
  void moveLeft() {
    locX -= velocity;
    if (locX < 15) {
      locX = 15;
    } 
  }
  
  void moveRight() {
    locX += velocity;
    if (locX > 985) {
      locX = 985;
    }
  }
  
  void display(int x, int y) {
    //fill(c);
    //noStroke();
    //ellipse(locX, locY, 30, 30);
    tint(0, 255, 0);
    imageMode(CENTER);
    image(avatar, x, y, 54, 55);
  }

}
