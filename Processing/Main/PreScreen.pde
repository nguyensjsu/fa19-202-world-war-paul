/* Error Screen */
public class PreScreen extends Screen implements ITouchEventHandler, IDisplayComponent{

    private int startHeight;
    private int endHeight;
    private int startWidth;
    private int endWidth;
    private int time;
    PImage image;
    ITouchEventHandler nextHandler ;

    public PreScreen(){
      
      
        startHeight = 0;
        endHeight = 680;
        startWidth = 0;
        endWidth = 380;
        
        image = loadImage("../../img/preScreen/preScreen.png"); 

    }

    // display error message on top of the screen for a few second
    public void display(){
      time = 5 - (int)millis()/1000;
      if(0 <= time){
        image(image, startHeight, startWidth, endWidth, endHeight);  
        fill(255, 255, 255, 255);
        textSize(30); 
        text("skip("+time+"s)",260,38);
      }
      else
      {
        //TODO: going to the login Screen;
      }
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
    public void touch(int x, int y){
      if(x > 220 && x < 380 && y > 0 && y < 45)
      {
        //TODO: go to the login screen
      }
      
    }
    /**
     * Set the timer when error message shows end at
     * @param t end time
     */
     //public void setTimer(int second)
     //{
     //  time = second;
     //}

}
