public class HomePageScreen extends Screen implements IDisplayComponent {

    /** Display Components */
    private ArrayList<IDisplayComponent> components = new ArrayList<IDisplayComponent>() ;

    /** Front of Event Chain */
    private ITouchEventHandler chain ;

    private String address;
    private MenuBarScreen mbs;

    public HomePageScreen(String address) {
        this.address = address;
        Store starbucks = new Store("../../img/store/starbucks_300x150.png", "StarBucks1", "Student Union", "Pickup: 7:00am - 10:00pm", 20);
        Store panda = new Store("../../img/store/panda_300x150.png","Panda Express", "Student Union", "Pickup: 7:00am - 10:00pm", 250);
        
        mbs = new MenuBarScreen();
        addSubComponent(starbucks);
        addSubComponent(panda);
        addSubComponent(mbs);
    }

    /**
     * Display content
     */
    @Override
    public void display() {
        
        int currentHeight = 10;
        background(255);
        textSize(14);
        fill(0, 0, 0, 255);
        text(address, (getWidth() - address.length() * 7) / 2, currentHeight);
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
