class Game {
  float playerX, playerY;
  boolean running; //Game running when it's not in menu
  ArrayList<Player> PumpkinGhost = new ArrayList<Player>();
  Coords location = new Coords(40,40);
  Game() {
  }

  void startUp() {
    PumpkinGhost.add(new Ghost(location,40));
    PumpkinGhost.add(new Pumpkin(location,40));
  }

  void run() {
    for (Player pg : PumpkinGhost) {
      pg.display();
    }
  }

  void keyPressed() {
    for (Player pg : PumpkinGhost) {
      pg.keyPressed();
    }
  }

  void keyReleased() {
    for (Player pg : PumpkinGhost) {
      pg.keyReleased();
    }
  }
}
