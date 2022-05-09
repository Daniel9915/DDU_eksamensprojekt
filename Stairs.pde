class Stairs extends Item {

  int arraySpotOne, arraySpotTwo;
  boolean foundFirst = false;
  boolean foundSecond = false;
  
  boolean isBottomStair = false;
  
  float lesserYValue = 0;
  float lesserXValue = 0;
  float higherYValue = 0;
  float higherXValue = 0;
  
  Stairs(float _x, float _y) {
    super(_x, _y, 100, 200, noImg);
    itemName = "Stairs";
  }

  void display() {
    if(isBottomStair){
      image(stairsDown, x, y, w, h);
    }else{
      image(stairsUp, x, y, w, h);
    }
    movePlayer();
    if(!foundFirst || !foundSecond){
      findPlaceInArray();
      bottomOrTopStair();
      println(arraySpotOne, arraySpotTwo);
      println();
    }
    teleport();
  }

  void movePlayer() {}
  
  void teleport(){
    if(stairTeleport && stairTeleportReleased){
      if(isInBox()){
        if(isBottomStair){
          println("Bottom stair");
          GhostPumpkin.get(1).pLoc.x = higherXValue;
          GhostPumpkin.get(1).pLoc.y = higherYValue+(w/2)+10;
          
          GhostPumpkin.get(1).inAir = true;
          stairTeleportReleased = false;
        }
        if(!isBottomStair){
          println("Top stair");
          GhostPumpkin.get(1).pLoc.x = lesserXValue;
          GhostPumpkin.get(1).pLoc.y = lesserYValue+(w/2)+10;
          GhostPumpkin.get(1).inAir = true;
          stairTeleportReleased = false;
        }
      }
    }
  }
  
  void findPlaceInArray(){
    for(int i = 0; i < levelItems.size(); i++){
      if(levelItems.get(i).itemName == "Stairs"){
        if(!foundFirst){
          arraySpotOne = i;
          foundFirst = true;
        }else if(!foundSecond){
          arraySpotTwo = i;
          foundSecond = true;
        }else{
          return;
        }
      }
    }
  }
  
  void bottomOrTopStair(){
    float tempYOne = 0;
    float tempXOne = 0;
    float tempYTwo = 0;
    float tempXTwo = 0;
    
    tempYOne = levelItems.get(arraySpotOne).y;
    tempXOne = levelItems.get(arraySpotOne).x;
    tempYTwo = levelItems.get(arraySpotTwo).y;
    tempXTwo = levelItems.get(arraySpotTwo).x;
    
    //tempYOne = bottom stairs
    if(tempYOne > tempYTwo){
      lesserYValue = tempYOne;
      lesserXValue = tempXOne;
      higherYValue = tempYTwo;
      higherXValue = tempXTwo;
    
    //tempYOne = top stairs
    }else{
      lesserYValue = tempYOne;
      lesserXValue = tempXOne;
      higherYValue = tempYOne;
      higherXValue = tempXOne;
    }
    
    //assign top or bottom boolean
    if(x == lesserXValue && y == lesserYValue){
      isBottomStair = false;
    }else{
      isBottomStair = true;
    }
    
  }
  
  boolean isInBox() {
    if (coordinatesBox(GhostPumpkin.get(1).pLoc, x-(w/2),x+(w/2), y, y+h)) {
      return true;
    }
    return false;
  }
  
  void pickUp(){}
  void interact(){}
}
