class MoveToSceneObject extends GameObject {
  
  private String nextSceneIdentifier;
  private boolean moveBack;
  boolean moveImmediately;
  
  public MoveToSceneObject(String identifier, int x, int y, int owidth, int oheight, boolean moveBack, boolean showBoundingBox, boolean moveImmediately, boolean giveHighLight) {
    this(identifier, x, y, owidth, oheight, "", moveBack, showBoundingBox, moveImmediately, giveHighLight);
  }
  
  public MoveToSceneObject(String identifier, int x, int y, int owidth, int oheight, String gameObjectImageFile, boolean moveBack, boolean showBoundingBox, boolean moveImmediately, boolean giveHighLight) {
    super(identifier, x, y, owidth, oheight, gameObjectImageFile, showBoundingBox, false, giveHighLight);
    this.moveBack = moveBack;
    this.moveImmediately = moveImmediately;
  }
  
  public MoveToSceneObject(String identifier, int x, int y, int owidth, int oheight, String nextSceneIdentifier, boolean showBoundingBox, boolean moveImmediately, boolean giveHighLight) {
    this(identifier, x, y, owidth, oheight, "", nextSceneIdentifier, showBoundingBox, moveImmediately, giveHighLight);
  }
  
  public MoveToSceneObject(String identifier, int x, int y, int owidth, int oheight, String gameObjectImageFile, String nextSceneIdentifier, boolean showBoundingBox, boolean moveImmediately, boolean giveHighLight) {
    super(identifier, x, y, owidth, oheight, gameObjectImageFile, showBoundingBox, false, giveHighLight);
    this.nextSceneIdentifier = nextSceneIdentifier;
    this.moveBack = false;
    this.moveImmediately = moveImmediately;
  }
  
  @Override
  public void init()
  {
    if(moveImmediately)
    {
      moveToScene();
    }
  }
  
  @Override
  public void mouseClicked() {
    if(mouseIsHovering) {
      moveToScene();
    }
  }
  
void moveToScene()
{
  if(moveBack) {
    sceneManager.goToPreviousScene();
  } else {
    try {
      sceneManager.goToScene(nextSceneIdentifier);
    } catch(Exception e) { 
      println(e.getMessage());
    }
  }
  hasBeenClicked = true;
}
}
