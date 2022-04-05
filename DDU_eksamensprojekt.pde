Game game = new Game();
ArrayList<Player> PumpkinGhost = new ArrayList<Player>();
ArrayList<Item> ItemList = new ArrayList<Item>();
PImage ghostImg;
PImage pumpkinImg;
PImage chandelier;
PImage humanImg;

int scene = 1;

Chandelier chan;

void setup(){
  imageMode(CENTER);
  size(1200,800);
  frameRate(60);
  loadData();
  game.startUp(); 
  
}

void draw(){
  clear();
  switch(scene){
    case 0:
      menuDraw();
      break;
    
    case 1:
      game.run();
      break;
    
    case 2:
      //level designer
    
  } 
}

void loadData(){
  ghostImg = loadImage("data/images/ghost.png");
  pumpkinImg = loadImage("data/images/pumpkin.png"); 
  chandelier = loadImage("data/images/chandelier.png");
  humanImg = loadImage("data/images/human.png");
}

void keyPressed(){
  game.keyPressed();
}

void keyReleased(){
  game.keyReleased();
}
