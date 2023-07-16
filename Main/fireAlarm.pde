class FireAlarm
{
  boolean isActive = true;
  public ArrayList<FireAlarmButton> buttons = new ArrayList<FireAlarmButton>(6);
  int correctButtons;
  
  void updateAlarm()
  {
    correctButtons = 0;
    for(FireAlarmButton button : buttons)
    {
      if(button.isActive == button.shouldBeActive)
      {
        correctButtons++;
      }
      else
      {
        correctButtons--;
      }
    }
    if(correctButtons == buttons.size())
    {
      fireAlarmIsActive = false;
    }
    else
    {
      fireAlarmIsActive = true;
    }
  }
}
