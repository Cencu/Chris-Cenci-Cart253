//Diegrid
//diegrid eats the griddies and absorbs their energy, making him bigger and bluer in the process.

class Diegrid {
  
  
  int w; //x
  int h; //y
  int big; //size
  int hunger; //type of energy
  int colors = color(0,0,30);
  
  Diegrid(int tempW, int tempH, int tempBig) {
    w = tempW;
    h = tempH;
    big = tempBig;
    hunger = big; 
  }
  void movement() {
    int movementW = floor(random(-2,4));
    int movementH = floor(random(-2,4)); 
    w += big * movementW;
    h += big * movementH;
    
    
    if (w < 0) {
      w += width;
    }
    else if (w >= width) {
      w -= width;
    }
    if (h < 0) {
      h += height;
    }
    else if (h >= height) {
      h -= height;
    }
  }
  
  void ifAte(Griddie) {
    if (w == griddie.x && h == griddie.y) {
      energy.griddie = 0;
      colors = colors+5;
    }
  }
  void display() {
    fill(colors);
    noStroke();
    rect(w,h,big,big);
  }
}