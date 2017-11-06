class Tracker {
  //Variables which are used to track movement
  float trackX = 0;
  float trackY = 0;

  float radius = 100;
  //Tracks the color, red
  color trackColor = color (255, 0, 0);


  void track() {
    //radius to detect changes
    float distChange = 1000;
    //The for loop keeps on re-checking the width and height of the screen for any
    //changes
    for (int x = 1; x < video.width; x++) {
      for (int y = 0; y < video.height; y++) {
        int loc = x+y *width;
        //The floats are equal to the location of the pixels. They are tracking red, so the float amount will follow changes in red motion. 
        color pixelColor = video.pixels[loc];
        float r1 = red(pixelColor);
        float g1 = green(pixelColor);
        float b1 = blue(pixelColor);
        float r2 = red(trackColor);
        float g2 = green(trackColor);
        float b2 = blue(trackColor);
        //calculates the distnce between the points
        float amount = dist(r1, g1, b1, r2, g2, b2);
        if (amount < distChange) {
          distChange = amount;
          trackX = x;
          trackY = y;
        }
      }
    }
  }
  void runAway(Bouncer bouncer) {
    if  (dist(trackX, trackY, bouncer.x, bouncer.y) < bouncer.size/2) {
 
      bouncer.x += bouncer.vx;
        bouncer.y += bouncer.vy;

    }
  }

  void display() {
    fill(0, 255, 0);
    ellipse(trackX, trackY, 10, 10);
  }
}