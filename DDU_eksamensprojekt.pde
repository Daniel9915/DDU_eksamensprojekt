Game game = new Game();
ArrayList<Player> PumpkinGhost = new ArrayList<Player>();
ArrayList<Item> ItemList = new ArrayList<Item>();
PImage ghostImg;
PImage pumpkinImg;
PImage chandelier;


Chandelier chan;

void setup(){
  imageMode(CENTER);
  size(1200,800);
  loadData();
  game.startUp();
  
  ItemList.add(new Chandelier(500,100,50,60,chandelier));

}

void draw(){
  clear();
  game.run();
  
  textSize(24);
  if(PumpkinGhost.get(0).isGhost){
    text("Ghost  -  Change with 't'",20,20);
  }else{
    text("Pumpkin  -  Change with 't'",20,20);
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
