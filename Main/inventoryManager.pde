class InventoryManager {
  private ArrayList<Collectable> collectables;
  private ArrayList<Collectable> markedForDeathCollectables;
  public Collectable currentActiveCollectable = null;
  boolean isDirty = false;
  
  public InventoryManager() {
     collectables = new ArrayList<Collectable>();
     markedForDeathCollectables = new ArrayList<Collectable>();
     sceneManager.setCurrentInventoryManager(this);
     
  }
  
  public void addCollectable(Collectable collectable) {
    collectables.add(collectable);
    sceneManager.getCurrentScene().reloadObjects();
  }
  
  public void removeCollectable(Collectable collectable) {
    collectables.remove(collectable);  
    sceneManager.getCurrentScene().reloadObjects();
    if(collectable == currentActiveCollectable)
    {
      currentActiveCollectable = null;
    }
  }
  
  public boolean isCurrentActiveCollectable(Collectable collectable) {
    return currentActiveCollectable == collectable;
  }
  
  public void clearMarkedForDeathCollectables() {
    if(markedForDeathCollectables.size() > 0) {
      for(Collectable collectable : markedForDeathCollectables) {
        collectables.remove(collectable);
      }
      markedForDeathCollectables  = new ArrayList<Collectable>();
    }
  }
  
  public void setActiveCollectable(Collectable collectable)
  {
    for(GameObject object : sceneManager.getCurrentScene().gameObjects)
    {
      object.isSelected = false;
    }
    currentActiveCollectable = collectable;
    
  }
  
  public void resetActiveCollectable()
  {
    currentActiveCollectable = null;
  }
}
