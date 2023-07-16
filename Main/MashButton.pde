/*
class MashButton extends GameObject
{
  int amountOfClicks;
  int amountOfClicksNeeded;
  float timeBetweenClicks;
  float timeSinceLastClick;
  float timeOfLastClick;
  String nextSceneIdentifier;
  boolean isDone = false;
  
  MashButton(String identifier, int x, int y, int owidth, int oheight, String gameObjectImageFile, String pNextSceneIdentifier, int amountOfClicks, float pTimeBetweenClicks, boolean pShowBoundingBox, boolean giveHighLight)
  {
    super(identifier, x, y, owidth, oheight, gameObjectImageFile, pShowBoundingBox, false, giveHighLight);
    timeBetweenClicks = pTimeBetweenClicks;
    amountOfClicksNeeded = amountOfClicks;
    nextSceneIdentifier = pNextSceneIdentifier;
  }
    
  MashButton(String identifier, int x, int y, int owidth, int oheight, String pNextSceneIdentifier, int amountOfClicks, float pTimeBetweenClicks, boolean pShowBoundingBox, boolean giveHighLight)
  {
    this(identifier, x, y, owidth, oheight, "", pNextSceneIdentifier, amountOfClicks, pTimeBetweenClicks, pShowBoundingBox, giveHighLight);
  }
  
  @Override
  public void mouseClicked()
  {
    
    if(mouseIsHovering)
    {
      if(isDone)
      {
        try {
          sceneManager.goToScene(nextSceneIdentifier);
        } catch(Exception e) { 
          println(e.getMessage());
        }        
      }
      else
      {
        timeSinceLastClick = millis() - timeOfLastClick;
        if(amountOfClicks <= 0)
        {
          timeOfLastClick = millis();
          amountOfClicks = 1;
        }
        else if(timeSinceLastClick < timeBetweenClicks)
        {
          amountOfClicks++;
          timeOfLastClick = millis();
        }
        else if(timeSinceLastClick > timeBetweenClicks)
        {
          timeOfLastClick = millis();
          amountOfClicks = 1;
        }
        if(amountOfClicks == amountOfClicksNeeded)
        {
          isDone = true;
        }
      }

    }
  }
  
  
}
*/
