class Rocket {
  
  float x = 100;
  float y;
  float sizeX =10;
  float sizeY = 20;
  float speed = 10;
  float rocketColor;
  float moment;
  
  boolean powerup = false;
  boolean launched = false;
//1.Update it-speed going down - done
//2.Displaying it - done
//3.Updating it when it is collected-done
//4.Displaying when collected-done 
//5.What it does when used
//Appending it
  
  Rocket(float tempx, float tempy, float tempspeed, float tempsizex, float tempsizey, float tempcolor) {
    x = tempx;
    y = tempy;
    sizeX = tempsizex;
    sizeY = tempsizey;
    speed = tempspeed;
    rocketColor = tempcolor;
  }
  
  void update() {
    if (!launched) {
    y += speed;
    }
  }
  
  void launchspeed() {
    if (!powerup) {
      if(launched) {
   y -= speed*2; 
      }
    }
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
     powerup = true;
    }
  }
  
  void follow(Car car) {
   if (powerup) {
      x = car.x;
      y = car.c;
   }
  }
  
  void shooting() {
   if (mousePressed && powerup) {
     powerup = false;
     launched = true;
   }
  }
  
  void hit(Obstacle obstacle) {
  
    boolean leftH = (x + sizeX/2 > obstacle.x - obstacle.sizeX/2);
    boolean rightH = (x - sizeX/2 < obstacle.x + obstacle.sizeX/2);
    boolean topH = (y + sizeY/2 > obstacle.y - obstacle.sizeY/2);
    boolean bottomH = (y - sizeY/2 < obstacle.y + obstacle.sizeY/2);
    
    if (leftH && rightH &&topH && bottomH) {
      obstacle.sizeX = 0;
      obstacle.sizeY = 0;
    }
  }

}