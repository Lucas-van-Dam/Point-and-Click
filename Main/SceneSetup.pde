void sceneSetup()
{
  Collectable keyCol = new Collectable("Key", "Key.png"); 
  Collectable knifeCol = new Collectable("Knife", "knife.png");
  Collectable petrolCol = new Collectable("Petrol", "gas.png");
  Collectable lighterLitCol = new Collectable("LighterOil", "lighterLit.png");

  
  Safe suitCase = new Safe(new int[]{1,6,5}, sceneManager, "openSuitcase");
  
  MoveToSceneObject toJournal = new MoveToSceneObject("ToJournal", 1820, 970, 100, 100, "journalIcon.png", "Journal", showBoundingBoxes, false, true);
  
  Safe safe = new Safe(new int[]{7, 5, 1, 3}, sceneManager, "OpenSafe");
  
  FireAlarm fireAlarm = new FireAlarm();
  
  PlaySoundObject drawerSound = new PlaySoundObject("PlayDrawerSound", 0, 0, 0, 0, soundManager.openDrawer);
  
  /**/
  Scene start = new Scene("Start", "start.png");
  
  MoveToSceneObject moveBack = new MoveToSceneObject("MoveBack", (width-113) / 2, height - 100, 50, 50, "ArrowDown.png", true, showBoundingBoxes, false, true);
  
  StartCutScene startGame = new StartCutScene("StartGame", 570, 480, 760, 140);
  start.addGameObject(startGame);
  
  MoveToSceneObject toOptions = new MoveToSceneObject("ToOptions", 570, 640, 760, 140, "", "Options", showBoundingBoxes, false, false);
  start.addGameObject(toOptions);
  
  ExitButton exitButton = new ExitButton("ExitButton", 570, 820, 760, 140);
  start.addGameObject(exitButton);
  
  sceneManager.addScene(start);  
  
  Scene options = new Scene("Options", "options.png");
  
  options.addGameObject(moveBack);
  
  VolumeSlider volumeSlider = new VolumeSlider("VolumeSlider", 410, 560, 1005, 125, "volumeSlider.png");
  options.addGameObject(volumeSlider);
  
  sceneManager.addScene(options);
  
  Scene wallLeft = new Scene("WallLeft", "WallLeft.png");
  
  wallLeft.addGameObject(toJournal);
  
  MoveToSceneObject goIntoCloset = new MoveToSceneObject("GoToCloset", 1310, 120, 350, 900, "", "Closet", showBoundingBoxes, false, true);
  
  RequireObject destroyWithKnife = new RequireObject("destroyWithKnife", 1305, 120, 345, 855, "rootsUnCut.png", "You need a sharp object for this", knifeCol, goIntoCloset, showBoundingBoxes, false, true, true);
  wallLeft.addGameObject(destroyWithKnife);
  
  MoveToSceneObject moveToBack = new MoveToSceneObject("GoToBackWall_Left", width - 200, height / 2, 50, 50, "ArrowRight.png", "WallBack", showBoundingBoxes, false, true);
  wallLeft.addGameObject(moveToBack);
  MoveToSceneObject moveToFront = new MoveToSceneObject("GoToFrontWall_Left", 40, height / 2, 50, 50, "ArrowLeft.png", "WallFront", showBoundingBoxes, false, true);
  wallLeft.addGameObject(moveToFront);
  
  
  MoveToSceneObject moveToDrawer = new MoveToSceneObject("GoToDrawer_Left", 1100, 700, 200, 100, "Drawer", showBoundingBoxes, false, true);
  wallLeft.addGameObject(moveToDrawer);
  
  MoveToSceneObject moveToEmptyDrawer1 = new MoveToSceneObject("MoveToEmptyDrawer1", 1100, 800, 200, 90, "emptyDrawer", showBoundingBoxes, false, true);
  wallLeft.addGameObject(moveToEmptyDrawer1);
  MoveToSceneObject moveToEmptyDrawer2 = new MoveToSceneObject("MoveToEmptyDrawer2", 1100, 890, 200, 75, "emptyDrawer", showBoundingBoxes, false, true);
  wallLeft.addGameObject(moveToEmptyDrawer2);
  
  MoveToSceneObject moveToLock = new MoveToSceneObject("MoveToLock_Left", 625, 975, 200, 50, "Lock", showBoundingBoxes, false, true);
  wallLeft.addGameObject(moveToLock);
  
  sceneManager.addScene(wallLeft);

  Scene wallRight = new Scene("WallRight", "WallRight.png");
  
  wallRight.addGameObject(toJournal);
  
  MoveToSceneObject goToLabCoatNote = new MoveToSceneObject("GoToLabCoatNote", 290, 455, 40, 50, "", "LabCoatNote", showBoundingBoxes, false, true);
  wallRight.addGameObject(goToLabCoatNote);
  
  MoveToSceneObject moveToFrontright = new MoveToSceneObject("GoToFrontWall_Right", width - 200, height / 2, 50, 50, "ArrowRight.png", "WallFront", showBoundingBoxes, false, true);
  wallRight.addGameObject(moveToFrontright);
  MoveToSceneObject moveToBackright = new MoveToSceneObject("GoToBackWall_Right", 40, height / 2, 50, 50, "ArrowLeft.png", "WallBack", showBoundingBoxes, false, true);
  wallRight.addGameObject(moveToBackright);
  
  MoveToSceneObject moveToDrawerRight = new MoveToSceneObject("GoToDrawer_right", 1080, 710, 180, 100, "LockedDrawer", showBoundingBoxes, false, true);
  
  RequireObject needKey = new RequireObject("NeedKey_Right", 1080, 710, 180, 100, "", "You dont have the key", keyCol, moveToDrawerRight, showBoundingBoxes, false, false, true);
  wallRight.addGameObject(needKey);
  
  
  MoveToSceneObject moveToEmptyDrawer3 = new MoveToSceneObject("MoveToEmptyDrawer3", 1080, 810, 180, 90, "emptyDrawer", showBoundingBoxes, false, true);
  wallRight.addGameObject(moveToEmptyDrawer3);
  MoveToSceneObject moveToEmptyDrawer4 = new MoveToSceneObject("MoveToEmptyDrawer4", 1080, 900, 180, 90, "emptyDrawer", showBoundingBoxes, false, true);
  wallRight.addGameObject(moveToEmptyDrawer4);
  
  sceneManager.addScene(wallRight);  
  
  Scene wallFront = new Scene("WallFront", "WallFront.png");
  
  wallFront.addGameObject(toJournal);
  
  MoveToSceneObject moveToFireAlarm = new MoveToSceneObject("MoveToFireAlarm", 1225, 360, 85, 130, "FireAlarm", showBoundingBoxes, false, true);
  wallFront.addGameObject(moveToFireAlarm);
  
  MoveToSceneObject moveToEmptyDrawer5 = new MoveToSceneObject("MoveToEmptyDrawer5", 1340, 880, 200, 90, "topFrontWallRight", showBoundingBoxes, false, true);
  wallFront.addGameObject(moveToEmptyDrawer5);
  MoveToSceneObject moveToEmptyDrawer6 = new MoveToSceneObject("MoveToEmptyDrawer6", 1340, 780, 200, 100, "emptyDrawer", showBoundingBoxes, false, true);
  wallFront.addGameObject(moveToEmptyDrawer6);
  
  MoveToSceneObject moveToLeft = new MoveToSceneObject("GoToLeftWall_Front", width - 200, height / 2, 50, 50, "ArrowRight.png", "WallLeft", showBoundingBoxes, false, true);
  wallFront.addGameObject(moveToLeft);
  MoveToSceneObject moveToRight = new MoveToSceneObject("GoToRightWall_Front", 40, height / 2, 50, 50, "ArrowLeft.png", "WallRight", showBoundingBoxes, false, true);
  wallFront.addGameObject(moveToRight);
  
  
  sceneManager.addScene(wallFront);

  Scene wallBack = new Scene("WallBack", "WallBack.png");
  
  wallBack.addGameObject(toJournal);
  
  MoveToSceneObject goToSuicideNote = new MoveToSceneObject("GoToSuicideNote", 1275, 650, 50, 50, "suicideNoteFull.png", "SuicideNote", showBoundingBoxes, false, true);
  wallBack.addGameObject(goToSuicideNote);
  
  MoveToSceneObject moveToRightback = new MoveToSceneObject("GoToRightWall_Back", width - 200, height / 2, 50, 50, "ArrowRight.png", "WallRight", showBoundingBoxes, false, true);
  wallBack.addGameObject(moveToRightback);
  MoveToSceneObject moveToLeftback = new MoveToSceneObject("GoToLeftWall_Back", 40, height / 2, 50, 50, "ArrowLeft.png", "WallLeft", showBoundingBoxes, false, true);
  wallBack.addGameObject(moveToLeftback);
  
  
  sceneManager.addScene(wallBack);
  
  Scene drawer = new Scene("Drawer", "Drawer.png");
  
  drawer.addGameObject(toJournal);
  
  drawer.addGameObject(drawerSound);
  
  CollectableObject keyObj = new CollectableObject("Wall_Scene01", width/2 - 300, height/2 - 200, 200, 200, keyCol, true);
  drawer.addGameObject(keyObj);
  

  drawer.addGameObject(moveBack);
  
  sceneManager.addScene(drawer);
  
  Scene lockedDrawer = new Scene("LockedDrawer", "Drawer.png");
  
  lockedDrawer.addGameObject(toJournal);
  
  lockedDrawer.addGameObject(drawerSound);
  
  CollectableObject petrolObj = new CollectableObject("PetrolObj", 847, 410, 200, 200, petrolCol, true);
  
  MoveToSceneObject moveBackOutLockedDrawer = new MoveToSceneObject("MoveBackOutDrawer", (width-113) / 2, height - 100, 50, 50, "ArrowDown.png", true, showBoundingBoxes, false, true);
  lockedDrawer.addGameObject(moveBackOutLockedDrawer);
  
  lockedDrawer.addGameObject(petrolObj);
  
  sceneManager.addScene(lockedDrawer);
  
  Scene ContainerLock = new Scene("Lock", "Lock.png");
  
  ContainerLock.addGameObject(toJournal);
  
  MoveToSceneObject moveBackLock = new MoveToSceneObject("MoveBackLock", (width-113) / 2, height - 100, 50, 50, "ArrowDown.png", true, showBoundingBoxes, false, true);
  ContainerLock.addGameObject(moveBackLock);
  
  SafeScreen suitcaseScreen = new SafeScreen("SuitcaseScreen", 800, 550, 150, 50, "safeDot.png", suitCase, 100);
  ContainerLock.addGameObject(suitcaseScreen);
  
  SafeNumber number1 = new SafeNumber("number1", 690, 610, 100, 100, 1, showBoundingBoxes, suitCase);
  SafeNumber number2 = new SafeNumber("number2", 840, 610, 100, 100, 2, showBoundingBoxes, suitCase);
  SafeNumber number3 = new SafeNumber("number3", 990, 610, 100, 100, 3, showBoundingBoxes, suitCase);
  SafeNumber number4 = new SafeNumber("number4", 690, 710, 100, 100, 4, showBoundingBoxes, suitCase);
  SafeNumber number5 = new SafeNumber("number5", 840, 710, 100, 100, 5, showBoundingBoxes, suitCase);
  SafeNumber number6 = new SafeNumber("number6", 990, 710, 100, 100, 6, showBoundingBoxes, suitCase);
  SafeNumber number7 = new SafeNumber("number7", 690, 810, 100, 100, 7, showBoundingBoxes, suitCase);
  SafeNumber number8 = new SafeNumber("number8", 840, 810, 100, 100, 8, showBoundingBoxes, suitCase);
  SafeNumber number9 = new SafeNumber("number9", 990, 810, 100, 100, 9, showBoundingBoxes, suitCase);
  ContainerLock.addGameObject(number1);
  ContainerLock.addGameObject(number2);
  ContainerLock.addGameObject(number3);
  ContainerLock.addGameObject(number4);
  ContainerLock.addGameObject(number5);
  ContainerLock.addGameObject(number6);
  ContainerLock.addGameObject(number7);
  ContainerLock.addGameObject(number8);
  ContainerLock.addGameObject(number9);
  
  
  sceneManager.addScene(ContainerLock);
  
  Scene openSuitcase = new Scene("openSuitcase", "openDrawer.png");
  
  openSuitcase.addGameObject(toJournal);
  
  MoveToSceneObject hintNote = new MoveToSceneObject("hitNote", 600, 400, 100, 100, "hintNote.png", "YellowNote", showBoundingBoxes, false, true);
  openSuitcase.addGameObject(hintNote);
  

  
  MoveToSceneObject moveOutOfSuitcase = new MoveToSceneObject("MoveOutOfDrawer", (width-113) / 2, height - 100, 50, 50, "ArrowDown.png", true, showBoundingBoxes, false, true);
  openSuitcase.addGameObject(moveOutOfSuitcase);
  
  sceneManager.addScene(openSuitcase);
  
  Scene emptyDrawer = new Scene("emptyDrawer", "Drawer.png");
  
  emptyDrawer.addGameObject(toJournal);
  
  emptyDrawer.addGameObject(drawerSound);
  
  MoveToSceneObject moveOutOfDrawer = new MoveToSceneObject("MoveOutOfDrawer", (width-113) / 2, height - 100, 50, 50, "ArrowDown.png", true, showBoundingBoxes, false, true);
  emptyDrawer.addGameObject(moveOutOfDrawer);
  
  sceneManager.addScene(emptyDrawer); /**/
  
  Scene safeLock = new Scene("SafeLock", "safeLock.png");
  
  safeLock.addGameObject(toJournal);
  
  SafeScreen safeScreen = new SafeScreen("SafeScreen", 700, 800, 200, 50, "safeDot.png", safe, 85);
  safeLock.addGameObject(safeScreen);
  
  SafeNumber number11 = new SafeNumber("number1", 690, 250, 100, 100, 1, showBoundingBoxes, safe);
  SafeNumber number21 = new SafeNumber("number2", 800, 250, 100, 100, 2, showBoundingBoxes, safe);
  SafeNumber number31 = new SafeNumber("number3", 935, 250, 100, 100, 3, showBoundingBoxes, safe);
  SafeNumber number41 = new SafeNumber("number4", 690, 380, 100, 100, 4, showBoundingBoxes, safe);
  SafeNumber number51 = new SafeNumber("number5", 800, 380, 100, 100, 5, showBoundingBoxes, safe);
  SafeNumber number61 = new SafeNumber("number6", 935, 380, 100, 100, 6, showBoundingBoxes, safe);
  SafeNumber number71 = new SafeNumber("number7", 690, 545, 100, 100, 7, showBoundingBoxes, safe);
  SafeNumber number81 = new SafeNumber("number8", 800, 545, 100, 100, 8, showBoundingBoxes, safe);
  SafeNumber number91 = new SafeNumber("number9", 935, 545, 100, 100, 9, showBoundingBoxes, safe);
  SafeNumber number01 = new SafeNumber("number0", 800, 670 ,100, 100, 0, showBoundingBoxes, safe);
  safeLock.addGameObject(number11);
  safeLock.addGameObject(number21);
  safeLock.addGameObject(number31);
  safeLock.addGameObject(number41);
  safeLock.addGameObject(number51);
  safeLock.addGameObject(number61);
  safeLock.addGameObject(number71);
  safeLock.addGameObject(number81);
  safeLock.addGameObject(number91);
  safeLock.addGameObject(number01);
  
  safeLock.addGameObject(moveBack);
  
  sceneManager.addScene(safeLock);
  
  Scene closet = new Scene("Closet", "closet.png");
  
  closet.addGameObject(toJournal);
  
  closet.addGameObject(moveBack);
  
  MoveToSceneObject goToSafe = new MoveToSceneObject("GoToSafe", 600, 650, 600, 275, "SafeLock", showBoundingBoxes, false, true);
  closet.addGameObject(goToSafe);
  
  sceneManager.addScene(closet);
  
  Scene openSafe = new Scene("OpenSafe", "openSafe.png");
  
  openSafe.addGameObject(toJournal);
  
  MoveToSceneObject moveToSafeGas = new MoveToSceneObject("MoveToSafeGas", 0, 0, width - 113, height, "OpenSafeGas", showBoundingBoxes, true, false);
  
  RequireObject requireGas = new RequireObject("RequireGas", 0, 0, width - 113, height, "you need something flammable", petrolCol, moveToSafeGas, showBoundingBoxes, false, false, false);
  openSafe.addGameObject(requireGas);
  
  openSafe.addGameObject(moveBack);
  
  sceneManager.addScene(openSafe);
  
  Scene suicideNote = new Scene("SuicideNote","suicideNoteFull.png");
  
  suicideNote.addGameObject(toJournal);
  
  MoveToSceneObject moveOutOfSuicideNote = new MoveToSceneObject("MoveOutOfSuicideNote", (width-113) / 2, height - 100, 50, 50, "ArrowDown.png", true, showBoundingBoxes, false, true);
  suicideNote.addGameObject(moveOutOfSuicideNote);
  
  sceneManager.addScene(suicideNote);
  
  Scene lighterOilDrawer = new Scene("topFrontWallRight", "Drawer.png");
  
  lighterOilDrawer.addGameObject(toJournal);
  
  CollectableObject knife = new CollectableObject("KnifeObj", 800, 190, 300, 300, knifeCol, true);
  lighterOilDrawer.addGameObject(knife);
  
  MoveToSceneObject moveOutOfLighterOilDrawer = new MoveToSceneObject("MoveOutOfLighterOilDrawer", (width-113) / 2, height - 100, 50, 50, "ArrowDown.png", true, showBoundingBoxes, false, true);
  lighterOilDrawer.addGameObject(moveOutOfLighterOilDrawer);
  
  sceneManager.addScene(lighterOilDrawer);
  
  Scene LabCoatNote = new Scene("LabCoatNote", "note.png");
  
  LabCoatNote.addGameObject(toJournal);
  
  MoveToSceneObject moveOutOfLabCoatNote = new MoveToSceneObject("MoveOutOfLabCoatNote", (width-113) / 2, height - 100, 50, 50, "ArrowDown.png", true, showBoundingBoxes, false, true);
  LabCoatNote.addGameObject(moveOutOfLabCoatNote);
  
  sceneManager.addScene(LabCoatNote);
  
  Scene openSafeGas = new Scene("OpenSafeGas", "openSafeGas.png");
  
  openSafeGas.addGameObject(toJournal);
  
  MoveToSceneObject toEnding = new MoveToSceneObject("ToDecision", 0, 0, width - 113, height, "", "Decision", showBoundingBoxes, true, false);
  
  RequireObject requireLitLighter = new RequireObject("RequireLitLightere", 0, 0, width - 113, height, "you need a lit lighter", lighterLitCol, toEnding, showBoundingBoxes, true, false, false);
  openSafeGas.addGameObject(requireLitLighter);
  
  MoveToSceneObject moveOutOfGas = new MoveToSceneObject("MoveOutOfGas", (width-113) / 2, height - 100, 50, 50, "ArrowDown.png", true, showBoundingBoxes, false, true);
  openSafeGas.addGameObject(moveOutOfGas);
  
  sceneManager.addScene(openSafeGas);
  

  
  Scene fireAlarmScene = new Scene("FireAlarm", "fireAlarm.png");
  
  fireAlarmScene.addGameObject(toJournal);
  
  fireAlarmScene.addGameObject(moveBack);
  
  FireAlarmLight fireAlarmLightFront = new FireAlarmLight("FireAlarmLightFront", 0, 0, width, height, "fireAlarmOn.png", "fireAlarmOff.png");
  fireAlarmScene.addGameObject(fireAlarmLightFront);
  
  FireAlarmButton fireAlarmButton1 = new FireAlarmButton("FireAlarmButton1", 700, 150, 100, 100, showBoundingBoxes, fireAlarm, false, false, true);
  FireAlarmButton fireAlarmButton2 = new FireAlarmButton("FireAlarmButton2", 1000, 150, 100, 100, showBoundingBoxes, fireAlarm, true, false, true);
  FireAlarmButton fireAlarmButton3 = new FireAlarmButton("FireAlarmButton3", 700, 300, 100, 100, showBoundingBoxes, fireAlarm, false, false, true);
  FireAlarmButton fireAlarmButton4 = new FireAlarmButton("FireAlarmButton4", 1000, 300, 100, 100, showBoundingBoxes, fireAlarm, true, false, true);
  FireAlarmButton fireAlarmButton5 = new FireAlarmButton("FireAlarmButton5", 700, 450, 100, 100, showBoundingBoxes, fireAlarm, true, false, true);
  FireAlarmButton fireAlarmButton6 = new FireAlarmButton("FireAlarmButton6", 1000, 450, 100, 100, showBoundingBoxes, fireAlarm, false, false, true);
  fireAlarmScene.addGameObject(fireAlarmButton1);
  fireAlarmScene.addGameObject(fireAlarmButton2);
  fireAlarmScene.addGameObject(fireAlarmButton3);
  fireAlarmScene.addGameObject(fireAlarmButton4);
  fireAlarmScene.addGameObject(fireAlarmButton5);
  fireAlarmScene.addGameObject(fireAlarmButton6);
  
  sceneManager.addScene(fireAlarmScene);
  
  Scene timeUp = new Scene("TimeUp", "timeUp.png");
  
  sceneManager.addScene(timeUp);
  
  Scene yellowNote = new Scene("YellowNote", "hintNoteFull.png");
  
  yellowNote.addGameObject(toJournal);
  
  yellowNote.addGameObject(moveBack);
  
  sceneManager.addScene(yellowNote);
  
  Scene decision = new Scene("Decision", "decision.png");
  
  FinalDecision yes = new FinalDecision("YES", 735, 890, 110, 50, true);
  FinalDecision no = new FinalDecision("NO", 990, 890, 100, 50, false);
  decision.addGameObject(yes);
  decision.addGameObject(no);
  
  sceneManager.addScene(decision);
  
  Scene journal = new Scene("Journal", "journal.png");
  
  journal.addGameObject(moveBack);
  
  sceneManager.addScene(journal);
  
  Scene endingScene = new Scene("Ending", "ending.png");
  
  
  sceneManager.addScene(endingScene);
  
  inventoryManager.addCollectable(lighterLitCol);
}
