class CutSceneManager
{
  private HashMap<String, CutScene> cutScenes;
  CutScene currentCutScene;
  
  CutSceneManager()
  {
    cutScenes = new HashMap<String, CutScene>();
  }
  
  public void addCutScene(CutScene cutScene)
  {
    cutScenes.put(cutScene.identifier, cutScene);
  }
  
  public void playCutScene(String identifier)
  {
    if(isPlayingCutScene)
      return;
    if(cutScenes.containsKey(identifier))
    {
      cutScenes.get(identifier).movie.volume(volume);
      cutScenes.get(identifier).playCutScene();
      currentCutScene = cutScenes.get(identifier);
      soundManager.stopBackGroundMusic();
    }
  }
  
  public void stopPlayingCutScene()
  {
    shouldStopCutScene = true;
  }
  
}
