
class Paddle {


  
  int SPEED = 5;
  int HEIGHT = 70;
  int WIDTH = 16;

  int x;
  int y;
  int vx;
  int vy;
  
  color paddleColor = color(255);

  char upKey;
  char downKey;


  Paddle(int _x, int _y, char _upKey, char _downKey) {
    x = _x;
    y = _y;
    vx = 0;
    vy = 0;

    upKey = _upKey;
    downKey = _downKey;
  }

  void update() {
    x += vx;
    y += vy;

    y = constrain(y,0 + HEIGHT/2,height - HEIGHT/2);
  }

  void display() {
    noStroke();
    fill(paddleColor);
    rectMode(CENTER);
    
    rect(x, y, WIDTH, HEIGHT);
  }




  void keyPressed() {
    // Check if the key is our up key
    if (key == upKey) {
      // If so we want a negative y velocity
      vy = -SPEED;
    } // Otherwise check if the key is our down key 
    else if (key == downKey) {
      // If so we want a positive y velocity
      vy = SPEED;
    }
  }

  // keyReleased()
  //
  // Called when keyReleased is called in the main program

  void keyReleased() {
    // Check if the key is our up key and the paddle is moving up
    if (key == upKey && vy < 0) {
      // If so it should stop
      vy = 0;
    } // Otherwise check if the key is our down key and paddle is moving down 
    else if (key == downKey && vy > 0) {
      // If so it should stop
      vy = 0;
    }
  }
}