class Scene {
  boolean isCutScene = false;
  private String sceneName;
  private PImage backgroundImage;
  private ArrayList<GameObject> gameObjects;
  boolean isUpdating = false;
  
  private ArrayList<GameObject> recentlyAddedGameObjects;
  private ArrayList<GameObject> markedForDeathGameObjects;
  
  public Scene(String sceneName, String backgroundImageFile) {
    this.sceneName = sceneName;
    this.backgroundImage = loadImage(backgroundImageFile);
    gameObjects = new ArrayList<GameObject>();
    markedForDeathGameObjects = new ArrayList<GameObject>();
    recentlyAddedGameObjects = new ArrayList<GameObject>();
  }
  
  public void addGameObject(GameObject object) {
    recentlyAddedGameObjects.add(object);
  }
  
  public void removeGameObject(GameObject object) {
    markedForDeathGameObjects.add(object);
  }
  
  public void updateScene() {
    isUpdating = true;
    if(markedForDeathGameObjects.size() > 0) {
      for(GameObject object : markedForDeathGameObjects) {
        gameObjects.remove(object);
      }
      markedForDeathGameObjects  = new ArrayList<GameObject>();
    }
    if(recentlyAddedGameObjects.size() > 0) {
      for(GameObject object : recentlyAddedGameObjects) {
        gameObjects.add(object);
        object.init();
      }
      recentlyAddedGameObjects  = new ArrayList<GameObject>();
    }
    isUpdating = false;
  }
  
  public void draw(int wwidth, int wheight) {
    drawObj(wwidth, wheight);
  }
  
  public void drawObj(int wwidth, int wheight)
  {
    image(backgroundImage, 0, 0, wwidth, wheight);
    inventoryScreen.Display();    
    for(GameObject object : gameObjects) {
      object.draw();
    }

  }
  
  public void mouseMoved() {
    for(GameObject object : gameObjects) {
      object.mouseMoved();
    }
  }
  
  public void mouseClicked() {
    for(GameObject object : gameObjects) {
      if(object.displayText == true)
      {
        object.displayText = false;
      }
      if(object.mouseIsHovering)
      {
         object.mouseClicked();
      }

    }
  }
  
  public void mouseDragged()
  {
    for(GameObject object : gameObjects) {
      if(object.mouseIsHovering)
      {
        object.mouseDragged(); 
      }
    }
  }
  
  public String getSceneName() {
    return this.sceneName;
  }
  
  public void reloadObjects()
  {
    inventoryScreen.refreshCollectables();
    drawObj(width, height);
    for(GameObject object : gameObjects)
    {
      if(object.hasBeenClicked == true)
      {
        object.hasBeenClicked = false;
      }
      object.checkIsOver();

    }
  }
}
