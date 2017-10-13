// Ball
//
// A class that defines a ball that can move around in the window, bouncing
// of the top and bottom, and can detect collision with a paddle and bounce off that.

class Ball {

  int gameWin=10;

  PImage imgb;
  float  incXY=.1;
  /////////////// Properties ///////////////

  // Default values for speed and size
  int SPEED = 10;
  int SIZE = 16;
  int p1Score=0;
  int p2Score=0;
  // The location of the ball
  int x;
  int y;

  // The velocity of the ball
  int vx;
  int vy;

  // The colour of the ball
  color ballColor = color(255);


  /////////////// Constructor ///////////////

  // Ball(int _x, int _y)
  //
  // The constructor sets the variable to their starting values
  // x and y are set to the arguments passed through (from the main program)
  // and the velocity starts at SPEED for both x and y 
  // (so the ball starts by moving down and to the right)
  // NOTE that I'm using an underscore in front of the arguments to distinguish
  // them from the class's properties

  Ball(int _x, int _y) {
    x = _x;
    y = _y;
    vx = SPEED;
    vy = SPEED;

  }

/*if (keyPressed) {
      if (key=='s') {
    ball.x += ball.vx+ball.incXY;
    ball.y += ball.vy+ball.incXY;
      }

      
    }*/
/*void keyReleased() {
   if (key=='s') {
    x += vx;
    y += vy;
      }
    
}*/
    
  /////////////// Methods ///////////////

  // update()
  //
  // This is called by the main program once per frame. It makes the ball move
  // and also checks whether it should bounce of the top or bottom of the screen
  // and whether the ball has gone off the screen on either side.

  void update() {

    // First update the location based on the velocity (so the ball moves)
    x += vx;
    y += vy;



    // Check if the ball is going off the top of bottom
    if (y - SIZE/2 < 0 || y + SIZE/2 > height) {
      // If it is, then make it "bounce" by reversing its velocity
      vy = -vy;
    }//makes it bounce off the borders 
    if (x - SIZE/2 < 15 || x + SIZE/2 > width-15) {
      // If it is, then make it "bounce" by reversing its velocity
      vx = -vx;
    }
  }

  void collide(Paddle paddle) {
    // Calculate possible overlaps with the paddle side by side
    boolean insideLeft = (x + SIZE/2 > leftPaddle.x - paddle.WIDTH/2);
    boolean insideRight = (x - SIZE/2 < leftPaddle.x + paddle.WIDTH/2);
    boolean insideTop = (y + SIZE/2 > leftPaddle.y - paddle.HEIGHT/2);
    boolean insideBottom = (y - SIZE/2 < leftPaddle.y + paddle.HEIGHT/2);
    boolean insideLeftR = (x + SIZE/2 > rightPaddle.x - paddle.WIDTH/2);
    boolean insideRightR = (x - SIZE/2 < rightPaddle.x + paddle.WIDTH/2);
    boolean insideTopR = (y + SIZE/2 > rightPaddle.y - paddle.HEIGHT/2);
    boolean insideBottomR = (y - SIZE/2 < rightPaddle.y + paddle.HEIGHT/2);

    // Check if the ball overlaps with the paddle
    if (insideLeft && insideRight && insideTop && insideBottom) {

      // If it was moving to the left
      if (vx < 0) {
        // Reset its position to align with the right side of the paddle
        x = paddle.x + paddle.WIDTH/2 + SIZE/2;
      } else if (vx > 0) {
        // Reset its position to align with the left side of the paddle
        x = paddle.x - paddle.WIDTH/2 - SIZE/2;
      }
      // And make it bounce
      x = width/2;
      y = height/2;
    }
    if (insideLeftR && insideRightR && insideTopR && insideBottomR) {
      // If it was moving to the left
      if (vx < 0) {
        // Reset its position to align with the right side of the paddle
        x = paddle.x + paddle.WIDTH/2 + SIZE/2;
      } else if (vx > 0) {
        // Reset its position to align with the left side of the paddle
        x = paddle.x - paddle.WIDTH/2 - SIZE/2;
      }
      // And make it bounce
      x = width/2;
      y = height/2;
    }
    if (insideLeft && insideRight && insideTop && insideBottom) {
      p1Score = p1Score + 1;
    }
    if (insideLeftR && insideRightR && insideTopR && insideBottomR) {
      p2Score = p2Score + 1;
    }
  }

  void reset() {
    
    x = width/2;
    y = height/2;
  }

  // isOffScreen()
  //
  // Returns true if the ball is off the left or right side of the window
  // otherwise false
  // (If we wanted to return WHICH side it had gone off, we'd have to return
  // something like an int (e.g. 0 = not off, 1 = off left, 2 = off right)
  // or a String (e.g. "ON SCREEN", "OFF LEFT", "OFF RIGHT")

  // display()
  //
  // Draw the ball at its position
  void whoWins() {  //display on screen who wins and who loses.
    if (p1Score >= gameWin || p2Score >= gameWin) {
      textSize(30);

      if (p1Score > p2Score) {
        fill(0, 255, 0, 180);
        text("Player 1 Wins", 120, 110); 
        vx=0;
        vy=0;
      }
      if (p2Score > p1Score) {
        fill(0, 255, 0, 180);
        text("Player 2 Wins", 320, 110); 
        vx=0;
        vy=0;
      }
    }
  } 
  void display() {
    // Set up the appearance of the ball (no stroke, a fill, and rectMode as CENTER)
    noStroke();
    fill(0);
    rectMode(CENTER);

    // Draw the ball
    textSize(100);
    fill(255, 0, 0);
    text(p1Score, 180, 80);
    text(p2Score, 400, 80);

    ellipse(x, y, SIZE, SIZE);
  }
}