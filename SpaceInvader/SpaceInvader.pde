ArrayList<Enemy> enemies;
ArrayList<Barrier> barriers;
ArrayList<Bullet> bullets;
Player a;
//ArrayList<Player> playerLives;
int scoreCurrent;
int scoreHigh;
int countdown;

void setup() {
  a = new Player();
  countdown = 0;
  size(1000, 700);
  enemies = new ArrayList<Enemy>();
  barriers = new ArrayList<Barrier>();
  bullets = new ArrayList<Bullet>();
  //playerLives = new ArrayList<Player>();
  scoreCurrent = 0;
  scoreHigh = 0;
  int h = 100;
  for (int i = 15; i < 900; i += 90) {
    Enemy e = new Basic(i, h);
    enemies.add(e);
    h += 40;
  }

  for (int i = 130; i < 900; i += 230) {
    Barrier b = new Barrier(i, 550);
    barriers.add(b);
  }
}

//Player a = new Player();

void draw() {
  if (a.getHP() > 0 && enemies.size() > 0) {
    if (countdown > 0) {
      countdown--;
    }
    background(35);
    fill(255);
    textSize(30);
    if (scoreCurrent > scoreHigh) {
      scoreHigh = scoreCurrent;
    }
    text("Current Score: " + scoreCurrent, 200, 35);
    text("Highest Score: " + scoreHigh, 535, 35);

    a.display();

    for (int i = 0; i < enemies.size(); i++) {
      Enemy e = enemies.get(i);
      if (e.getHP() <= 0) {
        enemies.remove(e);
        i--;
        scoreCurrent += 100;
      } else {
        if (Math.abs(e.getLocX() - a.getLocX()) < 30 && Math.abs(e.getLocY() - a.getLocY()) < 30) {
          a.setHP(0);
        }
        e.move();
        e.display();
        if ((int)random(150) == 1) {
          shoot(e.getLocX(), e.getLocY(), 2);
        }
      }
    }

    for (int i = 0; i < barriers.size(); i++) {
      Barrier b = barriers.get(i);
      if (b.getHP() <= 0) {
        barriers.remove(b);
        i--;
      } else {
        b.display();
      }
    }


    for (int i = 0; i < bullets.size(); i++) {
      int gone = 0;
      Bullet b = bullets.get(i);
      if (b.getMode() == 1) {
        for (int x = 0; x < enemies.size(); x++) {
          Enemy e = enemies.get(x);
          if (Math.abs(e.getLocX() - b.getLocX()) < 19 && Math.abs(e.getLocY() - b.getLocY()) < 31 ) {
            e.setHP(e.getHP() - b.getDmg());
            bullets.remove(b);
            i--;
            gone = 1;
          }
        }
      } else if (b.getMode() == 2) {
        if (Math.abs(a.getLocX() - b.getLocX()) < 19 && Math.abs(a.getLocY() - b.getLocY()) < 31 ) {
          a.setHP(a.getHP() - b.getDmg());
          bullets.remove(b);
          i--;
          gone = 1;
        }
      }

      if (gone == 0) {
        for (int x = 0; x < barriers.size(); x++) {
          Barrier ba = barriers.get(x);
          if (Math.abs(ba.getLocX() - b.getLocX()) < 49 && Math.abs(ba.getLocY() - b.getLocY()) < 33) {
            ba.setHP(ba.getHP() - b.getDmg());
            bullets.remove(b);
            i--;
          }
        }
        b.move();
        b.display();
      }

      //b.move();
      //b.display();
    }
  } else if (a.getHP() <= 0) {
    background(0);
    fill(255);
    textSize(80);
    if (scoreCurrent > scoreHigh) {
      scoreHigh = scoreCurrent;
    }
    text("You Suck!", 310, 150);
    text("Score: " + scoreCurrent, 140, 330);
    text("Highest Score: " + scoreHigh, 140, 480);
  }
  else {
    background(0);
    fill(255);
    textSize(80);
    if (scoreCurrent > scoreHigh) {
      scoreHigh = scoreCurrent;
    }
    text("Nice Job!", 340, 150);
    text("Score: " + scoreCurrent, 140, 330);
    text("Highest Score: " + scoreHigh, 140, 480);
  }
}

void mouseClicked() {
  if (countdown == 0) {
    shoot(a.getLocX(), a.getLocY(), 1);
    countdown += 40;
  }
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
