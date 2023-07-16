class CutScene
{
  String identifier;
  Movie movie;
  boolean isEndCutScene;
  String nextSceneIdentifier;
  
  CutScene(String identifier, String nextSceneIdentifier, Movie movie)
  {
    this.identifier = identifier;
    this.nextSceneIdentifier = nextSceneIdentifier;
    this.movie = movie;
    if(nextSceneIdentifier.equals(""))
    {
      isEndCutScene = true;
    }
  }
  
  CutScene(String identifier, Movie movie)
  {
    this(identifier, "", movie);
  }
  
  public void playCutScene()
  {
    isPlayingCutScene = true;
    movie.play();
  }
  
  public void stopCutScene()
  {
    isPlayingCutScene = false;
    movie.stop();
    try {
      sceneManager.goToScene(nextSceneIdentifier);
    } catch(Exception e) { 
      println(e.getMessage());
    }
  }
}
