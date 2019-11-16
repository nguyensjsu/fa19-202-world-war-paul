public class OrderHistoryScreen extends Screen implements IDisplayComponent {

    /** Display Components */
    private ArrayList<IDisplayComponent> components = new ArrayList<IDisplayComponent>() ;

    /** Front of Event Chain */
    private ITouchEventHandler chain ;

    // TODO: should actually get the items from the orderItem
    private Item item;

    public OrderHistoryScreen() {
        item = new Item("Burger x 1");
        addSubComponent(item);
        //TODO addSubComponent(menubar);
        
    }

    /**
     * Display content
     */
    @Override
    public void display() {
      background(255);
        textSize(14);
      
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
