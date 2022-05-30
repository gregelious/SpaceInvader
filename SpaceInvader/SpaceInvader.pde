ArrayList<Enemy> enemies;
ArrayList<Barrier> barriers;
//ArrayList<Player> playerLives;
int scoreCurrent;
int scoreHigh;

void setup() {
  size(1000,700);
  enemies = new ArrayList<Enemy>();
  barriers = new ArrayList<Barrier>();
  //playerLives = new ArrayList<Player>();
  scoreCurrent = 0;
  scoreHigh = 0;
  for (int i = 15; i < 985; i += 45) {
    Enemy e = new Basic(i, 500);
    enemies.add(e);
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
  text("Current Score: " + scoreCurrent, 20, 35);
  text("Highest Score: " + scoreHigh, 300, 35);
  a.display();
  for (Enemy e : enemies) {
    e.move();
    e.display();
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
