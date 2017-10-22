// Griddies
// by Pippin Barr
// MODIFIED BY: 
//
// A simple artificial life system on a grid. The "griddies" are squares that move
// around randomly, using energy to do so. They gain energy by overlapping with
// other griddies. If a griddie loses all its energy it dies.

// The size of a single grid element
int gridSize = 20;



// An array storing all the griddies
Griddie[] griddies = new Griddie[100];

Diegrid diegrid; 

// setup()
//
// Set up the window and the griddies

void setup() {
  // Set up the window size and framerate (lower so we can watch easier)
  size(640, 480);
  frameRate(4);

  diegrid = new Diegrid(w, h, big, big); 
  
  // QUESTION: What does this for loop do?
  //ANSWER The FOR loop makes the griddies move randomly across the screen by one step every time. The LENGTH variable resets their integer value back to zero. 
  //The program runs, when it registers that I is at zero, it increments it by one, then length resets the griddie back to zero, and the program loops again. 
  for (int i = 0; i < griddies.length; i++) {
    //Sets the griddies location, a random point on the screen, 
    int x = floor(random(0, width/gridSize));
    int y = floor(random(0, height/gridSize));
    //Parameters for the griddies, their location is set by X and Y, which is random. 
    griddies[i] = new Griddie(x * gridSize, y * gridSize, gridSize);
  }
}

// draw()
//
// Update all the griddies, check for collisions between them, display them.

void draw() {
  background(50);
diegrid.movement();
diegrid.ifAte();
diegrid.display();
  // We need to loop through all the griddies one by one
  for (int i = 0; i < griddies.length; i++) {

    // Update the griddies
    griddies[i].update();

    // Now go through all the griddies a second time...
    for (int j = 0; j < griddies.length; j++) {
      // QUESTION: What is this if-statement for?
      if (j != i) {
        // QUESTION: What does this line check?
        //ANSWER If the griddie [j] is an unequal number with griddie [i] (if j equals one and i equals 0) then it activates the collide loop, which checks its energy levels
        //And if the griddie collides with another griddie. If it does then it adds energy. If it doesnt and the energy is zero then it dies. 
        griddies[i].collide(griddies[j]);
      }
    }

    // Display the griddies
    griddies[i].display();
  }
}