class Bouncer {
//Position variables
  float x;
  float y;
  
  
//Velocities
  float vx;
  float vy;
//Size of the bouncers
  float size;
  
  Bouncer(float tempX, float tempY, float tempVX, float tempVY, float tempSize) {
  x = tempX;
  y = tempY;
  vx = tempVX;
  vy = tempVY;
  size = tempSize;
  }
  
//Adds the current location of the bouncer to its velocity, making it move
//Checks if the bouncers are bouncing off the walls and acts accordingly
  void update() {
   x += vx;
   y += vy;
   bounce();
  }
//Checks if the bouncers are bouncing off the walls
//If the bouncers touch the edges, then it reverses its velocity
  void bounce() {
//Checks if the bouncers are bouncing off the left and right border
   if (x-size/2 < 0 || x+size/2 >width) {
     vx = -vx;
   }
//Checks if the bouncers are bouncing off the top and bottom borders   
   if (y - size/2 < 0 || y + size/2 > height) {
     vy = -vy;
   }
  }
//Displays the bouncers
  void display() {
    noStroke();
    fill(0,0,255);
    ellipse(x,y,size,size);
  }
}