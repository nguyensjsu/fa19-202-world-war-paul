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

    public OptionScreen(String t, String n)
    {
        title = t;
        base = 90;
        name = n;
        firstTimeRead = true;

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

            addSubComp(title1);
            addSubComp(item1);
            addSubComp(item2);
            addSubComp(item3);
            addSubComp(title2);
            addSubComp(item4);
            addSubComp(item5);
            addSubComp(item6);
            addSubComp(item7);
            addSubComp(item8);
            addSubComp(item9);
            addSubComp(title3);
            addSubComp(item10);
            addSubComp(item11);
            addSubComp(item12);
            addSubComp(basket);
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

            addSubComp(title1);
            addSubComp(item1);
            addSubComp(item2);
            addSubComp(item3);
            addSubComp(title2);
            addSubComp(item4);
            addSubComp(item5);
            addSubComp(item6);
            addSubComp(item7);
            addSubComp(item8);
            addSubComp(item9);
            addSubComp(title3);
            addSubComp(item10);
            addSubComp(item11);
            addSubComp(item12);
            addSubComp(basket);
        }
    }

    /**
      * Display function
      * @return: currently useless
      */
    public void display(){
        if(firstTimeRead){
            firstTimeRead = false;
            ArrayList<Order> currentOrderList = new ArrayList<Order>();
            currentOrderList = deserialization("storeScreenDetail.json"); //reread userinput from storeScreen
            currentOrder = currentOrderList.get(0);
            previousPrice = currentOrder.getLatestPrice();
        }

        int currentHeight = 20;
        background(255);
        textSize(20);
        fill(0, 0, 0, 255);

        text(title, (END_WIDTH - title.length() * 10) / 2, currentHeight);
        currentHeight += 20;

        for (IDisplayComponent c: components) {
            c.display();
        }

        //price text
        textSize(16);
        fill(255);
        text("$"+(previousPrice + getSubTotal()), 320, 660);
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
        if(630<=y && y<= 680){
            storeUserInput("optionScreenDetail.json"); //store the userInput into a json file
            //storeScreen = new StoreScreen(name);
            //storeScreen.setFrame(frame);
            //setNext(storeScreen);
            //next();
            if (name.indexOf("Burger") != -1){
                frame.cmd("burgerStore");
            }else{
                frame.cmd("starbuksStore");
            }
            //resetButton();  //reset the buttom to original
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
     * Add A Child Component for option Screen to update price and isSelected info
     * @param c Child Component
     */
    public void addSubComp( Screen c )
    {
        addSubComponent((IDisplayComponent)c);         //add Display Component
        comp.add(c);        //add Screen Component for composite getSubtotal
    }


    /**
     * adding up total price
     * @return subtotal price
     */
    public double getSubTotal(){
        double subtotal = 0.0;
        for (Screen c: comp) {
            subtotal += c.add();
        }
        DecimalFormat df = new DecimalFormat("##.00");
        subtotal = Double.parseDouble(df.format(subtotal));
        return subtotal;
    }

    /**
     * print description
     * @return a string that comprise all component information
     */
    public String printDescription(){
        StringBuilder description = new StringBuilder();
        for (Screen c: comp) {
            if(!c.title().equals("")){
                if(c.getClass().toString().split(" ", 2)[1].equals("Main$OptionTitle") ){
                    description.append("\n" + c.title() + ": ");
                }else
                    description.append(c.title() + ",");
            }
        }
        return description.toString();
    }

    /**
     * Store user input as map and out put json file
     * @param filename the store input into file name
     */
    public void storeUserInput(String filename){
        //loop through all user input to update option detail for item
        for (Screen c: comp) {
            if(!c.title().equals("")){
                if(!c.getClass().toString().split(" ", 2)[1].equals("Main$OptionTitle") ){
                    SmallItem smallItem = new SmallItem(c.title(), c.getPrice());
                    currentOrder.addSmallItem(smallItem);
                }
            }
        }
        ArrayList<Order> currentOrderList = new ArrayList<Order>();
        currentOrderList.add(currentOrder);

        serialization(currentOrderList, filename);
        //Debug purpose
        System.out.println("latest output price is+ "+currentOrder.getLatestPrice());
    }

    /**
     * reset all button to original display
     */
    public void resetButton(){
        for(Screen c:comp){
            c.unselected();
        }
        firstTimeRead = true;
    }
}
