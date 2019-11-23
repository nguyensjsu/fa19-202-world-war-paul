public class BasketScreen extends Screen implements IDisplayComponent {

    private ArrayList<IDisplayComponent> components = new ArrayList<IDisplayComponent>() ;
    private ITouchEventHandler chain ;

    private Button payButton;
    private Header header;
    private int lineCounter;
    private DecimalFormat df2 = new DecimalFormat("#.##");

    /**
     * Display content
     */
    public BasketScreen(String prev) {
        lineCounter = 0;
        header = new Header("Basket", prev);
        payButton = new Button("Pay");
        addSubComponent(header);
        addSubComponent(payButton);
    }

    /**
     * Display content
     */
    @Override
    public void display() {

        background(255,255,255);

        // Reset line counter
        lineCounter = 0;
        ArrayList<Order> orderList = deserialization("optionScreenDetail.json");
        Order order = new Order();
        if(orderList.size() > 0)
        	order = orderList.get(orderList.size() - 1);
        else
        {
        	order.setStoreName("");
        }

        fill(0, 0, 0, 255);
        textAlign(CENTER);
        textSize(20);
        text(order.getStoreName(), 190, 80);
        lineCounter++;

        ArrayList<BigItem> bigItemList = order.getBigItemList();
        for(int i = 0; i < bigItemList.size(); i++)
        {
            BigItem bigItem = order.getBigItemList().get(i);
            // bigItemName = bigItem.getName();
            // bigItemPrice = bigItem.getPrice();
            displayBigItem(bigItem.getName(), bigItem.getPrice());

            ArrayList<SmallItem> smallItemList = bigItem.getSmallItemList();
            for(int j = 0; j < smallItemList.size(); j++)
            {
                SmallItem smallItem = bigItem.getSmallItemList().get(j);
                // smallItemName = smallItem.getName();
                // smallItemPrice = smallItem.getPrice();
                displaySmallItem(smallItem.getName(), smallItem.getPrice());
            }
            displayLine();
        }
        displayFee(order.getTotalPrice(), order.getTax(), order.getServiceFee());
        
        for (IDisplayComponent c: components) {
            c.display();
        }
    }

    /**
    * Display the bigitem and
    * @param bigItemName big item name
    * @param bigItemPrice big item price
    */
    public void displayBigItem(String bigItemName, double bigItemPrice)
    {
        fill(0, 0, 0, 255);
        textSize(14);
        textAlign(LEFT);
        text(bigItemName, 10, 100 + 20*lineCounter);
        text("$" + df2.format(bigItemPrice), 300, 100 + 20*lineCounter);
        lineCounter++;
    }

    /**
    * Display the bigitem and
    * @param smallItemName small item name
    * @param smallItemPrice small item price
    */
    public void displaySmallItem(String smallItemName, double smallItemPrice)
    {
        fill(0, 0, 0, 150);
        text(smallItemName, 10, 100 + 20*lineCounter); // need to determine if the text length is above 380
        text("$" + df2.format(smallItemPrice), 300, 100 + 20*lineCounter);
        lineCounter++;
    }

    /**
     * Display Line
     */
    public void displayLine()
    {
        strokeWeight(1);
        stroke(0, 0, 0);
        line(10, 100 + 20*lineCounter, 370, 100+20*lineCounter);
        lineCounter++;
    }

    /**
     * Display the service fee and tax
     */
    public void displayFee(double totalPrice, double tax, double serviceFee)
    {
        textAlign(RIGHT);
        text("$" + df2.format(totalPrice), 370, 600);

        textAlign(LEFT);
        text("Total: ", 10, 600);
        textSize(14);

        text("Tax: ", 10, 100 + 20*lineCounter);
        text("$" +  df2.format(tax), 300, 100 + 20*lineCounter);
        lineCounter++;

        text("Service Fee: ", 10, 100 + 20*lineCounter);
        text("$" + df2.format(serviceFee), 300, 100 + 20*lineCounter);
        lineCounter++;
    }

    /**
     * Add Display Component to Screen
     * @param c Display Component
     */
    @Override
    public void addSubComponent( IDisplayComponent c )
    {
        components.add( c ) ;
        println(components.size());
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

    public void setFrame(IFrame frame){
        this.frame = frame;
        header.setFrame(frame);
    }
}
