class Mover { 
  
 int rX;
 int rY;
 int rVX;
 int rVY;
 int rSize;
 Mover(int moverX, int moverY, int moverVX, int moverVY, int moverSize) {
   rX = moverX;
   rY = moverY;
   rVX = moverVX;
   rVY=moverVY;
   rSize=moverSize;
   
 }
 void rupdate() {
   rX += rVX+1;
   rY += rVY;

   handleMover();
 }
 void handleMover() {
   if (rX - rSize/2 < 0 || rX + rSize/2 > width) {
    rVX = rVX*2; 
   }
   
   if (rY - rSize/2 < 0 || rY + rSize/2 > height) {
     rVY = rVY*2;
   }
//Constrains the cirlces to the screen so they dont go off.
   rX = constrain(rX,rSize/2,width-rSize/2);
   rY = constrain(rY,rSize/2,height-rSize/2);
 }
  void draw() {
   noStroke();
   fill(100,100,100);
   ellipse(rX,rY,rSize,rSize);
 }
 }