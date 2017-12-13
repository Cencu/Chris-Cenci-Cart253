class Obstacle {
  //checked if the car are placed, starts as false
  boolean placed = false;
  boolean alive = true;
  //Location of the cars, when they go into the lanes
  float x=100;
  float y;
  //Car speeds
  float speed = 5; 
  float sizeX = 40;
  float sizeY = 80;
  //the moment the car is off the screen
  float moment;
  color carColor;
  PImage cars;

  //After 20 seconds, the difficulty increases
  float difficultAdd = 0;

  //Tracks wether or not we should return to the menu
  boolean returnToMenu = false;


  Obstacle(PImage tempimg, float tempX, float tempY, float tempS, float tempSX, float tempSY) {
    x = tempX;
    y = tempY;
    speed = tempS;
    sizeX = tempSX;
    sizeY = tempSY;
    moment = 0;
    cars =  tempimg;
    placed = false;
    alive = true;
    addToScreen();
  }

  //Obstacle moves downwards
  void update() {
    //If the moment the car is off the screen is less than the milliseconds, and if 
    //The car is not placed, then we add it to the screen
    //If not we update the speed
    if (moment < millis()) {
      if (!placed && alive) {
        addToScreen();
      } else {
        y += speed;
      }
    }
  }
  //By yelling into the mic, the other cars can move out of the way, potentially making it easier
  //Does not work for trucks, as they are too big to move, and frankly, don't care.
  void swerve(Car car) {
    float level = mic.mix.level();
    if (level > .5 && car.y -200 < y && car.x > x - 5 && car.x < x + sizeX + 5 ) {
      x+=100;
      println(level);
    }
  }

  void timer() {
    //Converts milliseconds to actual seconds
    //int converts millis to integers, minus temp time 
    t = interval+int(millis()/1000)-tempTime;
    //nf formats the numbers into strings, so time = 00, it'll show the string time, and adds 2 zeros
    time = nf(t, 2);
    //if the seconds equal 6 + car add, then the array appends and another car appears onscreen
    //carAdd starts at 0, and when the first timer reaches 6, it adds another six, so when the timer reaches 12, it adds a car, and the variable carAdd goes to 18
    if (t == 6 + carAdd) {
      //The new object being added to the array, spawns on a random lane
      Obstacle j = new Obstacle(cars, 50 + x*floor(random(0, 5)), -80, speed, sizeX, sizeY);
      obstacle = (Obstacle[]) append(obstacle, j);
      //Timer that adds the cars every six seconds
      carAdd +=6;
      println("added",x,y);
      println("append");
    }

    //Displays the timer
    text(time, 600, 125);
    //Timer font
    textFont(clock);
  }
  


  void timerTruck() {
    //Timer for the truck spawning, since they are bigger, they spawn every 12 seconds
    tTruck = intervalTruck+int(millis()/1000)-tempTimeTruck;
    //nf formats the numbers into strings, so time = 00, it'll show the string time, and adds 2 zeros
    timeTruck = nf(tTruck, 2);
    //Same as the car timer, when the timer reaches 11, the array appends and adds 11 to the timer, so at 22 seconds another truck will appear, and again at 33 seconds
    if (tTruck == 11 + truckAdd) {
      //Appends the truck, like above
      Obstacle d = new Obstacle(cars, 50 + b*floor(random(0, 5)), -150, speed, 40, 150);
      truck = (Obstacle[]) append(truck, d);
      truckAdd += 11;
    }
  }



  //Displays the car
  void display() {
    imageMode(CENTER);
    image(cars, x, y, sizeX, sizeY);
    //If the car or truck goes completely offscreen, then it resets 
    //placed turns to false
    if (y >= height+150) {
      placed = false;
      alive = true;
      addToScreen();
    } 
  }
  //If the obstacles go off the screen, then they will reappear at the top, the +150 is so it is completely off the screen, and the +200 is so that 
  //It is smooth when coming down from the top
  void addToScreen() {
    if (placed && !alive) {
      return;
    } 

    //moment equals a random time between 0 and 5,
    //Checks when the obstacles will respawn 
    //Respawn before the screen, so it will appear as they are flowing smoothly
    //Spawn between the five lanes
    moment = millis() + floor(random(0, 5000));
    y = -150;
    x = 50 + b*floor(random(0, 5));
    placed = true;
    alive = false;
    //checks if each new appended obstacle spawns into eachother
    //If the obstacles spawn overlapping eachother, then they will despawn
    //
    for (int j = 0; j < truck.length; j++) {
      if (this != truck[j] && collision(truck[j])) {
        placed = false;
      }
    }
    //Checks for each obstacle, if they have collieded with eachother or one another
    for (int j = 0; j < oil.length; j++) {
      if (this != oil[j] && collision(oil[j])) {
        placed = false;
      }
    }
    for (int j = 0; j < obstacle.length; j++) {
      if (this != obstacle[j] && collision(obstacle[j])) {
        placed = false;
      }
    }

  }

  //If the obstacle spawns in the same locaction as another obstacle, then it returns false and deletes
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
  

  

  //Returns to menu
  void keyPressed() {
    if (key == 'm' || key == 'M') {
      returnToMenu = true;
    }
  }
  //Every 20 seconds, the speed increases by two
  void difficulty() {
    //Converts milliseconds to actual seconds
    //int converts millis to integers, minus temp time 
    t = interval+int(millis()/1000)-tempTime;
    //nf formats the numbers into strings, so time = 00, it'll show the string time, and adds 2 zeros
    time = nf(t, 2);
    //if the seconds equal 6 + car add, then the array appends and another car appears onscreen
    //carAdd starts at 0, and when the first timer reaches 6, it adds another six, so when the timer reaches 12, it adds a car, and the variable carAdd goes to 18
    if (t == 20+ difficultAdd) {
      speed +=2;
      difficultAdd += 20;
    }
  }
}