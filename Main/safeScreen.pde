class SafeScreen extends GameObject
{
  Safe safe;
  int spaceBetween;
  PImage dotImage;
  SafeScreen(String identifier, int x, int y, int owidth, int oheight, String dotImageFile, Safe safe, int spaceBetween)
  {
    super(identifier, x, y, owidth, oheight, "", showBoundingBoxes, false, false);
    this.safe = safe;
    this.spaceBetween = spaceBetween;
    dotImage = loadImage(dotImageFile);
  }
  
  @Override
  void draw()
  {
    if(safe.currentCombination.size() != 0)
    {
      for(int i = 0; i < safe.currentCombination.size(); i++)
      {
        image(dotImage, x + i * spaceBetween, y, owidth / safe.solvedCombination.length, oheight);
      }
    }
  }
}
