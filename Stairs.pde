class Stairs extends Item {

  int arraySpotOne, arraySpotTwo;
  boolean foundFirst = false;
  boolean foundSecond = false;
  
  boolean isBottomStair = false;
  
  float bottomYValue = 0;
  float bottomXValue = 0;
  float topYValue = 0;
  float topXValue = 0;
  
  Stairs(float _x, float _y) {
    super(_x, _y, 100, 200, noImg);
    itemName = "Stairs";
  }

  void display() {
    image(stairs, x, y, w, h);
    movePlayer();
    if(!foundFirst || !foundSecond){
      findPlaceInArray();
      bottomOrTopStair();
      for(Item e: levelItems){
        println(e.itemName);
        
      }
      println(arraySpotOne, arraySpotTwo);
      println();
    }
    teleport();
  }

  void movePlayer() {}
  
  void teleport(){
    //stairTeleport = pressing w 
    //println(topXValue,topYValue,bottomXValue,bottomYValue);
    if(stairTeleport){
      if(isInBox()){
        if(isBottomStair){
          GhostPumpkin.get(1).pLoc.x = topXValue;
          GhostPumpkin.get(1).pLoc.y = topYValue;
        }else{
          GhostPumpkin.get(1).pLoc.x = bottomXValue;
          GhostPumpkin.get(1).pLoc.y = bottomYValue;
        }
      }
    }
  }
  
  void findPlaceInArray(){
    for(int i = 0; i < levelItems.size(); i++){
      if(levelItems.get(i).itemName == "Stairs"){
        println("first");
        if(!foundFirst){
          arraySpotOne = i;
          println("Never in here???");
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
    
    if(tempYOne > tempYTwo){
      bottomYValue = tempYOne;
      bottomXValue = tempXOne;
      topYValue = tempYTwo;
      topXValue = tempXTwo;
    }else{
      bottomYValue = tempYOne;
      bottomXValue = tempXOne;
      topYValue = tempYOne;
      topXValue = tempXOne;
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
