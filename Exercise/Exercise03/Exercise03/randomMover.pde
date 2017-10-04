class Mover { 
  
 int rX;
 int rY;
 int rVX;
 int rVY;
 int rSize;
int moverX; int moverY; int moverVX; int moverVY; int moverSize;
 Mover(int moverX, int moverY, int moverVX, int moverVY, int moverSize) {

 
   rX = moverX;
   rY = moverY;
   rVX = moverVX;
   rVY=moverVY;
   rSize=moverSize;
   
 }
 void rupdate() {
   rX += moverVX+1;
   rY += moverVY;

   handleMover();
 }
 void handleMover() {
   if (rX - moverSize/2 < 0 || rX + moverSize/2 > width) {
    rVX = rVX*2; 
   }
   
   if (rY - moverSize/2 < 0 || rY + moverSize/2 > height) {
     rVY = rVY*2;
   }
//Constrains the cirlces to the screen so they dont go off.
   rX = constrain(rX,moverSize/2,width-moverSize/2);
   rY = constrain(rY,moverSize/2,height-moverSize/2);
 }
  void draw() {
   noStroke();
   fill(100,100,100);
   ellipse(rX,rY,rSize,rSize);
 }
 }