import processing.sound.*;
SoundFile shot;
//SoundFile eMove;

ArrayList<Basic> basics;
ArrayList<Intermediate> intermediates;
ArrayList<Hard> hards;
ArrayList<Barrier> barriers;
ArrayList<Bullet> bullets;

int playerLives;
int scoreCurrent;
int scoreHigh;
int countdown;
int basicsHeight;
int level;
int total;

Player player, p2, p3;

void setup() {
  size(1000, 750);
  //basics = new ArrayList<Basic>();
  barriers = new ArrayList<Barrier>();
  bullets = new ArrayList<Bullet>();
  //intermediates = new ArrayList<Intermediate>();
  //hards = new ArrayList<Hard>();

  playerLives = 3;
  player = new Player();
  p2 = new Player(70, 701);
  p3 = new Player(110, 701);

  countdown = 0;
  scoreCurrent = 0;
  scoreHigh = 0;
  
  
  // CHANGE LEVEL TO 0 TO START AT VERY BEGINNING
  level = 0;
  // CHANGE LEVEL TO 0 TO START AT VERY BEGINNING
  
  
  basicsHeight = 150 + (level * 10);

  fillBasics(basicsHeight);
  fillIntermediates();
  fillBarriers(530);
  fillHards();
  
  shot = new SoundFile(this, "shotsound.wav");
 // eMove = new SoundFile(this, "enemysound.wav");
}

void draw() {
  total = basics.size() + intermediates.size() + hards.size();
  if (player.getHP() > 0 && playerLives > 0 && total > 0) {
    if (countdown > 0) {
      countdown--;
    }

    showText();
    player.display(color(0, 255, 0), 54, 55);
    showBullets();
    showBarriers();
    //eMove.play();
    showBasics();
    showIntermediates();
    showHards();
  } else if (playerLives < 1) {
    endScreen();
  } else if (playerLives > 0 && total < 1) {
    level++;
    basicsHeight += 30;
    fillBasics(basicsHeight);
    fillIntermediates();
    fillHards();
  } else if (playerLives > 0) {
    player = new Player(500, 608);
    playerLives--;
  }
}

