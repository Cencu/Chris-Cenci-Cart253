
class Moles {
  //Size of the moles
  int moleSize = 25;
  //Number of moles
  //int moles = n; 
  int x;
  int y;
  int xMove;
  //Color of regular moles and "golden" moles, which are worth more points
  color moleColor = color(200, 0, 0);
  color  specialColor = color(252, 136, 12);

  Moles(int _x, int _y, int _moleSize) {
    x = _x;
    y = _y;
    moleSize = _moleSize;
  }

  void update() {

    
    float xMove = noise(-1,2);
    float yMove = noise(-1, 2);
    x += moleSize * xMove;
    y += moleSize * yMove;


    if (x < 0) {
      x += width;
    } else if (x >= width) {
      x -= width;
    }
    if (y < 0) {
      y += height;
    } else if (y >= height) {
      y -= height;
    }
  }
  void whacked() {
    if (mouseX > x-moleSize && mouseX< x +moleSize && mouseY > y - moleSize
    && mouseY < y + moleSize && mousePressed) {
      moleSize = 0;
    }
  }
  

  
  
  void display() {
    fill(moleColor);
    noStroke();
    ellipse(x, y, moleSize, moleSize);
  }
}