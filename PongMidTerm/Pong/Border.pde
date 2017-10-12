
class Border {
  //determine the size of the borders
  int bLength=640;
  int bWidth=20; 
  //Position of the borders
  int bX;
  int bY; 
  int bVX;
  int bVY;
  //Color of the borders
  color bColor = color (255,0,0);
  
  //paddle() sets the arguments and positions of the borders
  Border(int borderX,int borderY) {
   bX=borderX;
   bY=borderY;
   bVX=0;
   bVY=0;
  
 
  }
  
  void update() {
   bX =bVX; 
   bY =bVY;
  }
  
  //void display: displays the borders onto the screen at its location
  void display() {
    noStroke();
    fill(bColor);
    rect(bX,bY,bLength,bWidth); 
  }
  
}