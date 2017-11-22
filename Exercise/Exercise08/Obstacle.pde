class Obstacle {
  float x=126;
  float y;
  float speed = 5; 
  float sizeX = 40;
  float sizeY = 80;
  float moment;
  boolean displaying = true;
  int index;
  color carColor;

  Obstacle(float tempX, float tempY, float tempS, float tempSX, float tempSY, color tempCar) {
    x = tempX;
    y = tempY;
    speed = tempS;
    sizeX = tempSX;
    sizeY = tempSY;
    moment = 0;
    index = globalIndex++;
    carColor = tempCar;
  }
  
  //Obstacle moves downwards
  void update() {
    if (moment < millis()) {
      y += speed;
    }
  }

  void timer() {
    t = interval+int(millis()/1000)-tempTime;
    time = nf(t, 2);
    
    if (t == 6) {
      time = "00";
      tempTime = int(millis()/1000);
      Obstacle j = new Obstacle(b*floor(random(0, 5)), -80, 5, 40, 80, color(255, 0, 0));
      obstacle = (Obstacle[]) append(obstacle, j);
    }
    
    text(time, width/2, 50);
  }
  
  void timerTruck() {
    tTruck = intervalTruck+int(millis()/1000)-tempTimeTruck;
    timeTruck = nf(tTruck, 2);

    if (tTruck == 11) {
      timeTruck = "00";
      tempTimeTruck = int(millis()/1000);
      Obstacle d = new Obstacle(b*floor(random(0, 5)), -150, 5, 40, 150, color(0, 0, 255));
      truck = (Obstacle[]) append(truck, d);
    }
    
   // text(timeTruck, width/3, 50);
  }
  
  void display() {
    x= constrain(x, 50, 450);
    if (x > 100 && x < 200) {
      x = constrain(x, 157, 157);
    }

    if (moment < millis()) {
      fill(carColor);
      rectMode(CENTER);
      rect(x, y, sizeX, sizeY);
    }

    if (y >= height+150) {
      moment = millis() + floor(random(0, 1000));
      y -= height+200;
      x = x*floor(random(0, 5));
    }
  }
}