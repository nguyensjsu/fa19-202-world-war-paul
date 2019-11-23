/** My Account Screen */
public class MyAccountScreen extends Screen implements IDisplayComponent
{
    /** Display Components */
    private ArrayList<IDisplayComponent> components = new ArrayList<IDisplayComponent>() ;

    /** Front of Event Chain */
    private ITouchEventHandler chain ;

    private int startHeight;
    private int endHieght = 580;
    private MenuBarScreen menuBar;
    private AddCard addCard;
    private Header header;
    private PImage image1;
    private PImage image2;
    private PImage image3;
    private PImage image4;


    public MyAccountScreen(int height) {
        startHeight = height;
        menuBar = new MenuBarScreen();
        header = new Header("My Account");
        addCard = new AddCard();
        setNext(addCard);

        addSubComponent(menuBar);
        addSubComponent(header);
        image1 = loadImage("../../img/addCard/addCard.png");
        image2 = loadImage("../../img/addCard/contact.png");
        image3 = loadImage("../../img/addCard/give.png");
        image4 = loadImage("../../img/addCard/account.png");
    }

    /**
     * Display store screen
     */
    public void display() {

        int startingWidth = 75;
        int currentHeight = startHeight;

        background(255);

        currentHeight += 15;
        textSize(16);

        text("Hi Admin!", startingWidth, currentHeight);
        
        image(image1, startingWidth-55, currentHeight+25, 50, 50);
        currentHeight += 60;
        text("Add Card", startingWidth, currentHeight);
        
        image(image2, startingWidth-55, currentHeight+25, 50, 50);
        currentHeight += 60;
        text("Contact Support", startingWidth, currentHeight);
        
        image(image3, startingWidth-55, currentHeight+25, 50, 50);
        currentHeight += 60;
        text("Give Us your feedback", startingWidth, currentHeight);
        
        image(image4, startingWidth-55, currentHeight+25, 50, 50);
        currentHeight += 60;
        text("Account Setting", startingWidth, currentHeight);


        for (IDisplayComponent c: components) {
            c.display();
        }
    }

    /**
     * Add Display Component to Screen
     * @param c Display Component
     */
    public void addSubComponent( IDisplayComponent c )
    {
        components.add( c ) ;
        if (components.size() == 1 )
        {
            chain = (ITouchEventHandler) c ;
        }
        else
        {
            ITouchEventHandler prev = (ITouchEventHandler) components.get(components.size()-2) ;
            prev.setNext( (ITouchEventHandler) c ) ;
        }
    }

    /**
     * Touch Event
     * @param x Touch X
     * @param y Touch Y
     */
    public void touch(int x, int y)
    {
        if (110 <= y && y <= 145) {
            // TODO: next() should jump to next screen
            next();
            System.out.println("Jump into " + "Add Card");
        } else if (chain != null) {
            chain.touch(x, y);
        }
    }

    /**
     * set the frame for MenuBar Screen
     * @param f The frame reference
     */
    public void setFrame(IFrame frame) {
        this.frame = frame;
        menuBar.setFrame(frame);
        addCard.setFrame(frame);
    }
}
