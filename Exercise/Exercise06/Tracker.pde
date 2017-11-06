class Tracker {
  //Variables which are used to track movement
  float trackX = 0;
  float trackY = 0;
  float record = 1000;
  
  //Tracks the color, red
  color trackColor = color (255, 0, 0);
  
  void track() {
    float record = 1000;
    for (int x = 1; x < video.width; x++) {
      for (int y = 0; y < video.height; y++) {
        int loc = x+y *width;
        color pixelColor = video.pixels[loc];
        float r1 = red(pixelColor);
        float g1 = green(pixelColor);
        float b1 = blue(pixelColor);
        float r2 = red(trackColor);
        float g2 = green(trackColor);
        float b2 = blue(trackColor);
        
        float amount = dist(r1, g1, b1, r2, g2, b2);
        if (amount < record) {
          record = amount;
          trackX = x;
          trackY = y;
        }
      }
    }
  }
  void display() {
    fill(0,255, 0);
    ellipse(trackX,trackY,100,100);
  }
}