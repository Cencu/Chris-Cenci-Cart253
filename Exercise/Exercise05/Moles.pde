
class Moles {
//Mole image
  PImage img;
  //Size of the moles
  int moleSize = 25;
  //Number of moles
  int x;
  int y;
  int xMove;


  //Color of regular moles and "golden" moles, which are worth 3 points
  color moleColor = color(200, 0, 0);
  color  specialColor = color(252, 136, 12);

  Moles(int _x, int _y, int _moleSize ) {
    x = _x;
    y = _y;
    moleSize = _moleSize;
    img = loadImage("mole.jpg");
  }

  void update() {
//Mole movement, use noise to make them go from left to right in a "shaking" fashion
    float xMove = noise(random(-100, 5));
    float yMove = noise(random(-1, 5));
    x += moleSize * xMove;
    y += moleSize * yMove;

//Resets the moles if when they go off screen
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
//Checks if the moles are clicked in any location on the ellipse
    boolean moleLeft = (mouseX > x-moleSize);
    boolean moleRight = (mouseX < x +moleSize);
    boolean moleTop = ( mouseY > y - moleSize);
    boolean moleBottom = (mouseY < y + moleSize);
    //If the booleans are true and the mouse is pressed, then the mole "disappears", also adds a point
    if (moleLeft && moleRight && moleTop && moleBottom && mousePressed) {
      moleSize = 0;
      point++;
    }
  }




  void display() {
    //displays the score
    fill(0,0,255);
    textSize(50);
    text(point, width/4, 50);
    //Displays the moles
    fill(moleColor, 0);
    noStroke();
    image(img, x, y, moleSize, moleSize);
    imageMode(CENTER);
    ellipse(x, y, moleSize, moleSize);
  }
}