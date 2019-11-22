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

    public MyAccountScreen(int height) {
        startHeight = height;
        menuBar = new MenuBarScreen();
        header = new Header("My Account");
        addCard = new AddCard();
        setNext(addCard);

        addSubComponent(menuBar);
        addSubComponent(header);
    }

    /**
     * Display store screen
     */
    public void display() {

        int startingWidth = 10;
        int currentHeight = startHeight;

        background(255);

        currentHeight += 15;

        text("Hi Admin!", startingWidth, currentHeight);
        currentHeight += 40;

        text("Add Card", startingWidth, currentHeight);
        currentHeight += 20;

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
        if (startHeight <= y && y <= endHieght) {
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
