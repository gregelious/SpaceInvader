public class Basic extends Enemy {
  
  public Basic(int x, int y) {
    locX = x;
    locY = y;
    c = color(255);
    size = 1;
    hP = 100;
    strafe = 0;
    velocity = 1;
    chop = 0;
    pause = 40;
    avatar = loadImage("basicimage.png");
  }
  
  void move() {
    chop++;
    if (strafe == 0 && chop%pause == 0) {
        locX += velocity * 15;
    }
    if (strafe == 1 && chop%pause == 0) {
      locX -= velocity * 15;
    }
  }
  
  void display(color co, int w, int h) {
    //fill(255);
    //noStroke();
    //ellipse(locX, locY, 30, 30);
    tint(co);
    imageMode(CENTER);
    image(avatar, locX, locY, w, h);
  }
  
}
