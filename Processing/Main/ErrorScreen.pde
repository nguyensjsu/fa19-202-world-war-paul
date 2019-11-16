/* Error Screen */
public class ErrorScreen extends Screen implements ITouchEventHandler, IDisplayComponent{

    private int startHeight;
    private int endHieght;
    private int startWidth;
    private int endWidth;
    private String errorMessage;
    private boolean flag;
    private float timer;
    ITouchEventHandler nextHandler ;

    public ErrorScreen(String str){
        startHeight = 0;
        endHieght = 85;
        startWidth = 0;
        endWidth = 380;
        errorMessage = str;
        flag = false;
    }

    // display error message on top of the screen for a few second
    public void display(){
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
              textAlign(LEFT);
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

    /**
     * Set flag of showing error message
     * @param f flag
     */
    public void setFlag(boolean f){
        this.flag = f;
    }

    /**
     * Set the timer when error message shows end at
     * @param t end time
     */
    public void setTimer(float t){
        this.timer = t;
    }
}
