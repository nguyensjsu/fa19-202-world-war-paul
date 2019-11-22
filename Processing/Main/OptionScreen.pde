import java.text.DecimalFormat;

/** Option Screen which can choose custom option for item*/
public class OptionScreen extends Screen
{
    /** Display Components */
    private ArrayList<IDisplayComponent> components = new ArrayList<IDisplayComponent>() ;

    //use lower add component
    private ArrayList<Screen> comp = new ArrayList<Screen>() ;

    /** Front of Event Chain */
    private ITouchEventHandler chain ;

    //for Screen Title
    private String title;

    //for time line
    private String timeLineString;

    private int base;

    //store previous price
    private double previousPrice;

    //check first time or not to dicide read file or not
    private boolean firstTimeRead;

    //current order
    private Order currentOrder;

    private String name;

    private Header header;

    public OptionScreen(String t, String n)
    {
        title = t;
        base = 90;
        name = n;
        firstTimeRead = true;

        header = new Header(title);
        
        if (name.indexOf("Burger") != -1) { //Found Burger inside the title

            OptionTitle title1 = new OptionTitle("Choose Cheese", "Cheese", base-15);
            Screen item1 = new LeftItem("Danish Blue Cheese", 1, base);
            Screen item2 = new LeftItem("Horsadish Cheddar", 1, base + 25*1);
            Screen item3 = new LeftItem("Yello American", 1, base + 25*2);
            OptionTitle title2 = new OptionTitle("Choose Topping", "Topping", base + 25*4);
            Screen item4 = new LeftItem("Bermuda RedOnion", 0, base+ 25*5);
            Screen item5 = new LeftItem("Black Onions", 0, base + 25*6);
            Screen item6 = new LeftItem("Carrot Strings", 0, base + 25*7);
            Screen item7 = new LeftItem("Coloslaw", 0, base + 25*8);
            Screen item8 = new LeftItem("Jolepenos", 0, base + 25*9);
            Screen item9 = new LeftItem("Sprouts", 0, base + 25*10);
            OptionTitle title3 = new OptionTitle("Choose Sauce", "Sauce", base + 25*12);
            Screen item10 = new LeftItem("Appricot Sauce", 0.75, base + 25*13);
            Screen item11 = new LeftItem("Ranch", 0.75, base + 25*14);
            Screen item12 = new LeftItem("Besil Pesto", 0.75, base + 25*15);
            Screen basket = new Basket("Add Basket", 630);

            addSubComponent(title1);
            addSubComponent(item1);
            addSubComponent(item2);
            addSubComponent(item3);
            addSubComponent(title2);
            addSubComponent(item4);
            addSubComponent(item5);
            addSubComponent(item6);
            addSubComponent(item7);
            addSubComponent(item8);
            addSubComponent(item9);
            addSubComponent(title3);
            addSubComponent(item10);
            addSubComponent(item11);
            addSubComponent(item12);
            addSubComponent(basket);
        } else {

            OptionTitle title1 = new OptionTitle("Choose Size", "Size", base-15);
            Screen item1 = new LeftItem("Tall", 2.25, base);
            Screen item2 = new LeftItem("Grande", 2.46, base + 25*1);
            Screen item3 = new LeftItem("Venti", 2.65, base + 25*2);
            OptionTitle title2 = new OptionTitle("Choose Tea Options", "Topping", base + 25*4);
            Screen item4 = new LeftItem("Radiant Green", 0, base+ 25*5);
            Screen item5 = new LeftItem("English Breakfast", 0, base + 25*6);
            Screen item6 = new LeftItem("Modern Earl Grey", 0, base + 25*7);
            Screen item7 = new LeftItem("Harmonic Mint", 0, base + 25*8);
            Screen item8 = new LeftItem("Jasmine green", 0, base + 25*9);
            Screen item9 = new LeftItem("Classic Chai", 0, base + 25*10);
            OptionTitle title3 = new OptionTitle("Choose Dairy & Non-Dairy", "Milk", base + 25*12);
            Screen item10 = new LeftItem("Coconut Milk", 0.70, base + 25*13);
            Screen item11 = new LeftItem("Soy Milk", 0.70, base + 25*14);
            Screen item12 = new LeftItem("2% Milk", 0, base + 25*15);
            Screen basket = new Basket("Add Basket", 630);

            addSubComponent(title1);
            addSubComponent(item1);
            addSubComponent(item2);
            addSubComponent(item3);
            addSubComponent(title2);
            addSubComponent(item4);
            addSubComponent(item5);
            addSubComponent(item6);
            addSubComponent(item7);
            addSubComponent(item8);
            addSubComponent(item9);
            addSubComponent(title3);
            addSubComponent(item10);
            addSubComponent(item11);
            addSubComponent(item12);
            addSubComponent(basket);
        }
        addSubComponent(header);
    }

    /**
      * Display function
      * @return: currently useless
      */
    public void display() {

        int currentHeight = 20;
        background(255);
        // textSize(20);
        // fill(0, 0, 0, 255);
        //
        // text(title, (END_WIDTH - title.length() * 10) / 2, currentHeight);
        // currentHeight += 20;

        for (IDisplayComponent c: components) {
            c.display();
        }

        //price text
        textSize(16);
        fill(255);
        text("$"+getCurrentTotal(), 320, 660);
    }

    /**
     * Touch Event
     * @param x Touch X
     * @param y Touch Y
     */
    @Override
    public void touch(int x, int y) {
        System.out.println("Running");
        chain.touch(x, y);
        display();  //require to redisplay otherwise price will not be accurate due to mouse press delay

        //if touch the Button
        if (630<=y && y<= 680){
            if (name.indexOf("Burger") != -1){
                frame.cmd("burgerStore");
            }else{
                frame.cmd("starbuksStore");
            }
        }
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
		
		if (orderList.size() > 0) {
            Order currentOrder = orderList.get(orderList.size() - 1);
            ArrayList<BigItem> itemList = currentOrder.getBigItemList();
            if (itemList.size() > 0) {
                BigItem currentItem = itemList.get(itemList.size() - 1);
                total += currentItem.getTotalPrice();
            }
        } 

        DecimalFormat df = new DecimalFormat("##.00");
        return Double.parseDouble(df.format(total));
    }

    /**
    * Setup the current Frame reference
    * @param frame THe frame reference
    */
    public void setFrame(IFrame frame){
        this.frame = frame;
        header.setFrame(frame);
    }
}
