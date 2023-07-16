class SoundManager
{
  
  SoundFile pickupSound;
  SoundFile openingLock;
  SoundFile openDrawer;
  SoundFile cutVines;
  SoundFile paperPickup;
  SoundFile backgroundMusic;
  
  SoundManager(SoundFile pickup, SoundFile lock, SoundFile drawer, SoundFile vines, SoundFile paper, SoundFile background)
  {
    pickupSound = pickup;
    openingLock = lock;
    openDrawer = drawer;
    cutVines = vines;
    paperPickup = paper;
    backgroundMusic = background;
  }
  
  public void playBackgroundMusic()
  {
    backgroundMusic.amp(volume * 0.4);
    
    backgroundMusic.loop();  
    
  }
  
  public void stopBackGroundMusic()
  {
    backgroundMusic.stop();
  }
  
  public void playPickup()
  {
    pickupSound.amp(volume * 0.2);
    if(pickupSound.isPlaying())
    {
      pickupSound.stop();
      pickupSound.play();
    }
    else
    {
      pickupSound.play();
    }
  }
  
  public void playOpenLock()
  {
    openingLock.amp(volume);    
    if(openingLock.isPlaying())
    {
      openingLock.stop();
      openingLock.play();
    }
    else
    {
      openingLock.play();
    }
  }
  
  public void playCuttingVine()
  {
    cutVines.amp(volume);    
    if(cutVines.isPlaying())
    {
      cutVines.stop();
      cutVines.play();
    }
    else
    {
      cutVines.play();
    }
  }
  
  public void playOpenDrawer()
  {
    openDrawer.amp(volume);    
    if(openDrawer.isPlaying())
    {
      openDrawer.stop();
      openDrawer.play();
    }
    else
    {
      openDrawer.play();
    }
  }
}
