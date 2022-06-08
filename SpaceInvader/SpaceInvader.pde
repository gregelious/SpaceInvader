ArrayList<Basic> basics;
int basicsHeight;
ArrayList<Barrier> barriers;
ArrayList<Bullet> bullets;

int playerLives;
int scoreCurrent;
int scoreHigh;
int countdown;

Player player, p2, p3;

void setup() {
  size(1000, 750);
  basics = new ArrayList<Basic>();
  barriers = new ArrayList<Barrier>();
  bullets = new ArrayList<Bullet>();

  playerLives = 0;
  player = new Player();
  p2 = new Player(70, 701);
  p3 = new Player(110, 701);

  countdown = 0;
  scoreCurrent = 0;
  scoreHigh = 0;

  basicsHeight = 120;
  fillBasics(basicsHeight);
  fillBarriers(530);
}

void draw() {
  if (player.getHP() > 0 && playerLives > 0 && basics.size() > 0) {
    if (countdown > 0) {
      countdown--;
    }

    showText();
    player.display();
    showBullets();
    showBasics();
    showBarriers();
  } else if (playerLives < 1) {
    endScreen();
  } else if (playerLives > 0 && basics.size() < 1) {
    basicsHeight += 30;
    fillBasics(basicsHeight);
  } else if (playerLives > 0) {
    player = new Player();
    playerLives--;
  }
}

void mouseClicked() {
  if (countdown == 0) {
    shoot(player.getLocX(), player.getLocY(), 1);
    countdown += 40;
  }
}

void keyPressed() {
  if (key == 'd') {
    player.moveRight();
  }
  if (key == 'a') {
    player.moveLeft();
  }
  if (key == CODED) {
    if (keyCode == RIGHT) {
      player.moveRight();
    }
    if (keyCode == LEFT) {
      player.moveLeft();
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

void fillBasics(int height) {
  for (int i = 15; i < 900; i += 50) {
    Basic e = new Basic(i, height);
    basics.add(e);
  }
}

void fillBarriers(int height) {
  for (int i = 147; i < 900; i += 230) {
    Barrier b = new Barrier(i, height, 2, 2000);
    barriers.add(b);
  }
}

void showText() {
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
  text(playerLives, 10, 710);
  text("S C O R E   0 0", 720, 710);
  stroke(20, 250, 30);
  strokeWeight(4);
  line(0, 680, 1000, 683);
  if (playerLives > 1) {
    p2.display();
  }
  if (playerLives > 2) {
    p3.display();
  }
}

void showBasics() {
  for (int i = 0; i < basics.size(); i++) {
    Enemy e = basics.get(i);
    if (e.getHP() <= 0) {
      basics.remove(e);
      i--;
      scoreCurrent += 10;
    } else {
      if (Math.abs(e.getLocX() - player.getLocX()) < 30 && Math.abs(e.getLocY() - player.getLocY()) < 30) {
        player.setHP(0);
      }
      if (basics.size() < 2) {
        e.setVel(12);
      } else if (basics.size() < 4) {
        e.setVel(5);
      } else if (basics.size() < 8) {
        e.setVel(2);
      }
      e.move();
      e.display();
    }
  }
  if ((int)random(60) == 1) {
    int ran = (int)random(basics.size());
    Enemy e = basics.get(ran);
    shoot(e.getLocX(), e.getLocY(), 2);
  }
}

void showBarriers() {
  for (int i = 0; i < barriers.size(); i++) {
    Barrier b = barriers.get(i);
    if (b.getHP() <= 0) {
      barriers.remove(b);
      i--;
    } else {
      b.display();
    }
  }
}

void showBullets() {
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
      if (Math.abs(player.getLocX() - b.getLocX()) < 14 && Math.abs(player.getLocY() - b.getLocY()) < 31 ) {
        player.setHP(player.getHP() - b.getDmg());
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
      if (b.getLocY() < 115 || b.getLocY() > 668) {
        bullets.remove(b);
        i--;
      } else {
        b.move();
        b.display();
      }
    }
  }
}

void endScreen() {
  background(0);
  fill(255);
  textSize(80);
  if (scoreCurrent > scoreHigh) {
    scoreHigh = scoreCurrent;
  }
  if (scoreCurrent > 1000) {
    text("INSANE!", 310, 130);
  }
  else if (scoreCurrent > 500) {
    text("Pretty Good!", 310, 130);
  }
  else if (scoreCurrent > 100) {
    text("Not Bad!", 310, 130);
  }
  else {
    text("Better Luck Next Time!", 70, 130);
  }
  text("Score: " + scoreCurrent, 140, 270);
  text("Highest Score: " + scoreHigh, 140, 400);
  
  fill (10, 255, 10);
  rect(250, 480, 500, 200);
  fill(0);
  text("RESTART", 330, 610);
}
