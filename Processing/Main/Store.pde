/** Store Model */
public class Store extends Screen implements ITouchEventHandler, IDisplayComponent
{
    ITouchEventHandler nextHandler ;

    private PImage image;
    private String name;
    private String address;
    private String hours;
    private int startHeight;
    private int endHieght;

    public Store(String imagePath, String name, String address, String hours, int height) {
        image = loadImage(imagePath); 
        this.name = name;
        this.address = address;
        this.hours= hours;
        startHeight = height;
    }

    /**
     * Display store screen
     */
    public void display() {
        
        int startingWidth = 10;
        int currentHeight = startHeight;

        image(image, startingWidth, currentHeight, 360, 150);
        currentHeight += 170;
        text(name, startingWidth, currentHeight);
        currentHeight += 20;
        text(address, startingWidth, currentHeight);
        currentHeight += 20;
        text(hours, startingWidth, currentHeight);
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
            System.out.println("Jump into" + name);
        } else if (nextHandler != null) {
            nextHandler.touch(x,y);
        }

    }
}
