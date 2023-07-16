class SafeNumber extends GameObject
{
  int number;
  Safe safe;
  SafeNumber(String identifier, int x, int y, int owidth, int oheight, int pNumber, boolean showBoundingBox, Safe pSafe)
  {
    super(identifier, x, y, owidth, oheight, showBoundingBox, false, true);
    number = pNumber;
    safe = pSafe;
  }
  
  @Override
  void mouseClicked()
  {
    if(mouseIsHovering)
    {
      fill(128);
      rect(x,y,owidth,oheight);
      safe.addNumber(number);
    }
  }
  
}
