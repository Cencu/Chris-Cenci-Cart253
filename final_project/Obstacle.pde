class Obstacle {
  boolean placed = false;
  float x=126;
  float y;
  float speed = 5; 
  float sizeX = 40;
  float sizeY = 80;
  float moment;
  color carColor;

  Obstacle(float tempX, float tempY, float tempS, float tempSX, float tempSY, color tempCar) {
    x = tempX;
    y = tempY;
    speed = tempS;
    sizeX = tempSX;
    sizeY = tempSY;
    moment = 0;
    carColor = tempCar;
    placed = false;
    addToScreen();
  }

  //Obstacle moves downwards
  void update() {
    if (moment < millis()) {
      if (!placed) {
        addToScreen();
      } else {
        //println(y);
        y += speed;
        //println(y);
      }
    }
  }

  void timer() {
    //Converts milliseconds to actual seconds int converts millis to integers a
    t = interval+int(millis()/1000)-tempTime;
    //nf formats the numbers into strings, so time = 00, it'll show the string time, and adds 2 zeros
    time = nf(t, 2);
    //if the seconds equal 6 + car add, then the array appends and another car appears onscreen
    //carAdd starts at 0, and when the first timer reaches 6, it adds another six, so when the timer reaches 12, it adds a car, and the variable carAdd goes to 18
    if (t == 6 + carAdd) {
      //The new object being added to the array, spawns on a random lane
      Obstacle j = new Obstacle(50 + b*floor(random(0, 5)), -80, 5, 40, 80, color(255, 0, 0));
      obstacle = (Obstacle[]) append(obstacle, j);
      //Timer that adds the cars every six seconds
      carAdd +=6;
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
      Obstacle d = new Obstacle(50 + b*floor(random(0, 5)), -150, 5, 40, 150, color(0, 0, 255));
      truck = (Obstacle[]) append(truck, d);
      truckAdd += 11;
    }
  }




  void display() {
    // if (moment < millis()) {
    fill(carColor);
    rectMode(CENTER);
    rect(x, y, sizeX, sizeY);

  //println(y);

    if (y >= height+150) {
      placed = false;
      addToScreen();
    }
  }
  //If the obstacles go off the screen, then they will reappear at the top, the +150 is so it is completely off the screen, and the +200 is so that 
  //It is smooth when coming down from the top
  void addToScreen() {
    if (placed) {
      return;
    }
    
    //moment equals a random time between 0 and 10, 
    moment = millis() + floor(random(0, 5000));
    y = -150;
    x = 50 + b*floor(random(0, 5));
    placed = true;
    
    for (int j = 0; j < truck.length; j++) {
      if (this != truck[j] && collision(truck[j])) {
        placed = false;
      }
    }
    for (int j = 0; j < obstacle.length; j++) {
      if (this != obstacle[j] && collision(obstacle[j])) {
        placed = false;
      }
    }
  }


boolean collision(Obstacle obstacle) {
  if (obstacle == null) {
    return false;
  }
  
  boolean left = (x + sizeX/2 > obstacle.x - obstacle.sizeX/2);
  boolean right = (x - sizeX/2 < obstacle.x + obstacle.sizeX/2);
  boolean top = (y + sizeY/2 > obstacle.y - obstacle.sizeY/2);
  boolean bottom = (y - sizeY/2 < obstacle.y + obstacle.sizeY/2);

  return (left && right && top && bottom);
}

}