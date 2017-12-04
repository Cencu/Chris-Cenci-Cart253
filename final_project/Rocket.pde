class Rocket {
  
  float x = 100;
  float y;
  float sizeX;
  float sizeY;
  float speed = 5;
  float rocketColor;
  float moment;
  
  boolean powerup = false;

//1.Update it-speed going down - done
//2.Displaying it - done
//3.Updating it when it is collected-done
//4.Displaying when collected-done 
//5.What it does when used
//Appending it
  
  Rocket(float tempX, float tempY, float tempSpeed, float tempSX, float tempSY, float tempColor) {
   x = tempX;
   y = tempY;
   sizeX = tempSX;
   sizeY = tempSY;
   speed = tempSpeed;
   rocketColor = tempColor;
  }
  
  void update() {
    y += speed;
  }
  
  void display() {
   fill(255);
    rectMode(CENTER);
    rect(x, y, sizeX, sizeY); 
  }
  
  void collected(Car car) {
    boolean left = (x + sizeX/2 > car.x - car.sizeX/2);
    boolean right = (x - sizeX/2 < car.x + car.sizeX/2);
    boolean top = (y + sizeY/2 > car.y - car.sizeY/2);
    boolean bottom = (y - sizeY/2 < car.y + car.sizeY/2);
    
    if (left && right &&top && bottom) {
     sizeX = 0;
     sizeY = 0;
     powerup = true;
    }
  }
  
  void rocketHeld() {
   if (powerup){
   rect(700,600,40,120);
   }
  }
  void rocketUsed(Car car) {
   if (keyCode=='q' && powerup) {
     rect(car.x,car.y,40,120);
   }
  }
  
}