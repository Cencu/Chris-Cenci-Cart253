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
    textAlign(CENTER,CENTER);
    text("(R)egular Mode", width/2,height/2);
    text("(W)ebcam Mode", width/2,height/2.5);
    text("Instructions", width/2,height/1.7);
    
    textSize(15);
    textFont(instructionFont);
    text("Welcome to Traffic Hater!",width/2,height/1.57);
    text("Your goal is to weave through all this annoying traffic",width/2,height/1.5);
    text("As time goes on, you get even more impatient, speeding up your process",width/2,height/1.4);
    text("You are granted one shield as your aid, if ever it gets too hard press S!",width/2,height/1.3);
    text("If you are using the webcam, be ready and use the reddest object you can find" ,width/2,height/1.2);
    text("Good luck!",width/2,height/1.1);
 }
  void keyPressed() {
   if (key == 'r' || key == 'R') {
     selection = State.OBSTACLE; 
     stereoSound.loop();
 

   }
   else if (key == 'w' || key == 'W') {
   selection = State.WEBCAM_MODE;
   video.start();
   vidstart = true;
   stereoSound.loop();
  } 
}

void keyReleased() {
  
}
}