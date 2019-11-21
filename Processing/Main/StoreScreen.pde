/** Store Screen which can choose item*/
public class StoreScreen extends Screen
{
    /** Display Components */
    private ArrayList<IDisplayComponent> components = new ArrayList<IDisplayComponent>() ;

    //use lower add component
    private ArrayList<Screen> comp = new ArrayList<Screen>() ;

    /** Front of Event Chain */
    private ITouchEventHandler chain ;

    private int base = 90;

    //To store order information
    Order currentOrder;

    //for Screen Title
    private String title;
    private Screen item1;
    private Screen item2;
    private Screen item3;

    public StoreScreen(String screenTitle)
    {
        title = screenTitle;

        if (title.equals("Attack Burger")) {
            OptionTitle title1 = new OptionTitle("Choose a Burger", "Burger", base-15);
            Screen basket = new Basket("Add Basket",630);
            item1 = new OptionItem("1/3LB Burger", 9.5, base);
            item2 = new OptionItem("2/3LB Burger", 11.5, base + 25*1);
            item3 = new OptionItem(" 1 LB Burger", 13.5, base + 25*2);
            addSubComp(title1);
            addSubComp(basket);
            addSubComp(item1);
            addSubComp(item2);
            addSubComp(item3);
        } else if (title.equals("Starbucks")) {
            OptionTitle title1 = new OptionTitle("Choose a Coffee", "Starbucks", base-15);
            Screen basket = new Basket("Add Basket",630);
            item1 = new OptionItem("Cappuccion", 3.5, base);
            item2 = new OptionItem("White Chocolate Mocha", 4.5, base + 25*1);
            item3 = new OptionItem("Latte", 3.5, base + 25*2);
            addSubComp(title1);
            addSubComp(basket);
            addSubComp(item1);
            addSubComp(item2);
            addSubComp(item3);
        }

    }

    /**
      * Display function
      * @return: currently useless
      */
    public void display(){
        int currentHeight = 20;
        background(255);
        textSize(20);
        fill(0, 0, 0, 255);

        text(title, (END_WIDTH - title.length() * 7) / 2, currentHeight);
        currentHeight += 20;

        for (IDisplayComponent c: components) {
            c.display();
        }

        //price text
        textSize(16);
        fill(255);
        text("$"+getSubTotal(), 320, 660);
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

        //if touch the Button
        if(base<=y && y<= base + 25*2){
            storeUserInput("storeScreenDetail.json"); //store the userInput into a json file
            resetButton();  //reset the buttom to original
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
     * Add A Child Component and reuse the preivous addSubComponent method
     * @param c Child Component
     */
    public void addSubComp( Screen c )
    {
        addSubComponent( (IDisplayComponent) c ); //IdisplayComponent add
        comp.add(c);         //Screen add
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
        return subtotal;
    }

    /**
     * A print description
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
     * Store user input as map and out put json file and timeline
     * @param filename the store input into file name
     */
    public void storeUserInput(String filename){

        //String timeLineString = Integer.toString(timeLine);
        currentOrder = new Order();

        //add currentItem tag for the value of selected item
        for (Screen c: comp) {
            if(!c.title().equals("")){
                if( !c.getClass().toString().split(" ", 2)[1].equals("Main$OptionTitle") ){
                    //Store item and price into order class
                    currentOrder.addBigItem(c.title(), getSubTotal());
                }
            }
        }
        serialization(currentOrder, filename);
    }

    /**
     * reset all button to original display
     */
    public void resetButton(){
        for(Screen c:comp){
            c.unselected();
        }
    }

    /**
     * use when user leave the current store or user clear the basket
     */
    public void resetStore(){
        currentOrder = new Order();
    }


    /**
    * Setup the current Frame reference
    * @param frame THe frame reference
    */
    public void setFrame(IFrame frame){
      item1.setFrame(frame);
      item2.setFrame(frame);
      item3.setFrame(frame);
    }
}