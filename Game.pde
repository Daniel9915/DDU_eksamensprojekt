class Game {
  boolean gameRunning = false; //Game running when it's not in menu
  ArrayList<Human> humanList = new ArrayList<Human>();
  float floorLevel = 700;
  boolean tutorial = true;
  PImage tutorialShow;
  Coords location = new Coords(200, floorLevel);
  Game() {
  }

  void startUp() {
    GhostPumpkin.add(new Ghost(location, 40));
    GhostPumpkin.add(new Pumpkin(location, 70));
    //ItemList.add(new Chandelier(500, 500));
    //humanList.add(new Human(400, 650, 89, 180, 700, 900, 200, 0.7, humanImges.get(0)));
    tutorialShow = tutorial1;
  }

  void run() {
    //HITBOXES RENDERED
    image(BG, width/2, height/2);
    image(houseHitbox, width/2, (height/2)-40);
    
    for (Item i : levelItems) {
      i.displayHitbox();
      i.checkHitbox();
    }
    
    
    //HITBOXES CHECKED
    for (Player pg : GhostPumpkin) {
      if (!gameOver) pg.update();
    }
    
    //GRAPHICS RENDERED
    image(house, width/2, (height/2)-40);
    for (Item i : levelItems) {
      i.display();
    }

    for (Player pg : GhostPumpkin) {
      pg.display();
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
      image(tutorialShow,width/2, height/2);
      if(mousePressed){
        tutorialShow = tutorial2;
      }
    }
  }

  void keyPressed() {
    for (Player pg : GhostPumpkin) {
      pg.keyPressed();
    }
    if (key == 'e' || key == 'E') {
      changeStance();
    }
    if(key == 'w' || key == 'W'){
      stairTeleport = true;
      
    }
  }

  void keyReleased() {
    for (Player pg : GhostPumpkin) {
      pg.keyReleased();
    }
    if(key == 'w' || key == 'W'){
      stairTeleport = false;
      stairTeleportReleased = true;
    }
  }

  void changeStance() {
    for (Player pg : GhostPumpkin) {
      pg.isGhost = !pg.isGhost;
    }
  }
}
