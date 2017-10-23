//Diegrid
//diegrid eats the griddies and absorbs their energy, making him bigger and bluer in the process.

class Diegrid {
  

  int x; 
  int y; 
  int size; 
  int colors = color(0,0,30);
//Displays how many griddies The Diegrid ate
  int killCount=0;
  
  Diegrid(int tempX, int tempY, int tempSize, int tempColors) {
    x = tempX;
    y = tempY;
    size = tempSize;
    colors = tempColors;
  }
  
//Its movement
  void movement() {
    int movementX = floor(random(-2,2));
    int movementY = floor(random(-2,2)); 
    x += gridSize * movementX;
    y += gridSize * movementY;
    

    if (x < 0) {
      x += width;
    }
    else if (x >= width) {
      x -= width;
    }
    if (y < 0) {
      y += height;
    }
    else if (y >= height) {
      y -= height;
    }
  }

//Registers if the griddies touch the sides of the Diegrid or overlap/are inside it. 
//If they meet the conditions then they return and disappear
  void ifAte(Griddie griddie ) {
    if (griddie.energy == 0){
     return; 
    }
    if (x <= griddie.x && x + size >= griddie.x + griddie.size && y <= griddie.y && y + size >= griddie.y + griddie.size) {
      griddie.energy = 0;
      colors = colors+5;
      killCount=killCount+1;
      size = size+1;//Increases in size per kill
      println(killCount); //Notes the amount of griddies ate.
    }
  }
  

  void display() {
    fill(colors);
    noStroke();
    rect(x,y,size,size);
  }
}