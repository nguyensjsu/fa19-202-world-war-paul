public class BasketScreen extends Screen implements IDisplayComponent {

    /** Display Components */
    private ArrayList<IDisplayComponent> components = new ArrayList<IDisplayComponent>() ;
    private ITouchEventHandler chain ;
    //PayButton payButton = new Paybutton();

    public BasketScreen() {

    }

    /**
     * Display content
     */
    @Override
    public void display() {

        background(255,255,255);
        textAlign(CENTER);
        textSize(32);
        fill(0, 0, 0, 255);
        text("Basket", width/2, 50); // Basket Title

        strokeWeight(3);
        stroke(0, 0, 0);
        line(0, 60, 380, 60); // Line under title

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
        chain.touch(x, y);
    }
}
