class Game {
  boolean gameRunning = false; //Game running when it's not in menu
  ArrayList<Human> humanList = new ArrayList<Human>();
  
  float floorLevel = 700;
  Coords location = new Coords(200, floorLevel);
  Game() {
  }

  void startUp() {
    PumpkinGhost.add(new Ghost(location, 40));
    PumpkinGhost.add(new Pumpkin(location, 70));
    //ItemList.add(new Chandelier(500, 500));
    //humanList.add(new Human(400, 650, 89, 180, 700, 900, 200, 0.7, humanImges.get(0)));
  }

  void run() {
    image(BG, width/2, height/2);
    //textAlign(CORNER);

    for (Item i : levelItems) {
      i.display();
    }

    for (Player pg : PumpkinGhost) {
      pg.display();
      if (!gameOver) pg.update();
    }

    for (Human h : humanList) {
      h.display();
      if (!gameOver) h.update();
    }
    makeText();

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
      
      if(completedDelay<frameCount){
        scene = 1;
      }
    }
  }

  void keyPressed() {
    for (Player pg : PumpkinGhost) {
      pg.keyPressed();
    }
    if (key == 'e' || key == 'E') {
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

  void makeText() {
    textSize(24);
    if (PumpkinGhost.get(0).isGhost) {
      text("Ghost  -  Change with 'E'", 20, 20);
    } else {
      text("Pumpkin  -  Change with 'E'", 20, 20);
    }
  }
}
