
class Button {
  int x, y, setScene;
  String text;

  Button(int x_, int y_, int scene_, String text_) {
    x = x_;
    y = y_;
    setScene = scene_;
    text = text_;
  }
  
  void display(){
    fill(245);
    rect(x,y,300,150,10);
    fill(0);
    textSize(40);
    text(text,x,y+15);
    
    if(mousePressed){
      if(abs(x-mouseX)<150 && abs(y-mouseY)<75){
        mousePressed = false;
        scene = setScene;
      }
    }
  }
}
