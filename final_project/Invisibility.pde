class Invisibility {

  //Variables, locations, size and speed\\
  float x = 100;
  float shrink = -.001;
  float y;
  float sizeX =80;
  float sizeY = 80;
  float speed = 5;
  //Booleans to activate the powerup
  boolean shield = false;
  boolean follow = false;
  //Picture for the powerup
  PImage shieldPic;

  //Timer for when Invisiblity ends
  int tI = 0;
  int intervalI = 00;
  int tempTimeI = 0;
  int invisi = 0;

  Invisibility(PImage tempimg, float tempx, float tempy, float tempspeed, float tempsizex, float tempsizey) {
    x = tempx;
    y = tempy;
    sizeX = tempsizex;
    sizeY = tempsizey;
    speed = tempspeed;
    shieldPic = tempimg;
    shieldPic = loadImage("shield.png");
  }
  //Update the speed of the powerup
  void update() {
    y += speed;
  }
  //Display the powerup
  void display() {
    imageMode(CENTER);
    image(shieldPic, x, y, sizeX, sizeY);
  }
  //Like the collision booleans in the car class, but the end result is different
  //When the car collides with the shield, it "picks it up"
  //Follow turns true
  void collected(Car car) {
    boolean leftP = (x + sizeX/2 > car.x - car.sizeX/2);
    boolean rightP = (x - sizeX/2 < car.x + car.sizeX/2);
    boolean topP = (y + sizeY/2 > car.y - car.sizeY/2);
    boolean bottomP = (y - sizeY/2 < car.y + car.sizeY/2);

    if (leftP && rightP &&topP && bottomP && !shield) {
      follow = true;
    }
  }
  //When follow turns true, the shield starts following the car
  //P and C were the "ghost variables" used for when objects follow the car
  void follow(Car car) {
    if (follow) {
      x = car.p;
      y = car.c+75;
    }
  }

  //S is used to activate the powerup
  void activate() {
    if (key == 's' && follow || key == 'S' && follow) {    
      shield = true;
      println(shield);
      shieldTone.play();
    } if (shield) {
      invisEnd(car);
    }
  }

  //This void checks when the powerup starts and stops
  void invisEnd(Car car) {
    //If shield becomes active, the timer subtracts 6, 
    //Since the millis() timer never stops running, this was the solution I found
    //The timer is continously counting, so when the powerup becomes active, it only has six seconds before it
    //deactivates. When the timer counts six seconds, it restarts at 0, but if you activate the powerup at, lets say 4 seconds
    //Then you'll only have two seconds of usage...
    //However, when the powerup activates, the timer subtracts another six seconds, giving the player the full time usage


      sizeX--;
      sizeY--;

      if (sizeX <= 0 && sizeY <= 0) {
        follow = false;
        shield = false;
        y += speed;
        x += y;
        car.alive = true;
      
    }
  }
}