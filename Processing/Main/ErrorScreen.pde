/* Error Screen */
public class ErrorScreen extends Screen implements ITouchEventHandler, IDisplayComponent{

    private int startHeight;
    private int endHieght;
    private int startWidth;
    private int endWidth;
    private String errorMessage;
    private boolean flag = false;

    ITouchEventHandler nextHandler ;

    public ErrorScreen(String str){
        startHeight = 0;
        endHieght = 85;
        startWidth = 0;
        endWidth = 380;
        errorMessage = str;
        flag = true;
    }

    // display error message on top of the screen for a few second
    public void display(){
        float timer = millis() + 1000;
        if(flag){
            if(millis() < timer){
              // error message background
              fill(209);
              rect(startWidth, startHeight, endWidth, endHieght, 7);
              // error message
              textSize(28);
              fill(255,0,0);
              textAlign(CENTER);
              text(errorMessage, 190, 50);
            }
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
    }

    public void setFlag(boolean f){
      this.flag = f;
    }
}
