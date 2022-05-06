class Game {
  boolean gameRunning = false; //Game running when it's not in menu
  ArrayList<Human> humanList = new ArrayList<Human>();

  float floorLevel = 700;
  boolean tutorial = true;
  Coords location = new Coords(200, floorLevel);
  Game() {
  }

  void startUp() {
    GhostPumpkin.add(new Ghost(location, 40));
    GhostPumpkin.add(new Pumpkin(location, 70));
    //ItemList.add(new Chandelier(500, 500));
    //humanList.add(new Human(400, 650, 89, 180, 700, 900, 200, 0.7, humanImges.get(0)));
  }

  void run() {

    //translate(width/4-GhostPumpkin.get(1).pLoc.x/2, 0);
    //image(BG, width/2, (height/2-height/6)-20, width*1.5, height*1.5);
    image(BG, width/2, height/2);
    image(house, width/2, (height/2)-40);
    //textAlign(CORNER);

    for (Item i : levelItems) {
      i.display();
    }

    for (Player pg : GhostPumpkin) {
      pg.display();
      if (!gameOver) pg.update();
    }

    for (Human h : humanList) {
      h.display();
      if (!gameOver) h.update();
    }

    if (gameOver) {
      push();
      fill(255);
      textSize(32);
      textAlign(CENTER);
      text("Game Over", width/2, height/2);
      pop();
    }
    if (gameWon) {
      push();
      fill(255);
      textSize(32);
      textAlign(CENTER);
      text("Level Completed", width/2, height/2);
      pop();

      if (completedDelay<frameCount) {
        scene = 1;
      }
    }

    if (tutorial) {
      image(button, width/2, height/2, 500, 300);
      image(tutorial1,width/2, height/2);
    }
  }

  void keyPressed() {
    for (Player pg : GhostPumpkin) {
      pg.keyPressed();
    }
    if (key == 'e' || key == 'E') {
      changeStance();
    }
  }

  void keyReleased() {
    for (Player pg : GhostPumpkin) {
      pg.keyReleased();
    }
  }

  void changeStance() {
    for (Player pg : GhostPumpkin) {
      pg.isGhost = !pg.isGhost;
    }
  }
}
