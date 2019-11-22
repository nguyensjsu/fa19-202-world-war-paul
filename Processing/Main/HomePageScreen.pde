public class HomePageScreen extends Screen implements IDisplayComponent {

    /** Display Components */
    private ArrayList<IDisplayComponent> components = new ArrayList<IDisplayComponent>() ;

    /** Front of Event Chain */
    private ITouchEventHandler chain ;

    private String address;
    private MenuBarScreen menuBar;
    private Store burger;
    private Store starbucks;
    private Header header;

    public HomePageScreen(String address) {
        this.address = address;
        burger = new Store("../../img/store/burger_300x150.png", "Attack Burger", "Student Union", "Pickup: 7:00am - 10:00pm", 60);
        starbucks = new Store("../../img/store/starbucks_300x150.png", "Starbucks", "Student Union", "Pickup: 7:00am - 10:00pm", 290);

        header = new Header(address);
        menuBar = new MenuBarScreen();

        addSubComponent(burger);
        addSubComponent(starbucks);
        addSubComponent(menuBar);
        addSubComponent(header);
    }

    /**
     * Display content
     */
    @Override
    public void display() {

        background(255);

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
        starbucks.setFrame(frame);
        burger.setFrame(frame);
        menuBar.setFrame(frame);
    };
}
