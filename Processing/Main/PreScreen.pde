/* Error Screen */
public class PreScreen extends Screen{

    private int startHeight;
    private int endHeight;
    private int startWidth;
    private int endWidth;
    private int time;
    private boolean flag;
    PImage image;
    ITouchEventHandler nextHandler ;

    public PreScreen(){
        startHeight = 0;
        endHeight = 680;
        startWidth = 0;
        endWidth = 380;
        image = loadImage("../../img/preScreen/preScreen.png"); 
    }
  /**
   * display error message on top of the screen for a few second
   */
    public void display(){
      time = 2 - (int)millis()/1000;
      if(0 <= time){
        image(image, startHeight, startWidth, endWidth, endHeight);  
      }
      else
      {
        flag = true;
      }
    }
    /**
     * Touch Event
     * @param x Touch X
     * @param y Touch Y
     */
    public void touch(int x, int y){
      if(x > 0 && x < 380 && y > 0 && y < 680)
      {
        flag = true;
      }
    }
  /**
   * @return flag
   * set the flag for display options
   */
    public boolean getFlag()
    {
      return flag;
    }


}
