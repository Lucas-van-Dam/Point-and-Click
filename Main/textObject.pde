class TextObject extends GameObject {
  String text;
  float textWidth;
  float textHeight;
  boolean hasText;
  
  public TextObject(String identifier, int x, int y, int owidth, 
                    int oheight, String gameObjectImageFile, String text, boolean showBoundingBox, boolean giveHighLight) {
    super(identifier, x, y, owidth, oheight, gameObjectImageFile, showBoundingBox, false, giveHighLight);
    this.text = text;
    displayText = false;
    calculateTextArea(); //Automatically calculates the area 
                         //necessary to display the entire text.
  }
  
    public TextObject(String identifier, int x, int y, int owidth, 
                    int oheight, String text, boolean showBoundingBox, boolean giveHighLight) {
    super(identifier, x, y, owidth, oheight, "", showBoundingBox, false, giveHighLight);
    this.text = text;
    displayText = false;
    calculateTextArea(); //Automatically calculates the area 
                         //necessary to display the entire text.
  }
  @Override
  public void draw() {
    super.draw();
    if(displayText) {
      image(textBackGround, x, y, textWidth + 30, textHeight);
      fill(0);
      textFont(american);
      text(text, this.x + 15, this.y + 15, textWidth, textHeight); 
    }
  }
  @Override
  public void mouseClicked() {
    
    if(mouseIsHovering && displayText == false) { displayText = true; }
    else
    {
       displayText = false;
    }
  }
  
  public void calculateTextArea() {
    textWidth = textWidth(text);
    float remaining = textWidth - 500;
    textWidth = (textWidth > 500) ? 500 : textWidth;
    textHeight = 80;
    while(remaining > 500)
    {
      textHeight += 80;
      remaining -= 500;
    }
  }
}
