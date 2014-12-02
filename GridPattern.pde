int countX = 20; //number of Gridpoints in X-Direction
int countY = 20; //number of Gridpoints in Y-Direction
int scaleFactor = 60; //factor for regulating the influence of the attraktor-point (mousePosition) on the size of the rectangles
float stepWX;
float stepWY;

void setup()
{
  size( 1200, 816 );
  background( 255 );
  rectMode( CENTER );
  stroke(0, 100);
  fill(0, 100);
  
  stepWX = width/countX;
  stepWY = height/countY;
}

void draw()
{
  background( 255 );



  //move the origin of the coordinate-system at half the size of the grid-step-width
  translate(stepWX/2, stepWY/2);


  //draw Grid
  for ( int i=0; i < countX; i++ ) //first for-loop for x-direction
  {
    for ( int j=0; j < countY; j++ ) //second for-loop for y-direction
    {
      //draw pattern
      drawPattern(i*stepWX, j*stepWY);
    }
  }


}

void drawPattern(float posX, float posY)
{
  float distance = dist( posX, posY, mouseX, mouseY );
float openness = distance / scaleFactor; //relate the "openness" of the pattern to distance

  //restrict the openness to width/2 of the pattern
  if (openness > stepWX/2)
    openness = stepWX/2;
  
  triangle(posX-stepWX/2, posY-stepWY/2, posX-openness, posY, posX, posY-openness);
  triangle(posX+stepWX/2, posY-stepWY/2, posX+openness, posY, posX, posY-openness);
  triangle(posX-stepWX/2, posY+stepWY/2, posX-openness, posY, posX, posY+openness);
  triangle(posX+stepWX/2, posY+stepWY/2, posX+openness, posY, posX, posY+openness);
}
