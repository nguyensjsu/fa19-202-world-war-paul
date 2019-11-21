public class OrderHistoryScreen extends Screen implements IDisplayComponent {

    /** Display Components */
    private ArrayList<IDisplayComponent> components = new ArrayList<IDisplayComponent>() ;

    /** Front of Event Chain */
    private ITouchEventHandler chain ;
    private MenuBarScreen menuBar;
    private Order order;
    private String bigItemName;
    private String smallItemName;
    private double bigItemPrice;
    private double smallItemPrice;
    private int lineCounter = 0;
    private DecimalFormat df2 = new DecimalFormat("#.##");



    private int startHeight;
    public OrderHistoryScreen() {

        startHeight = 20;
        // TODO: should actually get the items from the orderItem
        menuBar = new MenuBarScreen();
        addSubComponent(menuBar);

    }

    /**
     * Display content
     */
    @Override
    public void display() {

        int currentHeight = startHeight;
        order = deserialization("optionScreenDetail.json"); 


        background(255);
        String header = "Order History";
        text(header, (END_WIDTH - header.length() * 7) / 2, currentHeight);
        currentHeight += 20;


        for(int i = 0; i < order.getBigItem().size(); i++)
        {
            bigItemName = order.getBigItem().get(i).getName();
            bigItemPrice = order.getBigItem().get(i).getPrice();

            for(int j = 0; j < order.getBigItem().get(i).getSmallItem().size(); j++)
            {
                smallItemName = order.getBigItem().get(i).getSmallItem().get(j).getName();
                smallItemPrice = order.getBigItem().get(i).getSmallItem().get(j).getPrice();
            }
            displayItem();
        }
        displayFee();
        lineCounter = 0;

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
        menuBar.setFrame(frame);
    };

     public void displayItem()
     {
       fill(0, 0, 0, 255);
       textSize(20);
       textAlign(LEFT);
       text(bigItemName, 10, 100 + 20*lineCounter);
       text("$" + df2.format(bigItemPrice), 300, 100 + 20*lineCounter);
       lineCounter ++;
       fill(0, 0, 0, 150);
       text(smallItemName, 10, 100 + 20*lineCounter); // need to determine if the text length is above 380
       text("$" + df2.format(smallItemPrice), 300, 100 + 20*lineCounter);
       lineCounter ++;
       strokeWeight(3);
       stroke(0, 0, 0);
       line(10, 100 + 20*lineCounter, 370, 100+20*lineCounter);
       lineCounter ++;

     }

     public void displayFee()
     {        
       fill(0, 0, 0, 255);
       textAlign(CENTER);
       textSize(25); 
       text(order.getStoreName(), 190, 90);
       textAlign(RIGHT);
       text("$" + df2.format(order.getTotalPrice()), 370, 600);
       textAlign(LEFT);
       text("Total: ", 10, 600);
       textSize(20);
       textAlign(LEFT);
       text("Tax: ", 10, 100 + 20*lineCounter);
       text("$" +  df2.format(order.getTax()), 300, 100 + 20*lineCounter);
       lineCounter ++;
       text("Service Fee: ", 10, 100 + 20*lineCounter);
       text("$" + df2.format(order.getServiceFee()), 300, 100 + 20*lineCounter);
       lineCounter ++;

     }
}
