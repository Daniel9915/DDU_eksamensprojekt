//Spilleren, spøgelse/græskar 
class Player{
  boolean isGhost = false;  //skifter mellem spøgelse og græskar
  boolean up, down, left, right;
  float maxMoveDistance = 0; //max distance som spøgelse kan gå fra græskar
  Ghost ghost;
  Pumpkin pumpkin;
  
  void update(){
  }
  
  void display(){
  }
  
  void move(){
  }
  
  void resetCharater(){
  }
  
  //Keyboard registrations
  void keyPressed(){
    if(key == 'a' ||key == 'A'){
      left = true;
    }
    if(key == 'd' ||key == 'D'){
      right = true;
    }
    if(key == 's' ||key == 'S'){
      down = true;
    }
    if(key == 'w' ||key == 'W'){
      up = true;
    }
  }
  void keyReleased(){
    if(key == 'a' ||key == 'A'){
      left = false;
    }
    if(key == 'd' ||key == 'D'){
      right = false;
    }
    if(key == 's' ||key == 'S'){
      down = false;
    }
    if(key == 'w' ||key == 'W'){
      up = false;
    }
  }
}
