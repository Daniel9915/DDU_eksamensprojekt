Game game = new Game();
ArrayList<Player> PumpkinGhost = new ArrayList<Player>();
PImage ghostImg;
PImage pumpkinImg;
PImage chandelie;

Chandelier chan;

void setup(){
  imageMode(CENTER);
  size(1200,800);
  ghostImg = loadImage("data/ghost.png");
  pumpkinImg = loadImage("data/pumpkin.png"); 
  chandelie = loadImage("chandelier.png");
  game.startUp();
  chan = new Chandelier(500,100,50,60,chandelie);

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
  
  chan.display();
  
}

void keyPressed(){
  game.keyPressed();
  chan.throwItem();
}

void keyReleased(){
  game.keyReleased();
}
