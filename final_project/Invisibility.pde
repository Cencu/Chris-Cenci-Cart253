class Invisibility {
  float x = 100;
  float y;
  float sizeX =80;
  float sizeY = 80;
  float speed = 5;
  boolean shield = false;
  boolean follow = false;
  float moment;
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

  void update() {
    y += speed;
  }

  void display() {
    fill(0);
    imageMode(CENTER);
    image(shieldPic, x, y, sizeX, sizeY);
  }

  void collected(Car car) {
    boolean leftP = (x + sizeX/2 > car.x - car.sizeX/2);
    boolean rightP = (x - sizeX/2 < car.x + car.sizeX/2);
    boolean topP = (y + sizeY/2 > car.y - car.sizeY/2);
    boolean bottomP = (y - sizeY/2 < car.y + car.sizeY/2);

    if (leftP && rightP &&topP && bottomP) {
      follow = true;
    }
  }

  void follow(Car car) {
    if (follow) {
      x = car.p;
      y = car.c;
    } 
  }
  void activate() {
    if (key == 's' || key == 'S') {    
      shield = true;
      println(shield);
    }
  }

  void invisitimer() {
    //Converts milliseconds to actual seconds
    //int converts millis to integers, minus temp time 
    tC = intervalC+int(millis()/1000)-tempTimeC;
    ////nf formats the numbers into strings, so time = 00, it'll show the string time, and adds 2 zeros
    timeC = nf(tC, 2);
    ////if the seconds equal 6 + car add, then the array appends and another car appears onscreen
    //carAdd starts at 0, and when the first timer reaches 6, it adds another six, so when the timer reaches 12, it adds a car, and the variable carAdd goes to 18
    if (tC == 15 + invisiadd) {
      //The new object being added to the array, spawns on a random lane
      Invisibility o = new Invisibility(shieldPic, 50 + x*floor(random(0, 5)), -80, speed, sizeX, sizeY);
      invisibility = (Invisibility[]) append(invisibility, o);
      //Timer that adds the cars every six seconds
      invisiadd +=30;
    }
  }
  void invisEnd(Car car) {
    if (shield) {
      tI = intervalI+int(millis()/1000)-tempTimeI;
      timeI = nf(tI, 2);
      println(tI);
      tI -= 6;
      car.alive = true;
    }
    if (tI > 6) {
      tI -=6;
      follow = false;
      shield = false;
      car.alive = true;
      println("deac");
    }
  }
}