class Invisibility {
  
  //Variables, locations, size and speed\\
  float x = 100;
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
    fill(0);
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
      y = car.c;
    } 
  }
  
//S is used to activate the powerup
  void activate() {
    if (key == 's' || key == 'S') {    
      shield = true;
      println(shield);
    }
  }
//The timer used to append the shield
  void invisitimer() {
    //Converts milliseconds to actual seconds
    //int converts millis to integers, minus temp time 
    tC = intervalC+int(millis()/1000)-tempTimeC;
    ////nf formats the numbers into strings, so time = 00, it'll show the string time, and adds 2 zeros
    timeC = nf(tC, 2);
    ////if the seconds equal 6 + invisiadd, then the array appends and another powerup appears onscreen
    //invisi starts at 0, and when the first timer reaches 15, it adds 30, so when the timer reaches 45, it adds a powerup, and the variable invisiadd goes to 60
    if (tC == 15 + invisiadd) {
      //The new object being added to the array, spawns on a random lane
      Invisibility o = new Invisibility(shieldPic, 50 + x*floor(random(0, 5)), -80, speed, sizeX, sizeY);
      invisibility = (Invisibility[]) append(invisibility, o);
      //Timer that adds the cars every 30 seconds
      invisiadd +=10;
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
    if (shield) {
      tI = intervalI+int(millis()/1000)-tempTimeI;
      timeI = nf(tI, 2);
      println(tI);
      tI -= 6;
      car.alive = true;
    }
    if (tI >= 6) {
      tI -=7;
      follow = false;
      shield = false;
      car.alive = true;
      println(follow);
    }
  }
}