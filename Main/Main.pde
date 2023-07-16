import processing.sound.*; //<>//
import processing.video.*;

float secondsGame = 60 * 4;
float secondsPast;
float timeSinceLastTimer = 0;
float timeOfLastTimer;

float volume = 1;

PFont american;
PFont bradley;

int wwidth = 1920;
int wheight = 1080;

boolean gameIsRunning = false;

boolean timeEnded = false;
boolean hasGoneToTimeUpScene = false;

boolean isPlayingMusic = false;

boolean isPlayingCutScene = false;
boolean showBoundingBoxes = false;

boolean fireAlarmIsActive = true;

boolean shouldStopCutScene = false;

boolean gameEnded = false;

PImage textBackGround;
PImage inventory;

PImage journalImg;
PImage journalPage;



final SceneManager sceneManager = new SceneManager();
final InventoryScreen inventoryScreen = new InventoryScreen(113);
final InventoryManager inventoryManager = new InventoryManager();
final CutSceneManager cutSceneManager = new CutSceneManager();
SoundManager soundManager; 

void settings()
{
  size(wwidth, wheight);
  fullScreen();
}

void setup()
{  
  textSize(20);
  journalImg = loadImage("journalIcon.png");
  inventory = loadImage("inventory.png");
  soundManager = new SoundManager(new SoundFile(this, "pickup.wav"), new SoundFile(this, "lock.wav"), new SoundFile(this, "drawer.wav"), new SoundFile(this, "vines.wav"), new SoundFile(this, "notePickup.wav"), new SoundFile(this, "background.wav"));
  bradley = createFont("Bradley Hand ITC", 10);
  american = createFont("ufonts.com_american-typewriter-bold.ttf", 20);
  textBackGround = loadImage("textBox.png");
  frameRate(60);
  sceneSetup();
  CutScene introCutScene = new CutScene("introCutScene", "WallBack", new Movie(this, "introCutScene.mp4"));
  CutScene endingYes = new CutScene("EndingYes", "Ending", new Movie(this, "endingYes.mp4"));
  CutScene endingNo = new CutScene("EndingNo", "Ending", new Movie(this, "endingNo.mp4"));
  cutSceneManager.addCutScene(introCutScene);
  cutSceneManager.addCutScene(endingYes);
  cutSceneManager.addCutScene(endingNo);

}

void draw()
{
  if(inventoryManager.isDirty)
  {
    sceneManager.getCurrentScene().reloadObjects();
    inventoryManager.isDirty = false;
  }
  if(gameIsRunning && !isPlayingMusic)
  {
    soundManager.playBackgroundMusic();
    isPlayingMusic = true;
  }
  if(isPlayingCutScene)
  {
    if(cutSceneManager.currentCutScene.movie.time() >= cutSceneManager.currentCutScene.movie.duration() - 0.02)
    {
      gameIsRunning = true;
      isPlayingCutScene = false;
      try {
        sceneManager.goToScene(cutSceneManager.currentCutScene.nextSceneIdentifier);
        sceneManager.getCurrentScene().reloadObjects();
        sceneManager.getCurrentScene().drawObj(width, height);
      } catch(Exception e) { 
        println(e.getMessage());
      }
      return;
    }
    image(cutSceneManager.currentCutScene.movie, 0, 0);
    
    return;
  }
  if(timeOfLastTimer != 0 && gameIsRunning)
  {
    //secondsPast += millis() - timeOfLastTimer;
  }

  timeOfLastTimer = millis();
  sceneManager.getCurrentScene().draw(wwidth, wheight);
  sceneManager.getCurrentScene().updateScene();
  /*if(secondsPast/1000 >= secondsGame)
  {
    timeEnded = true;
    gameIsRunning = false;
  }*/
}

void mouseMoved() {
  sceneManager.getCurrentScene().mouseMoved();
}

void mouseClicked() {
  if(isPlayingCutScene)
  {
    cutSceneManager.currentCutScene.stopCutScene();
    gameIsRunning = true;
  }
  sceneManager.getCurrentScene().mouseClicked();
}

void mouseDragged()
{
  sceneManager.getCurrentScene().mouseDragged();
}

void keyPressed()
{
  if(isPlayingCutScene && key == TAB)
  {
    cutSceneManager.currentCutScene.stopCutScene();
    gameIsRunning = true;
  }
  if(key == 'f')
    Debug(); //<>//
  
}

void movieEvent(Movie m)
{
  if(m.available())
  {
    m.read();
  }
}

void Debug()
{
  if(true)
  {
    float i = 1;
  }
}
