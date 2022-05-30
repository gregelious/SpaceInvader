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
}

Player a = new Player();

void draw() {
  background(35);
  fill(255);
  text("Current Score: " + scoreCurrent, 20, 20);
  a.display();
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
