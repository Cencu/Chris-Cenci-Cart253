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
    
    textAlign(CENTER,CENTER);
    text("(R)egular Mode", width/2,height/2);
    text("(W)ebcam Mode", width/2,height/3);
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