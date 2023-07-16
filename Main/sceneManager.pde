import java.util.Stack;
import java.util.HashMap;

class SceneManager {
  private InventoryManager inventoryManager;
  private HashMap<String, Scene> scenes;
  private Stack<Scene> scenesStack;
  
  public SceneManager() {
    scenes = new HashMap<String, Scene>();
    scenesStack = new Stack<Scene>();
  }
  
  public void addScene(Scene scene) {
    scenes.put(scene.getSceneName(), scene);
    if(scenesStack.size() == 0)
    {
      scenesStack.push(scene);
    }
  }
  
  public void goToScene(String sceneName) throws Exception {
    if(scenes.containsKey(sceneName)) {
      
      scenesStack.remove(scenes.get(sceneName));
      scenesStack.push(scenes.get(sceneName));
      getCurrentScene().reloadObjects();
      for(GameObject object : getCurrentScene().gameObjects)
      {
        object.init();
      }
    }
    else {
      throw new Exception("Scene not found with name: "+ sceneName + "." + 
                           "Make sure it was added to the sceneManager.");
    }
  }
  
  public void goToPreviousScene() {
    scenesStack.pop();
    getCurrentScene().reloadObjects();
  }
  
  public Scene getCurrentScene() {
    return scenesStack.peek();
  }
  
  public void setCurrentInventoryManager(InventoryManager pInventoryManager)
  {
    inventoryManager = pInventoryManager;
  }
}
