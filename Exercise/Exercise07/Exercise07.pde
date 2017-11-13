

//Import sound library
import processing.sound.*;
//Create an array with 8 sound files, each a unique tone
SoundFile[] tones = new SoundFile[8];
//Created an array of bouncers
Bouncer[] bouncers = new Bouncer[10];

void setup() {
  size(800,800);
//Run through each tone file, creating them

  for (int i = 0; i < tones.length; i++) {
//this loop locates the file name tone, i+1 adds one and .wav to the string name, locating tone 1-8.
   tones[i] = new SoundFile(this, "tone" + (i+1) + ".wav"); 
  }
//Run through all the bouncers
   for (int i = 0; i < bouncers.length; i++) {
//translates all the tones to an integer value, choosing random ones between 0 and its length of the array
   int toneIndex = floor(random(0,tones.length));
       // Each Bouncer just starts with random values and an random tone
    bouncers[i] = new Bouncer(random(0,width-5),random(0,height-5),random(-10,10),random(-10,10),random(20,50),tones[toneIndex]);
 }
}
void draw() {
    background(0);
   for (int i = 0; i < bouncers.length; i++) {
   bouncers[i].update();
   bouncers[i].display();
  }
}


  