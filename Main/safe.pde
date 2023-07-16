class Safe
{
  boolean listIsFull = false;
  boolean isSolved = false;
  int[] solvedCombination = {1,2,3};
  IntList currentCombination = new IntList();
  String identifierp;
  SceneManager sceneManager;
  
  Safe(int[] pSolvedCombination, SceneManager sceneManager, String identifier)
  {
    identifierp = identifier;
    solvedCombination = pSolvedCombination;
    this.sceneManager = sceneManager;
  }
  
  public void addNumber(int pNumber)
  {
    if(currentCombination.size() < solvedCombination.length)
      currentCombination.append(pNumber);
    if(currentCombination.size() == solvedCombination.length)
    {
      listIsFull = true;
      int correctNumbers = 0;
      for(int i = 0; i < currentCombination.size(); i++)
      {
        if(currentCombination.get(i) == solvedCombination[i])
        {
          correctNumbers++;
        }
      }
      if(correctNumbers == solvedCombination.length)
      {
        isSolved = true;
        try {
          sceneManager.goToScene(identifierp);
        } catch(Exception e) { 
          println(e.getMessage());
        }
        
      }
      else
      {
        isSolved = false;
      }
      currentCombination.clear();
    }
  }
}
