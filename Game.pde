class Game {
  boolean running; //Game running when it's not in menu
  Coords location = new Coords(400, 300);

  Game() {
  }

  void startUp() {
    PumpkinGhost.add(new Ghost(location, 40));
    PumpkinGhost.add(new Pumpkin(location, 70));
  }

  void run() {
    textSize(24);
    if (PumpkinGhost.get(0).isGhost) {
      text("Ghost  -  Change with 'E'", 20, 20);
    } else {
      text("Pumpkin  -  Change with 'E'", 20, 20);
    }

    for (Player pg : PumpkinGhost) {
      pg.display();
      pg.update();
    }
    for (Item i : ItemList) {
      i.display();
    }
  }

  void keyPressed() {
    for (Player pg : PumpkinGhost) {
      pg.keyPressed();
    }
    if (key == 'e') {
      changeStance();
    }
  }

  void keyReleased() {
    for (Player pg : PumpkinGhost) {
      pg.keyReleased();
    }
  }

  void changeStance() {
    for (Player pg : PumpkinGhost) {
      pg.isGhost = !pg.isGhost;
    }
  }
}
