class GameOver {

  // A variable to track whether the title screen is finished
  boolean gameDone = false;
State selection = State.GAME_OVER;

  // The constructor does nothing
  GameOver() {
  }

  // update()
  //
  // Just displays the title

  void update() {
    display();
    
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
    text("SCORE "+time, width/2, height/5);
        textSize(30);
    text("You Lose",width/2,height/1.5);
    textFont(titlefont);
  }

  void keyReleased() {
  }
}