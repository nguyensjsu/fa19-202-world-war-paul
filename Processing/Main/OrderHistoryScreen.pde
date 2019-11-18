public class OrderHistoryScreen extends Screen implements IDisplayComponent {

    /** Display Components */
    private ArrayList<IDisplayComponent> components = new ArrayList<IDisplayComponent>() ;

    /** Front of Event Chain */
    private ITouchEventHandler chain ;
    private MenuBarScreen mbs;

    private int startHeight;
    public OrderHistoryScreen() {

        startHeight = 20;
        // TODO: should actually get the items from the orderItem
        mbs = new MenuBarScreen();

        addSubComponent(mbs);
    }

    /**
     * Display content
     */
    @Override
    public void display() {

        int currentHeight = startHeight;

        background(255);
        String header = "Order History";
        text(header, (getWidth() - header.length() * 7) / 2, currentHeight);
        currentHeight += 20;
      
        for (IDisplayComponent c: components) {
            c.display();
        }
    }

    /**
     * Add Display Component to Screen
     * @param c Display Component
     */
    @Override
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
    @Override
    public void touch(int x, int y) {
        if (chain != null) {
            chain.touch(x, y);
        }
    }

    /**
     * set the frame for MenuBar Screen
     * @param frame The frame reference
     */
    public void setFrame(IFrame frame) {
        mbs.setFrame(frame);
    };
}
