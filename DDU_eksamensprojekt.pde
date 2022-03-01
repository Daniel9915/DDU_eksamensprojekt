Game game = new Game();
PImage ghostImg;
PImage pumpkinImg;

void setup(){
  size(1200,800);
  ghostImg = loadImage("data/ghost.png");
  pumpkinImg = loadImage("data/pumpkin.png"); 
  game.startUp();
}

void draw(){
  game.run();
}

void keyPressed(){
  game.keyPressed();
}

void keyReleased(){
  game.keyReleased();
}
