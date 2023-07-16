class FireAlarmLight extends GameObject
{
  String lightOnImage, lightOffImage;
  PImage lightOn, lightOff;
  FireAlarmLight(String identifier, int x, int y, int owidth, int oheight, String lightOnImage, String lightOffImage)
  {
    super(identifier, x, y, owidth, oheight, lightOnImage, false, false, true);
    this.lightOnImage = lightOnImage;
    this.lightOffImage = lightOffImage;
    lightOn = loadImage(lightOnImage);
    lightOff = loadImage(lightOffImage);
  }
  
  @Override
  public void draw()
  {
    if(fireAlarmIsActive)
    {
      image(lightOn, x, y, owidth, oheight);
    }    
    else
    {
      image(lightOff, x, y, owidth, oheight);
    }
    
  }

  
}
