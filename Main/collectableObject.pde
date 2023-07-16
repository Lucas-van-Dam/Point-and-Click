class CollectableObject extends GameObject { 
  private Collectable collectable;
  private GameObject replaceWith;
  private boolean willReplaceByAnotherGameObject;
  boolean isCollected = false;
  
  public CollectableObject(String identifier, int x, int y, int owidth, 
                           int oheight, Collectable collectable, boolean giveHighLight) {
    this(identifier, x, y, owidth, oheight, collectable, null, giveHighLight);
  }
  
  public CollectableObject(String identifier, int x, int y, int owidth, 
                           int oheight, Collectable collectable, GameObject replaceWith, boolean showBoundingBox, boolean giveHighLight) {
    super(identifier, x, y, owidth, oheight, collectable.getGameObjectImageFile(), showBoundingBox, false, giveHighLight);
    this.collectable = collectable;
    if(replaceWith != null) {
      this.replaceWith = replaceWith;
      this.willReplaceByAnotherGameObject = true;
    } else {
      this.willReplaceByAnotherGameObject = false;
    }
  }
  
  public CollectableObject(String identifier, int x, int y, int owidth, 
                           int oheight, Collectable collectable, GameObject replaceWith, boolean giveHighLight) {  
     this(identifier, x, y, owidth, oheight, collectable, replaceWith, false, giveHighLight);
    
  }
  
  @Override
  public void draw() {
    super.draw();
  }
  
  @Override
  public void mouseClicked() {
    if(mouseIsHovering && !isCollected) {
      soundManager.playPickup();
      inventoryManager.addCollectable(collectable);
      sceneManager.getCurrentScene().removeGameObject(this);
      if(willReplaceByAnotherGameObject) {
        sceneManager.getCurrentScene().addGameObject(replaceWith);  
      }
      isCollected = true;
    }
  }
}
