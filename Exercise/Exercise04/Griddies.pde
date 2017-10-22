// Griddie
//
// A class defining the behaviour of a single Griddie
// which can move randomly in the window (within the grid),
// loses energy per move, and gains energy from overlapping
// with another Griddie.

class Griddie {
  // Limits for energy level and gains/losses
  int maxEnergy = 255;
  int moveEnergy = -1;
  int collideEnergy = 10;
  
  // Position, size, energy, and fill color
  int x;
  int y;
  int size;
  int energy;
  color fill = color(255,0,0);

  // Griddie(tempX, tempY, tempSize)
  //
  // Set up the Griddie with the specified location and size
  // Initialise energy to the maximum
  Griddie(int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
    size = tempSize;
    energy = maxEnergy;
  }

  // update()
  //
  // Move the Griddie and update its energy levels
  void update() {
    
    // QUESTION: What is this if-statement for?
    //ANSWER If all the energy of the griddies equal 0, then the update() loop will not be activated
    if (energy == 0) {
      return;
    }
    
    // QUESTION: How does the Griddie movement updating work?
    //ANSWER the integer xMoveType is set to produce a random variable between -1 and 2
    //size * that integer is then assigned to X and Y, which make it move since they are in the griddies display loop.
    int xMoveType = floor(random(-1,2));
    int yMoveType = floor(random(-1,2));
    x += size * xMoveType;
    y += size * yMoveType;
    
    // QUESTION: What are these if statements doing?
    //ANSWER If the griddie moves off the screen then it relocates it back on the screen.
    if (x < 0) {
      x += width;
    }
    else if (x >= width) {
      x -= width;
    }
    if (y < 0) {
      y += height;
    }
    else if (y >= height) {
      y -= height;
    }

    // Update the Griddie's energy
    // Note that moveEnergy is negative, so this _loses_ energy
    energy += moveEnergy;
    
    // Constrain the Griddies energy level to be within the defined bounds
    energy = constrain(energy,0,maxEnergy);
  }

  // collide(other)
  //
  // Checks for collision with the other Griddie
  // and updates energy level
  
  void collide(Griddie other) {
    // QUESTION: What is this if-statement for?
    //ANSWER If the energy of the griddie is equal to 0, or the energy of the other girdie is equal to zero, then the loop returns and the griddie disappears 
    if (energy == 0 || other.energy == 0) {
      return;
    }
    
    // QUESTION: What does this if-statement check?
    //ANSWER Checks if the griddies collide, meaning if their X and Y locations are equal then they collided, adding their energy. 
    if (x == other.x && y == other.y) {
      // Increase this Griddie's energy
      energy += collideEnergy;
      // Constrain the energy level to be within bounds
      energy = constrain(energy,0,maxEnergy);
    }
  }

  // display()
  //
  // Draw the Griddie on the screen as a rectangle
  void display() {
    // QUESTION: What does this fill line do?
    // ANSWER Fill is the color, energy is the opacity. fill is registered as (255,0,0), adding another number equals the opacity. 
    //Since the energy can increase or decrease, the opacity will also increase or decrease. 
    fill(fill, energy); 
    noStroke();
    rect(x, y, size, size);
  }
}