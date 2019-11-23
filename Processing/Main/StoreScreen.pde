/** Store Screen which can choose item*/
public class StoreScreen extends Screen
{
    /** Display Components */
    private ArrayList<IDisplayComponent> components = new ArrayList<IDisplayComponent>() ;

    /** Front of Event Chain */
    private ITouchEventHandler chain ;

    private int base = 90;

    //for Screen Title
    private String storeName;
    private Screen item1;
    private Screen item2;
    private Screen item3;
    private OptionTitle title1;
    private Button viewBasketButton;
    private BasketScreen basketScreen;

    private Header header;

    public StoreScreen(String name)
    {
        storeName = name;
        header = new Header(storeName);

        if (storeName.equals("Attack Burger")) {
            title1 = new OptionTitle("Choose a Burger", "Burger", base-15);
            item1 = new OptionItem("Attack Burger", "1/3LB Burger", 9.5, base);
            item2 = new OptionItem("Attack Burger", "2/3LB Burger", 11.5, base + 25*1);
            item3 = new OptionItem("Attack Burger", " 1 LB Burger", 13.5, base + 25*2);
            viewBasketButton = new Button("View Basket", "Attack Burger");
        }
        else if (storeName.equals("Starbucks")) {
            title1 = new OptionTitle("Choose a Coffee", "Starbucks", base-15);
            item1 = new OptionItem("Starbucks", "Cappuccion", 3.5, base);
            item2 = new OptionItem("Starbucks", "White Chocolate Mocha", 4.5, base + 25*1);
            item3 = new OptionItem("Starbucks", "Latte", 3.5, base + 25*2);
            viewBasketButton = new Button("View Basket", "Starbucks");
        }

        addSubComponent(title1);
        addSubComponent(item1);
        addSubComponent(item2);
        addSubComponent(item3);
        addSubComponent(header);
        addSubComponent(viewBasketButton);

    }

    /**
      * Display function
      * @return: currently useless
      */
    public void display(){

        int currentHeight = 20;
        background(255);
        currentHeight += 20;

        for (IDisplayComponent c: components) {
            c.display();
        }

        //price text
        textSize(16);
        fill(255);
        text("$"+getCurrentTotal(), 320, 655);
    }

    /**
     * Touch Event
     * @param x Touch X
     * @param y Touch Y
     */
    @Override
    public void touch(int x, int y) {

        chain.touch(x, y);
        display();  //require to redisplay otherwise price will not be accurate due to mouse press delay
    }

    /**
     * Add A Child Component
     * @param c Child Component
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
     * adding up total price
     * @return subtotal price
     */
    public double getCurrentTotal(){

        double total = 0.0;

        File orderFile = new File("." + File.separator + "optionScreenDetail.json");
		ArrayList<Order> orderList = deserialization("optionScreenDetail.json"); //reread userinput from storeScreen

		// currentOrder.setStoreName(storeName);
		if (orderList.size() > 0) {
            Order currentOrder = orderList.get(orderList.size() - 1);
            if (!currentOrder.getOrdercompletion()) {
                for (BigItem item : currentOrder.getBigItemList()) {
                    total += item.getTotalPrice();
                }
            }
        }

        DecimalFormat df = new DecimalFormat("##.00");
        total = Double.parseDouble(df.format(total));
        return total;
    }

    /**
    * Setup the current Frame reference
    * @param frame THe frame reference
    */
    public void setFrame(IFrame frame){
        this.frame = frame;
        item1.setFrame(frame);
        item2.setFrame(frame);
        item3.setFrame(frame);
        header.setFrame(frame);
        viewBasketButton.setFrame(frame);
    }
}
