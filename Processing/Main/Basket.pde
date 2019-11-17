/** Payments Screen */
public class Basket extends Screen implements IDisplayComponent, ITouchEventHandler
{
    ITouchEventHandler nextHandler ;
    private String name;
    private int currentHeight;
    private static final int MAX_WIDTH = 380;
    private static final int MAX_HEIGHT = 680;


    public Basket(String n, int h)
    {
        name = n;
        currentHeight = h;
    }

    /** 
      * Display function
      * @return: currently useless
      */ 
    public void display(){

        // TODO: clear up magic numbers
        //Add Basket green Rectangular
        fill(0,204,0);  //specail green RGB
        stroke(0,204,0);  //special green RGB
        rectMode(CORNER);
        rect(0, currentHeight , MAX_WIDTH , MAX_HEIGHT - currentHeight);

        //Add to basket text
        textSize(20);
        fill(255);  //white
        text(name, 130, currentHeight+30); //best result x=130, y=currentHeight+30
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
        if (nextHandler != null) {
            nextHandler.touch(x,y);
        }
    }
}
