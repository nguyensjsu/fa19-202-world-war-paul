/** My Account Screen */
public class MyAccountScreen extends Screen implements ITouchEventHandler, IDisplayComponent
{
    ITouchEventHandler nextHandler ;

    private int startHeight;
    private int endHieght;

    public MyAccountScreen(int height) {
        startHeight = height;
    }

    /**
     * Display store screen
     */
    public void display() {
        
        int startingWidth = 10;
        int currentHeight = startHeight;

        background(255);
        textSize(14);
        fill(0, 0, 0, 255);

        String header = "My Account";
        text(header, (getWidth() - header.length() * 7) / 2, currentHeight);
        currentHeight += 20;

        text("Add Card", startingWidth, currentHeight);
        currentHeight += 20;

        endHieght = currentHeight;
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
        if (startHeight <= y && y <= endHieght) {
            // TODO: next() should jump to next screen
            next();
            System.out.println("Jump into " + "Add Card");
        } else if (nextHandler != null) {
            nextHandler.touch(x,y);
        }
    }
}
