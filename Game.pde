class Game {
  boolean running; //Game running when it's not in menu
  Coords location = new Coords(200, 700);
  ArrayList<Human> humanList = new ArrayList<Human>();
  
  Game() {
  }

  void startUp() {
    PumpkinGhost.add(new Ghost(location, 40));
    PumpkinGhost.add(new Pumpkin(location, 70));
    ItemList.add(new Chandelier(500,500));
    humanList.add(new Human(800,650,60,180, 700, 900, 200, 0.7,humanImg));
  }

  void run() {
    image(BG,width/2,height/2);
    
    makeText();

    for (Player pg : PumpkinGhost) {
      pg.display();
      pg.update();
    }
    for (Item i : ItemList) {
      i.display();
    }
    for(Human h : humanList){
      h.display();
      h.update();
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
  
  void makeText(){
    textSize(24);
    if (PumpkinGhost.get(0).isGhost) {
      text("Ghost  -  Change with 'E'", 20, 20);
    } else {
      text("Pumpkin  -  Change with 'E'", 20, 20);
    }
  }
}
