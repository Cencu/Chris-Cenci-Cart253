class Menu {
  //This boolean checks if you started in webcam mode and changes certain things for the game to work
  boolean vidstart = false;
  State selection = State.NONE;
  Menu() {
  }
  void update() {
    display();
  }
  //Simple menu display, giving two options
  void display() {
    background(0);
    textAlign(CENTER, CENTER);
    textSize(32);
    textFont(titlefont);
    textAlign(CENTER, CENTER);
    text("(R)egular Mode", width/2, height/2);
    text("(W)ebcam Mode", width/2, height/2.5);
    text("Instructions", width/2, height/1.7);
    
//Basic text detailing what to do
    textSize(15);
    textFont(instructionFont);
    text("Welcome to Deadline Avoider!", width/2, height/1.57);
    text("Your goal is to Dodge the oncoming projects, finals and pop quizzes", width/2, height/1.5);
    text("As time goes on, the deadlines start coming faster, as more and more appear", width/2, height/1.4);
    text("You are granted one shield as your aid, if ever it gets too hard press S!", width/2, height/1.3);
    text("If you are using the webcam, be ready and use the reddest object you can find", width/2, height/1.2);
    text("Good luck!", width/2, height/1.1);
  }
  //when R is pressed, you go into regular mode
  void keyPressed() {
    if (key == 'r' || key == 'R') {
      selection = State.OBSTACLE;
    } else if (key == 'w' || key == 'W') {
      //If W is pressed, you use your webcam to guide
      selection = State.WEBCAM_MODE;
      video.start();
      vidstart = true;
    }
  }

  void keyReleased() {
  }
}