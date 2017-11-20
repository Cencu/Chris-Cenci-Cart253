float x = 100;
float y;
float sizex = 8;
float sizey = 150;
float speed = 5;
//Array of lanes, 16 are appearing on the screen
Lanes[] lanes = new Lanes[16];

void setup() {
 size(500,800); 
 //Each lane are in a different position. So I had to initialze all lanes in different positions
 for (int i = 0; i < lanes.length; i++) {
    lanes[0] = new Lanes(x, 0, speed, sizex, sizey);
    lanes[1] = new Lanes(x*2, 0, speed, sizex, sizey);
    lanes[2] = new Lanes(x*3, 75, speed, sizex, sizey);
    lanes[3] = new Lanes(x*4, 75, speed, sizex, sizey);
    lanes[4] = new Lanes(x, 250, speed, sizex, sizey);
    lanes[5] = new Lanes(x*2, 250, speed, sizex, sizey);
    lanes[6] = new Lanes(x*3, 325, speed, sizex, sizey);
    lanes[7] = new Lanes(x*4, 325, speed, sizex, sizey);
    lanes[8] = new Lanes(x, 500, speed, sizex, sizey);
    lanes[9] = new Lanes(x*2, 500, speed, sizex, sizey);
    lanes[10] = new Lanes(x*3, 575, speed, sizex, sizey);
    lanes[11] = new Lanes(x*4, 575, speed, sizex, sizey);
    lanes[12] = new Lanes(x, 750, speed, sizex, sizey);
    lanes[13] = new Lanes(x*2, 750, speed, sizex, sizey);
    lanes[14] = new Lanes(x*3, 825, speed, sizex, sizey);
    lanes[15] = new Lanes(x*4, 825, speed, sizex, sizey);
  }
  
}

void draw() {
 background(100); 
 for (int i = 0; i < lanes.length; i++) {
    lanes[i].display();
    lanes[i].update();
    lanes[i].lanesDown();
  }
}