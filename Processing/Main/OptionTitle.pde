/** Payments Screen */
public class OptionTitle extends Screen implements IDisplayComponent, ITouchEventHandler
{    
    ITouchEventHandler nextHandler ;


    String name;
    int cHeight;

    public OptionTitle(String n, int height)
    {
        name = n;
        cHeight = height;
    }

    /** 
      * Display function
      * @return: currently useless
      */ 
    public void display(){
        //All Txt
        textSize(14);
        fill(0);  
        text(name, 20, cHeight);
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
        //not a touch bottom thus do nothing
        if (nextHandler != null) {
            nextHandler.touch(x,y);
        }
    }

    

}
