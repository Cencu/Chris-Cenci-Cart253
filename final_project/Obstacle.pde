class Obstacle {
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
  }
  
  //Obstacle moves downwards
  void update() {
    if (moment < millis()) {
      y += speed;
    }
  }

  void timer() {
    //Converts milliseconds to actual seconds int converts millis to integers a
    t = interval+int(millis()/1000)-tempTime;
    time = nf(t, 2);
    
    if (t == 6 + carAdd) {
     // time = "00";
     // tempTime = int(millis()/1000);
      Obstacle j = new Obstacle(50 + b*floor(random(0, 5)), -80, 5, 40, 80, color(255, 0, 0));
      obstacle = (Obstacle[]) append(obstacle, j);
      carAdd +=6;
    }
    text(time, 600, 125);
    textFont(clock);

  }
  
  void timerTruck() {
    tTruck = intervalTruck+int(millis()/1000)-tempTimeTruck;
    timeTruck = nf(tTruck, 2);

    if (tTruck == 11 + truckAdd) {
      //timeTruck = "00";
     // tempTimeTruck = int(millis()/1000);
      Obstacle d = new Obstacle(50 + b*floor(random(0, 5)), -150, 5, 40, 150, color(0, 0, 255));
      truck = (Obstacle[]) append(truck, d);
      truckAdd += 11;
    }
  }

  void overlap() {
//  //  boolean left = (x + sizeX/2 > obstacle.x - obstacle.sizeX/2);
//   // boolean right = (x - sizeX/2 < obstacle.x + obstacle.sizeX/2);
//    boolean top = (y> y-sizeY/2);
//    boolean bottom = (y< y+sizeY/2);
////When the booleans are true, then the car disappears
//    if (top && bottom) {
//     sizeX = 0;
//     sizeY = 0;
//    }
  }
  
  
  void display() {
    //x= constrain(x, 50, 450);
    //if (x > 100 && x < 200) {
    //  x = constrain(x, 157, 157);
    //}

    if (moment < millis()) {
      fill(carColor);
      rectMode(CENTER);
      rect(x, y, sizeX, sizeY);
    }

    if (y >= height+150) {
      moment = millis() + floor(random(0, 10000));
      y -= height+200;
      x = 50 + b*floor(random(0, 5));
    }
  }
}