Game game = new Game();
ArrayList<Player> PumpkinGhost = new ArrayList<Player>();
ArrayList<Item> ItemList = new ArrayList<Item>();
PImage ghostImg;
PImage pumpkinImg;
PImage chandelier;

int scene = 1;


Chandelier chan;

void setup(){
  imageMode(CENTER);
  size(1200,800);
  ghostImg = loadImage("data/ghost.png");
  pumpkinImg = loadImage("data/pumpkin.png"); 
  chandelier = loadImage("chandelier.png");
  game.startUp();
  loadData();
  game.startUp();
  
  ItemList.add(new Chandelier(500,100,50,60,chandelier));

}

void draw(){
  clear();
  switch(scene){
    case 1:
      game.run();
      break;
  } 
}

void loadData(){
  ghostImg = loadImage("data/ghost.png");
  pumpkinImg = loadImage("data/pumpkin.png"); 
  chandelier = loadImage("chandelier.png");
}

void keyPressed(){
  game.keyPressed();
}

void keyReleased(){
  game.keyReleased();
}
