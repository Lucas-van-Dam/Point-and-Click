class RequireObject extends TextObject {
  private Collectable collectable;
  private GameObject replaceWith;
  boolean goImmediately;
  boolean requiresFireAlarm;
  boolean isVines;
  String fireAlarmText = "you need to deactivate the fire alarm first";
  TextObject fireAlarm;
  boolean fireAlarmAdded = false;
  
  public RequireObject(String identifier, int x, int y, int owidth, int oheight, 
                       String gameObjectImageFile, String text, 
                       Collectable collectable, GameObject replaceWith, boolean showBoundingBox, boolean requiresFireAlarm, boolean isVines, boolean giveHighLight) {
    super(identifier, x, y, owidth, oheight, gameObjectImageFile, text, showBoundingBox, giveHighLight);
    this.collectable = collectable;
    this.replaceWith = replaceWith;
    this.requiresFireAlarm = requiresFireAlarm;
    this.isVines = isVines;
    
    if(requiresFireAlarm)
    {
      fireAlarm = new TextObject("FireAlarmText", x, y, owidth, oheight, gameObjectImageFile, fireAlarmText, showBoundingBox, false);
    }
  }
  
  public RequireObject(String identifier, int x, int y, int owidth, int oheight, String text, 
                     Collectable collectable, GameObject replaceWith, boolean showBoundingBox, boolean requiresFireAlarm, boolean isVines, boolean giveHighLight) {
    super(identifier, x, y, owidth, oheight, text, showBoundingBox, giveHighLight);
    this.collectable = collectable;
    this.replaceWith = replaceWith;
    this.requiresFireAlarm = requiresFireAlarm;
    this.isVines = isVines;
    
    if(requiresFireAlarm)
    {
      fireAlarm = new TextObject("FireAlarmText", x, y, owidth, oheight, fireAlarmText, showBoundingBox, false);
    }
  }
  
  @Override
  public void mouseClicked() {
    if(mouseIsHovering && inventoryManager.isCurrentActiveCollectable(collectable)) {
      if(isVines)
      {
        soundManager.playCuttingVine();
      }
      if(requiresFireAlarm && fireAlarmIsActive)
      {
        if(!fireAlarmAdded)
        {
           sceneManager.getCurrentScene().addGameObject(fireAlarm);
           fireAlarmAdded = true;
        }
        fireAlarm.displayText = true;
        fireAlarm.mouseClicked();
        return;
      }
      else if(requiresFireAlarm)
      {
        fireAlarm.displayText = false;
        fireAlarm.mouseClicked();
      }
      inventoryManager.removeCollectable(collectable); //<>// //<>// //<>//
      sceneManager.getCurrentScene().draw(width,height);
      sceneManager.getCurrentScene().removeGameObject(this);
      sceneManager.getCurrentScene().addGameObject(replaceWith);
      if(goImmediately)
      {
        replaceWith.mouseClicked();
      }
    } else if(!(requiresFireAlarm && fireAlarmIsActive)){
      super.mouseClicked();
    }
  } 
}