void mouseClicked() {
  if (countdown == 0 && playerLives > 0) {
    //shot.play();
    shoot(player.getLocX(), player.getLocY(), 1);
    countdown += 40;
  } else if (playerLives < 1 && mouseX >= 250 && mouseX <= 750 && mouseY >= 480 && mouseY <= 680) {
    restart();
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
  shot.play();
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
  basics = new ArrayList<Basic>();
  for (int i = 15; i < 850; i += 50) {
    Basic e = new Basic(i, height);
    basics.add(e);
  }
}

void fillIntermediates() {
  intermediates = new ArrayList<Intermediate>();
  for (int i = 0; i < level; i++) {
    Intermediate e = new Intermediate((int)random(1000), basicsHeight - 40);
    intermediates.add(e);
  }
}

void fillHards() {
  hards = new ArrayList<Hard>();
  for (int i = 0; i < level - 2; i++) {
    Hard e = new Hard((int)random(1000), basicsHeight - 80);
    hards.add(e);
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
  text("C R E D I T   0 0", 700, 710);
  stroke(20, 250, 30);
  strokeWeight(4);
  line(0, 680, 1000, 683);
  if (playerLives > 1) {
    p2.display(color(0, 255, 0), 54, 55);
  }
  if (playerLives > 2) {
    p3.display(color(0, 255, 0), 54, 55);
  }
}

void showBasics() {
  if (basics.size() > 0) {
  if (basics.get(0).getStrafe() == 0) {
    if (basics.get(basics.size() - 1).getLocX() >= 985) {
      for (int x = 0; x < basics.size(); x++) {
        basics.get(x).setLocY(basics.get(x).getLocY() + 15);
        basics.get(x).setStrafe(1);
      }
    }
  } else if (basics.get(0).getStrafe() == 1) {
    if (basics.get(0).getLocX() <= 15) {
      for (int x = 0; x < basics.size(); x++) {
        basics.get(x).setLocY(basics.get(x).getLocY() + 15); 
        basics.get(x).setStrafe(0);
      }
    }
  }
  for (int i = 0; i < basics.size(); i++) {
    Basic e = basics.get(i);
    if (e.getHP() <= 0) {
      basics.remove(e);
      i--;
      scoreCurrent += 10;
    } else {
      if (Math.abs(e.getLocX() - player.getLocX()) < 30 && Math.abs(e.getLocY() - player.getLocY()) < 30) {
        player.setHP(0);
      }
      if (basics.size() < 2) {
        e.setPause(2);
      } else if (basics.size() < 4) {
        e.setPause(5);
      } else if (basics.size() < 8) {
        e.setPause(20);
      }
      e.move();
      e.display(color(255), 35, 32);
    }
  }
  if ((int)random(60) == 1 && basics.size() > 1) {
    int ran = (int)random(basics.size());
    Enemy e = basics.get(ran);
    shoot(e.getLocX(), e.getLocY(), 2);
  }
  }
}

void showIntermediates() {
  if (intermediates.size() > 0) {
  for (int i = 0; i < intermediates.size(); i++) {
    Enemy e = intermediates.get(i);
    if (e.getHP() <= 0) {
      intermediates.remove(e);
      i--;
      scoreCurrent += 20;
    } else {
      if (Math.abs(e.getLocX() - player.getLocX()) < 30 && Math.abs(e.getLocY() - player.getLocY()) < 30) {
        player.setHP(0);
      }
      e.move();
      e.display(color(255), 35, 32);
    }
  }
  if ((int)random(60) == 1 && intermediates.size() > 0) {
    int ran = (int)random(intermediates.size());
    Enemy e = intermediates.get(ran);
    shoot(e.getLocX(), e.getLocY(), 2);
  }
  }
}

void showHards() {
  if (hards.size() > 0) {
  for (int i = 0; i < hards.size(); i++) {
    Enemy e = hards.get(i);
    if (e.getHP() <= 0) {
      hards.remove(e);
      i--;
      scoreCurrent += 30;
    } else {
      if (Math.abs(e.getLocX() - player.getLocX()) < 30 && Math.abs(e.getLocY() - player.getLocY()) < 30) {
        player.setHP(0);
      }
      e.move();
      e.display(color(255), 35, 32);
    }
  }
  if ((int)random(60) == 1 && hards.size() > 0) {
    int ran = (int)random(hards.size());
    Enemy e = hards.get(ran);
    shoot(e.getLocX(), e.getLocY(), 2);
  }
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
      if (gone == 0) {
        for (int x = 0; x < intermediates.size(); x++) {
          Enemy e = intermediates.get(x);
          if (Math.abs(e.getLocX() - b.getLocX()) < 14 && Math.abs(e.getLocY() - b.getLocY()) < 31 ) {
            e.setHP(e.getHP() - b.getDmg());
            bullets.remove(b);
            i--;
            gone = 1;
          }
        }
      }
      if (gone == 0) {
        for (int x = 0; x < hards.size(); x++) {
          Enemy e = hards.get(x);
          if (Math.abs(e.getLocX() - b.getLocX()) < 14 && Math.abs(e.getLocY() - b.getLocY()) < 31 ) {
            e.setHP(e.getHP() - b.getDmg());
            bullets.remove(b);
            i--;
            gone = 1;
          }
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
          gone = 1;
        }
      }
      if (b.getLocY() < 115 || b.getLocY() > 668 && gone == 0) {
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
  } else if (scoreCurrent > 500) {
    text("Pretty Good!", 310, 130);
  } else if (scoreCurrent > 100) {
    text("Not Bad!", 310, 130);
  } else {
    text("Better Luck Next Time!", 70, 130);
  }
  text("Score: " + scoreCurrent, 140, 270);
  text("Highest Score: " + scoreHigh, 140, 400);

  fill (10, 255, 10);
  rect(250, 480, 500, 200);
  fill(0);
  text("RESTART", 330, 610);
}

void restart() {
  basics = new ArrayList<Basic>();
  intermediates = new ArrayList<Intermediate>();
  barriers = new ArrayList<Barrier>();
  bullets = new ArrayList<Bullet>();
  hards = new ArrayList<Hard>();

  playerLives = 3;
  player = new Player();
  p2 = new Player(70, 701);
  p3 = new Player(110, 701);

  countdown = 0;
  scoreCurrent = 0;
  level = 0;

  basicsHeight = 120;
  fillBasics(basicsHeight);
  fillBarriers(530);
  fillHards();
}
