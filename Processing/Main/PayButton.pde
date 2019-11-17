/** Store Model */
public class PayButton extends Screen implements ITouchEventHandler, IDisplayComponent
{
    ITouchEventHandler nextHandler ;

    public PayButton() {
    }

    /**
     * Display store screen
     */
    public void display() {
      fill(0, 255, 0, 100);
      rect(0, 620, 380, 60);
      textAlign(CENTER);
      textSize(32); 
      fill(255, 255, 255, 255);
      text("Save Payment Method", width/2, 660); // Add Card Title
    }

    /**
     * Set Next Touch Handler
     * @param next Touch Event Handler
     */
    public void setNext(ITouchEventHandler next) 
    { 
        nextHandler = next ;
    }

    /**
     * Touch Event 
     * @param x Touch X
     * @param y Touch Y
     */
    public void touch(int x, int y) 
    {
      if(x > 0 && x < 380 && y > 620 && y < 680)
      {
        
      }
    }
}
