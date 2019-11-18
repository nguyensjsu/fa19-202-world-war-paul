/** Footer Screen */
public class MenuBarScreen extends Screen implements ITouchEventHandler, IDisplayComponent
{
    ITouchEventHandler nextHandler ;

    // TODO: Screen variables might be implemented in the screen layout.
    private int startHeight;
    private int endHieght;
    private int startWidth;
    private int endWidth;

    // local images
    private PImage home;
    private PImage order;
    private PImage user;

    // local view required variables
    private int center;
    private int imageSize;
    private int sectionWidth;
    private int spacingWidth;
    
    protected IFrame frame;
    
    public MenuBarScreen() {
      
        
        endHieght = 680;
        startWidth = 0;
        endWidth = 380;

        home = loadImage("../../img/command/home_50.png");
        order = loadImage("../../img/command/order_50.png");
        user = loadImage("../../img/command/user_50.png");

        imageSize = home.width;
        center = endWidth / 2 - imageSize / 2; 
        sectionWidth = endWidth / 3;
        spacingWidth = 10;

        startHeight = endHieght - spacingWidth - imageSize - spacingWidth;
    }

    /**
     * Display store screen
     */
    public void display() {

        strokeWeight(1);
        stroke(0, 0, 0);
        line(startWidth, startHeight, endWidth, startHeight); 

        image(home, center - sectionWidth, endHieght - spacingWidth - imageSize);
        line(sectionWidth, startHeight, sectionWidth + 1, endHieght); 
        image(order, center, endHieght - spacingWidth - imageSize);
        line(sectionWidth * 2, startHeight, sectionWidth * 2 + 1, endHieght); 
        image(user, center + sectionWidth, endHieght - spacingWidth - imageSize);
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
        // IFrame f = Frame.getFrame();
      
        if (startHeight <= y && y <= endHieght) {
            if (startWidth <= x && x <= sectionWidth) {
                System.out.println("Jump to " + "home page");
               frame.cmd("home");
            } else if (sectionWidth < x && x <= sectionWidth * 2) {
                System.out.println("Jump to " + "order page");
               frame.cmd("order");
            } else if (sectionWidth * 2 < x && x <= endWidth) {
                System.out.println("Jump to " + "user page");
               frame.cmd("account");
            }
        } else if (nextHandler != null) {
            nextHandler.touch(x,y);
        }
    }
    
    public void setFrame(IFrame frame) {
       this.frame = frame;
    };
}
