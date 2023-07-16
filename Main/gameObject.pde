class GameObject {
  protected int x;
  protected int y;
  protected int owidth;
  protected int oheight;
  public String identifier;
  private boolean hasImage;
  private boolean hasHoverImage;
  private PImage gameObjectImage;
  private PImage gameObjectImageHover;
  protected boolean mouseIsHovering;
  public boolean showBoundingBox;
  public boolean isInventory;
  public boolean hasBeenClicked;
  boolean isSelected;
  boolean giveHighLight = true;
  boolean displayText = false;
  
  public GameObject(String identifier, int x, int y, int owidth, int oheight, boolean pShowBoundingBox, boolean isInventory, boolean giveHighLight) {
    this(identifier, x, y, owidth, oheight, "", pShowBoundingBox, isInventory, giveHighLight);
  }
  
  public GameObject(String identifier, int x, int y, int owidth, int oheight, String gameObjectImageFile, boolean pShowBoundingBox, boolean isInventory, boolean giveHighLight) {
    this.identifier = identifier;
    this.x = x;
    this.y = y;
    this.owidth = owidth;
    this.oheight = oheight;
    this.isInventory = isInventory;
    this.hasImage = !gameObjectImageFile.equals(""); 
    if(this.hasImage) {
       this.gameObjectImage = loadImage(gameObjectImageFile);
    }
    hasHoverImage = false;
    mouseIsHovering = false;
    showBoundingBox = pShowBoundingBox;
    this.giveHighLight = giveHighLight;
  }
  
  public void setHoverImage(String gameObjectImageHoverFile) {
    this.gameObjectImageHover = loadImage(gameObjectImageHoverFile);
    hasHoverImage = true;
  }
  
  public void draw() {
    if(showBoundingBox)
    {
      noFill();
      stroke(0);
      rect(x,y,owidth,oheight);
    }
    if(hasImage) {
      if(mouseIsHovering && hasHoverImage) {
        image(gameObjectImageHover, x, y, owidth, oheight);
      } else {
        image(gameObjectImage, x, y, owidth, oheight);
      }
      if(isSelected)
      {
        fill(0, 128);
        noStroke();
        rect(x,y,owidth, oheight);
      }      
    }
    if(mouseIsHovering && giveHighLight)
    {
      noStroke();
      fill(255, 128);
      rect(x, y, owidth, oheight);
      }
  }
  
  public void mouseMoved() {
    checkIsOver();
  }
  
  public void mouseClicked() { }
  
  public void mouseDragged() { }
  
  
  public String getIdentifier() {
    return this.identifier;
  }
  
  public void checkIsOver()
  {
    mouseIsHovering = false;
    if(mouseX >= x && mouseX <= x + owidth &&
       mouseY >= y && mouseY <= y + oheight) {
        mouseIsHovering = true;
     }
  }
  
  @Override 
  public boolean equals(Object obj) { 
    if (obj == this) { return true; } 
    if (obj == null || obj.getClass() != this.getClass()) { return false; } 
    GameObject otherGameObject = (GameObject) obj; 
    return otherGameObject.getIdentifier().equals(this.identifier);
  } 

  @Override 
  public int hashCode() { 
    final int prime = 11;
    return prime * this.identifier.hashCode();
  }
  
  public void init(){}
}
