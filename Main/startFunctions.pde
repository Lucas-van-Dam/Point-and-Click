class ExitButton extends GameObject
{
  ExitButton(String identifier, int x, int y, int owidth, int oheight)
  {
    super(identifier, x, y, owidth, oheight, "", showBoundingBoxes, false, false);
  }
  
  @Override
  void mouseClicked()
  {
    if(mouseIsHovering)
    {
      exit();
    }
  }
}

class VolumeSlider extends GameObject
{
  float mouseRelPos;
  float relativeDistanceFromX;
  PImage sliderPImage;
  VolumeSlider(String identifier, int x, int y, int owidth, int oheight, String sliderImage)
  {
    super(identifier, x, y, owidth, oheight, "", showBoundingBoxes, false, false);
    sliderPImage = loadImage(sliderImage);
    mouseRelPos = owidth;
  }
  
  @Override
  void mouseClicked()
  {
    if(mouseIsHovering)
    {
      mouseRelPos = constrain(mouseX, x, x+owidth) - x;
      
      relativeDistanceFromX = (mouseRelPos/ ((x+owidth) - x));
      volume = relativeDistanceFromX;
    }
  }
  
  @Override
  void mouseDragged()
  {
    if(mouseIsHovering)
    {
      mouseRelPos = constrain(mouseX, x, x+owidth) - x;
      
      relativeDistanceFromX = (mouseRelPos/ ((x+owidth) - x));
      volume = relativeDistanceFromX;
    }
  }
  
  @Override
  void draw()
  {
    image(sliderPImage, x, y, mouseRelPos, oheight);
  }
}

class FinalDecision extends GameObject
{
  boolean isYes;
  FinalDecision(String identifier, int x, int y, int owidth, int oheight, boolean isYes)
  {
    super(identifier, x, y, owidth, oheight, "", showBoundingBoxes, false, false);
    this.isYes = isYes;
  }
  
  @Override
  void mouseClicked()
  {
    if(mouseIsHovering)
    {
      gameIsRunning = false;
      if(isYes)
      {
        cutSceneManager.playCutScene("EndingYes");
      }
      else
      {
        cutSceneManager.playCutScene("EndingNo");
      }
    }
  }
}

class StartCutScene extends GameObject
{
  StartCutScene(String identifier, int x, int y, int owidth, int oheight)
  {
    super(identifier, x, y, owidth, oheight, "", showBoundingBoxes, false, false);
  }
  
  @Override
  void mouseClicked()
  {
    if(mouseIsHovering)
    {
      cutSceneManager.playCutScene("introCutScene");
    }
  }
}

class PlaySoundObject extends GameObject
{
  SoundFile sound;
  PlaySoundObject(String identifier, int x, int y, int owidth, int oheight, SoundFile sound)
  {
    super(identifier, x, y, owidth, oheight, "", showBoundingBoxes, false, false);
    this.sound = sound;
  }
  
  @Override
  void draw() { }
  
  @Override
  void init()
  {
    sound.amp(volume);
    if(sound.isPlaying())
    {
      sound.stop();
      sound.play();
    }
    else
    {
      sound.play();
    }
  }
}
