class Rocket {
  
  float x = 100;
  float y;
  float sizeX =10;
  float sizeY = 20;
  float speed = 10;
  float rocketColor;
  float moment;
  
  int rocketAdd = 0;
  
  boolean powerup = false;
  boolean launched = false;

  
  Rocket(float tempx, float tempy, float tempspeed, float tempsizex, float tempsizey, float tempcolor) {
    x = tempx;
    y = tempy;
    sizeX = tempsizex;
    sizeY = tempsizey;
    speed = tempspeed;
    rocketColor = tempcolor;
    powerup = false;
    launched = false;

  }
  //If launched is false, then the rocket will continue moving down the screen, however if it is true
  //then it will not
  void update() {
    if (!launched) {
    y += speed;
    }
  }

  void display() {
   fill(255);
    rectMode(CENTER);
    rect(x, y, sizeX, sizeY); 
  }
  //If your car comes into contact with the rocket, it will pick it up
  //the boolean powerup becomes true, activating the new location for the rocket, it now follows the car
  void collected(Car car) {
    boolean leftP = (x + sizeX/2 > car.x - car.sizeX/2);
    boolean rightP = (x - sizeX/2 < car.x + car.sizeX/2);
    boolean topP = (y + sizeY/2 > car.y - car.sizeY/2);
    boolean bottomP = (y - sizeY/2 < car.y + car.sizeY/2);
    
    if (leftP && rightP &&topP && bottomP) {
     powerup = true;
    }
  }
  
    //If powerup is false, and launched is true, then the rocket will fire by holding the mouse key
  void launchspeed() {
    if (!powerup) {
      if(launched) {
   y -= speed*2; 
      }
    }
  }

  //Follows the car, however, like mentioned in the Car class, it follows the car but not its true Y location to avoid moving the car when shooting the rocket
  void follow(Car car) {
   if (powerup) {
      x = car.p;
      y = car.c;
   }
  }
  //When the boolean is true and the mouse is held, then powerup becomes false adn launched becomes true.
  //When powerup becomes false, the rocket shoots upwards and hits an obstacle
  //When launched becomes true, the original update loop doesnt run, but the launchspeed loop does, causing the rocket to fly upwards
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
    
    if (leftH && rightH && topH && bottomH && sizeX > 0 && sizeY > 0) {
 
     obstacle.alive = false;
      obstacle.sizeX = 0;
      obstacle.sizeY = 0;
         sizeX = 0;
         sizeY = 0;
         println("hit");
    } 
  }

  void checkcollision(Obstacle obstacle) {
  
      for (int j = 0; j < rocket.length; j++) {
      if (this != rocket[j] && collision(obstacle)) {
        obstacle.alive = false;
      }
    }
  }
    boolean collision(Obstacle obstacle) {
    if (obstacle == null) {
      return false;
    }
    //Checks if the obstacles have collided.
    boolean left = (x + sizeX/2 > obstacle.x - obstacle.sizeX/2);
    boolean right = (x - sizeX/2 < obstacle.x + obstacle.sizeX/2);
    boolean top = (y + sizeY/2 > obstacle.y - obstacle.sizeY/2);
    boolean bottom = (y - sizeY/2 < obstacle.y + obstacle.sizeY/2);

    return (left && right && top && bottom);
  }
  

  void hitTruck(Obstacle truck) {
  
    boolean leftH = (x + sizeX/2 > truck.x - truck.sizeX/2);
    boolean rightH = (x - sizeX/2 < truck.x + truck.sizeX/2);
    boolean topH = (y + sizeY/2 > truck.y - truck.sizeY/2);
    boolean bottomH = (y - sizeY/2 < truck.y + truck.sizeY/2);
    
    if (leftH && rightH && topH && bottomH && sizeX > 0 && sizeY > 0) {
      truck.sizeX = 0;
      truck.sizeY = 0;
         sizeX = 0;
         sizeY = 0;
         println("hit");
    } 
  }
  
    void timerRocket() {
    //Converts milliseconds to actual seconds
    //int converts millis to integers, minus temp time 
    tC = intervalC+int(millis()/1000)-tempTimeC;
    ////nf formats the numbers into strings, so time = 00, it'll show the string time, and adds 2 zeros
    timeC = nf(tC, 2);
    ////if the seconds equal 6 + car add, then the array appends and another car appears onscreen
    //carAdd starts at 0, and when the first timer reaches 6, it adds another six, so when the timer reaches 12, it adds a car, and the variable carAdd goes to 18
    if (tC == 6 + rocketAdd) {
      //The new object being added to the array, spawns on a random lane
      Rocket o = new Rocket(50 + x*floor(random(0, 5)), -80, speed, 10, 20, color(255, 0, 0));
      rocket = (Rocket[]) append(rocket, o);
      //Timer that adds the cars every six seconds
      rocketAdd +=5;
    }
    }


}