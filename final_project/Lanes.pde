class Lanes {
  
  float x = 100;
  float y; 
  float vy = 5;
  float sizeX = 100;
  float sizeY = 150;
  PImage lockers;
  
  Lanes(PImage tempimg,float tempX, float tempY, float tempVY, float tempSizeX, float tempSizeY) {
    x = tempX;
    y = tempY;
    vy = tempVY;
    sizeX = tempSizeX;
    sizeY = tempSizeY;
    lockers = tempimg;
  }
  
  //The update loop has all the lanes moving downwards on the Y axis
  void update() {
    y += vy;
  }
  
  //The lanesDown loop has all the lanes resetting when they top of the lanes reach the bottom of the screen
  //If the top of the rectangle touches the bottom of the screen, they reappear as coming down from the top of the screen
  //Over and over
  void lanesDown() {
     if (y >= height+400) {
      y= -400;
    }
  }
  //Displays the lanes, all are the same
  void display() {
   noStroke();
   fill(255);
   imageMode(CORNER);
   image(lockers,x,y,sizeX,sizeY);
  }
}