public class OrderHistoryScreen extends Screen implements IDisplayComponent {

    /** Display Components */
    private ArrayList<IDisplayComponent> components = new ArrayList<IDisplayComponent>() ;

    /** Front of Event Chain */
    private ITouchEventHandler chain ;
    private MenuBarScreen menuBar;
    private Header header;

    private int startHeight;
    private int currentHeight;
    private int startLeft;

    // used for count order
    int lineCounter = 0;

    private ArrayList<Order> orderList;

    public OrderHistoryScreen() {

        startHeight = 60;

        startLeft = 40;


        // TODO: should actually get the items from the orderItem

        header = new Header("Order History");
        menuBar = new MenuBarScreen();

        // orderList = deserialization("optionScreenDetail.json");

        addSubComponent(menuBar);
        addSubComponent(header);

    }

    /**
     * Display content
     */
    @Override
    public void display() {

        currentHeight = startHeight;
        orderList = deserialization("optionScreenDetail.json");


        background(255);

        // System.out.println("orderList: " + orderList.size());
        for(Order order : orderList){ // get each order
            if (order != null){

            //   System.out.println(order.getStoreName() + " : " + order.getPrice());
              fill(0, 0, 0, 255);
              textSize(20);
              order.updatePrice();
              text(order.getStoreName() + " : " + order.getTotalPrice(), startLeft, currentHeight);
              currentHeight += 20;

              ArrayList<BigItem> bigItemList = order.getBigItemList();
              if(bigItemList != null){
                for(BigItem bigItem: bigItemList){ // get each Item in Order

                  fill(0, 0, 0, 255);
                  textSize(17);
                  text(bigItem.getName() + " : " + bigItem.getTotalPrice(), startLeft + 10, currentHeight);
                  //System.out.println("  " + bigItem.getName() + ":" + bigItem.getPrice());
                  currentHeight += 20;

                }
              }
            }
        }
        // currentHeight += 40;



        for (IDisplayComponent c: components) {
            c.display();
        }
    }

    /**
    * Display the bigitem and
    */
    // public void displayBigItem()
    // {
    //    fill(0, 0, 0, 255);
    //    textSize(20);
    //    textAlign(LEFT);
    //    text(bigItemName, 10, 100 + 20*lineCounter);
    //    text("$" + df2.format(bigItemPrice), 300, 100 + 20*lineCounter);
    //    lineCounter ++;
    // }

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
        this.frame = frame;
        menuBar.setFrame(frame);
    };
}
