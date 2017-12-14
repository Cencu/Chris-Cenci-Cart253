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
  //This was done since when I update the X and Y below, the player/car doesnt update too
  void follow(Car car) {
    if (follow) {
      x = car.p;
      //The Note/shield trails behind you so its not in the way
      y = car.c+75;
    }
  }

  //S is used to activate the powerup
  void activate() {
    if (key == 's' && follow || key == 'S' && follow) {  
      //When the shield/note is follow you, or true, and the S key is used, then 
      //The shield will be used and the void invisEnd will be called
      shield = true;
      shieldTone.play();
    } if (shield) {
      invisEnd(car);
    }
  }

  //This void checks when the powerup starts and stops
  void invisEnd(Car car) {
    //When the void gets called
    //Your doctors note starts shrinking
    //You have enough time to get through one obstacle before it disappears
      sizeX--;
      sizeY--;
    //Once it disappears, the teachers wont fall for it again
    //You no longer have your note/shield
    //Resets your alive state back to true, since you collided with another object while using the note/shield
      if (sizeX <= 0 && sizeY <= 0) {
        follow = false;
        shield = false;
        y += speed;
        x += y;
        car.alive = true;
      
    }
  }
}