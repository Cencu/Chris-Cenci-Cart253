class Bouncer {

  //Position variables
  float x;
  float y;
  float s=5;
  float h=5;
  float r=random(50,255);
  float g=random(50,255);
  float b=random(50,255);
  //Velocities
  float vx;
  float vy;
  //Size of the bouncers
  float size;
  //SoundFile to add to the bouncer class
  SoundFile tone;

  //Bouncer Constructor
  Bouncer(float tempX, float tempY, float tempVX, float tempVY, float tempSize, SoundFile tempTone) {
    x = tempX;
    y = tempY;
    vx = tempVX;
    vy = tempVY;
    size = tempSize;
    tone = tempTone;
  }

  //Adds the current location of the bouncer to its velocity, making it move
  //Checks if the bouncers are bouncing off the walls and acts accordingly
  void update() {
    x += vx;
    y += vy;
    bounce();
  }

  //Checks if the bouncers are bouncing off the walls
  //If the bouncers touch the edges, then it reverses its velocity
  //When the bouncer touches the edges it plays a tone
  void bounce() {
    if (x-size/2 < 0 || x+size/2 >width) {
      vx = -vx;
      tone.play();
      
    }
    //Checks if the bouncers are bouncing off the top and bottom borders  
    //When it does it changes tone
    if (y - size/2 < 0 || y + size/2 > height) {
      vy = -vy;
      tone.play();
    }
  }

  //Displays the bouncers
  void display() {
    noStroke();
    
    fill(r,g,b);
    s+=.04;
    ellipse(x, y, size*sin(s), size*sin(s));
  }
}