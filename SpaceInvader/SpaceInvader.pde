ArrayList<Enemy> enemies;
ArrayList<Barrier> barriers;
ArrayList<Bullet> bullets;
//ArrayList<Player> playerLives;
int scoreCurrent;
int scoreHigh;

void setup() {
  size(1000, 700);
  enemies = new ArrayList<Enemy>();
  barriers = new ArrayList<Barrier>();
  bullets = new ArrayList<Bullet>();
  //playerLives = new ArrayList<Player>();
  scoreCurrent = 0;
  scoreHigh = 0;
  for (int i = 15; i < 985; i += 90) {
    Enemy e = new Basic(i, 300);
    enemies.add(e);
  }

  for (int i = 90; i < 900; i += 230) {
    Barrier b = new Barrier(i, 500);
    barriers.add(b);
  }
}

Player a = new Player();

void draw() {
  background(35);
  fill(255);
  textSize(30);
  if (scoreCurrent > scoreHigh) {
    scoreHigh = scoreCurrent;
  }
  text("Current Score: " + scoreCurrent, 200, 35);
  text("Highest Score: " + scoreHigh, 535, 35);
  if (a.getHP() > 0) {
    a.display();
  }
  
  for (int i = 0; i < enemies.size(); i++) {
    Enemy e = enemies.get(i);
    if (e.getHP() <= 0) {
      enemies.remove(e);
      i--;
      scoreCurrent++;
    } else {
      e.move();
      e.display();
    }
  }
  
  for (int i = 0; i < bullets.size(); i++) {
    Bullet b = bullets.get(i);
    if (b.getMode() == 1) {
      for (int x = 0; x < enemies.size(); x++) {
        Enemy e = enemies.get(x);
        if (Math.abs(e.getLocX() - b.getLocX()) <= 15 && Math.abs(e.getLocY() - b.getLocY()) <= 15 ) {
          e.setHP(e.getHP() - b.getDmg());
          bullets.remove(b);
          i--;
        }
      }
    }
  }
  
  for (Barrier b : barriers) {
    b.display();
  }
}

void mouseClicked() {
  shoot(a.getLocX(), a.getLocY(), 1);
}

void keyPressed() {
  if (key == 'd') {
    a.moveRight();
  }
  if (key == 'a') {
    a.moveLeft();
  }
  if (key == CODED) {
    if (keyCode == RIGHT) {
      a.moveRight();
    }
    if (keyCode == LEFT) {
      a.moveLeft();
    }
  }
}

void shoot(int x, int y, int mode) {
  Bullet b = new Bullet(x, y, mode);
  bullets.add(b);
}
