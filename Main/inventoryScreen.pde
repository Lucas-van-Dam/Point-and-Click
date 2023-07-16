class InventoryScreen
{
  float spaceBetweenItems;
  int inventoryHeight;
  public int size;
  ArrayList<InventoryObject> objects = new ArrayList<InventoryObject>();
  
  InventoryScreen(int pHeight)
  {
    inventoryHeight = pHeight;
    size = inventoryHeight - 20;
  }
  
  void Display()
  {
    if(!gameIsRunning)
      return;
    image(inventory, width -113, 0);
  }
  
  void refreshCollectables()
  {
    removeCollectables();
    spaceBetweenItems = height / (inventoryManager.collectables.size() + 1);
    objects = new ArrayList<InventoryObject>();
    for(int i = 0; i < inventoryManager.collectables.size(); i++)
    {
      Collectable collectable = inventoryManager.collectables.get(i);
      objects.add(new InventoryObject(collectable.name, (width - inventoryHeight / 2) - (size / 2) , int(spaceBetweenItems * (i + 1)) - (size/2), inventoryHeight - 20, inventoryHeight - 20, collectable.gameObjectImageFile, collectable));
    }
    for(InventoryObject object : objects)
    {
        if(!gameIsRunning)
          return;
        sceneManager.getCurrentScene().addGameObject(object);
    }
  }
  
  void removeCollectables()
  {
    for(GameObject object : sceneManager.getCurrentScene().gameObjects)
    {
      if(object.isInventory)
      {
        sceneManager.getCurrentScene().removeGameObject(object);
      }
    }
  }
  
  GameObject getGameObjectFromObjectIdentifier(String identifier)
  {
    for(GameObject object : sceneManager.getCurrentScene().gameObjects)
    {
      if(object.identifier == identifier)
      {
        return object;
      }
    }
    return null;
  }
}
