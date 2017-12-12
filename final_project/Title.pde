class Title {

  // A variable to track whether the title screen is finished
  boolean finished = false;

  // The constructor does nothing
  Title() {
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
    text("TRAFFIC",width/2, height/3);
    text("HATER", width/2, height/2.2);
        textSize(30);

    text("Press any key to continue", width/2, 3*height/4);
    textFont(titlefont);
  }
  
  // keyPressed()
  //
  // Called by the main program when the title is active.
  // Sets finished to true immediately (since it's any key)

  void keyPressed() {
    finished = true;
  }

  // keyReleased()
  //
  // Does nothing.
  
  void keyReleased() {
  }
}