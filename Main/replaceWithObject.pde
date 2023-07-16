/*
class ReplaceWithObject extends GameObject
{
  Collectable removeCol;
  Collectable replaceWithCol;
  
  ReplaceWithObject(String identifier, int x, int y, int owidth, int oheight, String gameObjectImageFile, Collectable collectable, Collectable replaceWith, boolean showBoundingBoxes, boolean giveHighLight)
  {
    super(identifier, x, y, owidth, oheight, gameObjectImageFile, showBoundingBoxes, false, giveHighLight);
   removeCol = collectable;
   replaceWithCol = replaceWith;
  }
  
  @Override
  public void mouseClicked()
  {
    if(mouseIsHovering && inventoryManager.collectables.contains(removeCol))
    {
      inventoryManager.removeCollectable(removeCol);
      inventoryManager.addCollectable(replaceWithCol);
      sceneManager.getCurrentScene().reloadObjects(inventoryManager);
      inventoryManager.sceneManager.getCurrentScene().draw(width,height);
      
      sceneManager.getCurrentScene().removeGameObject(this);
    } else
    {
      super.mouseClicked();
    }
  }
}
*/
