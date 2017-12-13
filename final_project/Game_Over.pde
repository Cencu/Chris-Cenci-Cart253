class GameOver {

  // A variable to track whether the title screen is finished
  boolean gameOver = false;
State selection = State.NONE;

  // The constructor does nothing
  GameOver() {
  }

  // update()
  //
  // Just displays the title

  void update() {
    if (gameOver) {
    display();
    }
  }

  // display()
  //
  // Displays the title of the game and the basic instructions
  // to press any key
  void display() {
    background(0);
    textAlign(CENTER, CENTER);
    textSize(80);
    fill(255);
    text("GAME",width/2, height/3);
    text("OVER", width/2, height/2.2);
    text("SCORE"+time, width/2, height/4);

        textSize(30);

    text("Press any key to continue", width/2, 3*height/4);
    textFont(titlefont);
  }
  
  // keyPressed()
  //
  // Called by the main program when the title is active.
  // Sets finished to true immediately (since it's any key)

 

  // keyReleased()
  //
  // Does nothing.
  
  void keyReleased() {
  }
}