ArrayList<Basic> basics;
ArrayList<Barrier> barriers;
ArrayList<Bullet> bullets;
Player a;
int playerLives;
int scoreCurrent;
int scoreHigh;
int countdown;

void setup() {
  /**
   for (int i = 0; i < 3; i++) {
   a = new Player();
   playerLives.add(a);
   }
   **/
  playerLives = 3;
  a = new Player();
  countdown = 0;
  size(1000, 750);
  basics = new ArrayList<Basic>();
  barriers = new ArrayList<Barrier>();
  bullets = new ArrayList<Bullet>();
  //playerLives = new ArrayList<Player>();
  scoreCurrent = 0;
  scoreHigh = 0;
  //int h = 100;
  for (int i = 15; i < 900; i += 90) {
    Basic e = new Basic(i, 120);
    basics.add(e);
    //h += 40;
  }

  for (int i = 130; i < 900; i += 230) {
    Barrier b = new Barrier(i, 550);
    barriers.add(b);
  }
}

//Player a = new Player();

void draw() {
  if (a.getHP() > 0 && basics.size() > 0 && playerLives > 0) {
    if (countdown > 0) {
      countdown--;
    }
    background(35);
    fill(255);
    textSize(30);
    if (scoreCurrent > scoreHigh) {
      scoreHigh = scoreCurrent;
    }
    text("S C O R E <1>", 160, 35);
    text("H I - S C O R E  S C O R E <2>", 430, 35);
    text(scoreToString(scoreCurrent), 200, 80);
    text(scoreToString(scoreHigh), 451, 80);
    textSize(25);
    text(playerLives, 10, 730);

    a.display();

    for (int i = 0; i < basics.size(); i++) {
      Enemy e = basics.get(i);
      if (e.getHP() <= 0) {
        basics.remove(e);
        i--;
        scoreCurrent += 100;
      } else {
        if (Math.abs(e.getLocX() - a.getLocX()) < 30 && Math.abs(e.getLocY() - a.getLocY()) < 30) {
          a.setHP(0);
        }
        e.move();
        e.display();
        if ((int)random(170) == 1) {
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
        for (int x = 0; x < basics.size(); x++) {
          Enemy e = basics.get(x);
          if (Math.abs(e.getLocX() - b.getLocX()) < 14 && Math.abs(e.getLocY() - b.getLocY()) < 31 ) {
            e.setHP(e.getHP() - b.getDmg());
            bullets.remove(b);
            i--;
            gone = 1;
          }
        }
      } else if (b.getMode() == 2) {
        if (Math.abs(a.getLocX() - b.getLocX()) < 14 && Math.abs(a.getLocY() - b.getLocY()) < 31 ) {
          a.setHP(a.getHP() - b.getDmg());
          bullets.remove(b);
          i--;
          gone = 1;
        }
      }

      if (gone == 0) {
        for (int x = 0; x < barriers.size(); x++) {
          Barrier ba = barriers.get(x);
          if (Math.abs(ba.getLocX() - b.getLocX()) < 47 && Math.abs(ba.getLocY() - b.getLocY()) < 33) {
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
  } else if (playerLives < 1) {
    background(0);
    fill(255);
    textSize(80);
    if (scoreCurrent > scoreHigh) {
      scoreHigh = scoreCurrent;
    }
    text("You Suck!", 310, 150);
    text("Score: " + scoreCurrent, 140, 330);
    text("Highest Score: " + scoreHigh, 140, 480);
  } else if (playerLives > 0 && basics.size() <=0) {
    background(0);
    fill(255);
    textSize(80);
    if (scoreCurrent > scoreHigh) {
      scoreHigh = scoreCurrent;
    }
    text("Nice Job!", 340, 150);
    text("Score: " + scoreCurrent, 140, 330);
    text("Highest Score: " + scoreHigh, 140, 480);
  } else if (playerLives > 0) {
    a = new Player();
    playerLives--;
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

String scoreToString(int score) {
  String d = "";
  String s = Integer.toString(score);
  if (score < 10) {
    d = "0 0 0 " + score;
  } else if (score < 100) {
    d = "0 0 ";
    for (int i = 0; i < s.length(); i++) {
      d += s.substring(i, i+1) + " ";
    }
  } else if (score < 1000) {
    d = "0 ";
    for (int i = 0; i < s.length(); i++) {
      d += s.substring(i, i+1) + " ";
    }
  } else {
    for (int i = 0; i < s.length(); i++) {
      d += s.substring(i, i+1) + " ";
    }
  }
  return d;
}
