class InventoryObject extends GameObject
{

  Collectable collectable;
  InventoryObject(String identifier, int x, int y, int owidth, int oheight, String gameObjectImageFile, Collectable pCollectable)
  {
    super(identifier, x, y, owidth, oheight, gameObjectImageFile, showBoundingBoxes, true, true);
    collectable = pCollectable;
  }
  
  @Override
  void mouseClicked()
  {
    if(mouseIsHovering)
    {
      inventoryManager.setActiveCollectable(collectable);
      isSelected = true;
    }
  }
}
