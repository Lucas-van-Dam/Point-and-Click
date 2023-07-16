class FireAlarmButton extends GameObject
{
  boolean isActive;
  boolean shouldBeActive;
  PImage  fireAlarmButtonOn = loadImage("fireAlarmButtonOn.png");
  PImage  fireAlarmButtonOff = loadImage("fireAlarmButtonOff.png");
  FireAlarm fireAlarm;
  
  
  FireAlarmButton(String identifier, int x, int y, int owidth, int oheight, boolean showBoundingBox, FireAlarm pFireAlarm, boolean pShouldBeActive, boolean pIsActive, boolean giveHighLight)
  {
    super(identifier, x, y, owidth, oheight, showBoundingBox, false, giveHighLight);
    shouldBeActive = pShouldBeActive;
    isActive = pIsActive;
    fireAlarm = pFireAlarm;
    fireAlarm.buttons.add(this);
    fireAlarm.updateAlarm();
    

  }
  
  @Override
  void mouseClicked()
  {
    if(mouseIsHovering)
    {
      isActive = !isActive;
      if(isActive)
      {
        fireAlarm.buttons.remove(this);
        FireAlarmButton newAlarmButton = new FireAlarmButton(identifier, x, y, owidth, oheight, showBoundingBox, fireAlarm, shouldBeActive, isActive, true);
        sceneManager.getCurrentScene().addGameObject(newAlarmButton);
        sceneManager.getCurrentScene().removeGameObject(this);
      }
      else
      {
        fireAlarm.buttons.remove(this);        
        FireAlarmButton newAlarmButton = new FireAlarmButton(identifier, x, y, owidth, oheight, showBoundingBox, fireAlarm, shouldBeActive, isActive, true);
        sceneManager.getCurrentScene().addGameObject(newAlarmButton);
        sceneManager.getCurrentScene().removeGameObject(this);    
      }
    }
  }
  
  @Override
  public void draw()
  {
    if(isActive)
    {
      image(fireAlarmButtonOn, x, y, owidth, oheight);
    }
    else
    {
      image(fireAlarmButtonOff, x, y, owidth, oheight);
    }
    if(mouseIsHovering)
    {
      noStroke();
      fill(255, 128);
      ellipseMode(CORNER);
      circle(x, y, owidth);
    }
  }
}
