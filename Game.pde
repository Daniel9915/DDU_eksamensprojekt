class Game {
  boolean running; //Game running when it's not in menu
  Coords location = new Coords(400,300);
  Game() {
  }

  void startUp() {
    PumpkinGhost.add(new Ghost(location,40));
    PumpkinGhost.add(new Pumpkin(location,40));
  }

  void run() {
    for (Player pg : PumpkinGhost) {
      pg.display();
      pg.update();
    }
  }

  void keyPressed() {
    for (Player pg : PumpkinGhost) {
      pg.keyPressed();
    }
    if(key == 't'){
      changeStance();
    }
  }

  void keyReleased() {
    for (Player pg : PumpkinGhost) {
      pg.keyReleased();
    }
  }
  
  void changeStance(){
    for(Player pg: PumpkinGhost){
      pg.isGhost = !pg.isGhost;
    }
  }
}
