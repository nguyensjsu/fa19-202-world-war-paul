/** Payments Screen */
public class Basket extends Screen implements IDisplayComponent, ITouchEventHandler
{
    ITouchEventHandler nextHandler ;
    private String name;

    public Basket(String n)
    {
        name = n;
    }

    /** 
      * Display function
      * @return: currently useless
      */ 
    public void display(){

        // TODO: clear up magic numbers
        //Add Basket green Rectangular
        fill(0,204,0);
        stroke(0,204,0);
        rectMode(CORNER);
        rect(0,630,380,50);

        //Add to basket text
        textSize(20);
        fill(255);
        text(name, 130, 660);
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
