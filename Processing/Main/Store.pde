/** Store Model */
public class Store implements IDisplayComponent
{
    private int currentHeight;
    public Store(int height)
    {
        currentHeight = height;
    }

    public void display() {
        
        int startingWidth = 10;
        // int currentHeight = 10;

        PImage iamge = loadImage("../../img/store/starbucks_300x150.png");
        image(iamge, startingWidth, currentHeight, 360, 150);
        currentHeight += 170;

        text("StarBucks", startingWidth, currentHeight);
        currentHeight += 20;
        text("Student Union", startingWidth, currentHeight);
        currentHeight += 20;
        text("Pickup: 7:00am - 10:00pm", startingWidth, currentHeight);
        currentHeight += 20;
    }

    /**
     * Add Sub Component. -- Not used.
     * @param c Component.
     */
    public void addSubComponent( IDisplayComponent c ) {
        System.err.println( "Add Sub Component: " + c ) ;
    }
}
