/** Store Screen which can choose item*/
public class StoreScreen extends Screen
{
    /** Display Components */
    private ArrayList<IDisplayComponent> components = new ArrayList<IDisplayComponent>() ;

    //use lower add component
    private ArrayList<Screen> comp = new ArrayList<Screen>() ;

    /** Front of Event Chain */
    private ITouchEventHandler chain ;

    private double totalPrice;
    private int base = 90;

    public StoreScreen()
    {
        totalPrice = 0;
        OptionTitle title1 = new OptionTitle("Choose a Burger", "Burger", base-15);
        Screen item1 = new OptionItem("1/3LB Burger", 9.5, base);
        Screen item2 = new OptionItem("2/3LB Burger", 11.5, base + 25*1);
        Screen item3 = new OptionItem(" 1 LB Burger", 13.5, base + 25*2);
        Screen basket = new Basket("View Basket");
        addSubComponent( title1);
        addSubComponent( item1);
        addSubComponent( item2);
        addSubComponent( item3);
        addSubComponent(basket);
        addSubComp(item1);
        addSubComp(item2);
        addSubComp(item3);
    }

    /**
      * Display function
      * @return: currently useless
      */
    public void display(){

        int startingWidth = 10;
        int currentHeight = 20;
        background(255);
        textSize(20);
        fill(0, 0, 0, 255);

        String title = "Choose an Item";

        text(title, (380 - title.length() * 7) / 2, currentHeight);
        currentHeight += 20;

        for (IDisplayComponent c: components) {
            c.display();
        }

        //price text
        textSize(16);
        fill(255);
        text("$"+totalPrice, 330, 660);
    }

    /**
     * Touch Event
     * @param x Touch X
     * @param y Touch Y
     */
    @Override
    public void touch(int x, int y) {
        chain.touch(x, y);

        //update price and update display price
        totalPrice = getSubTotal();
        display();
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
     * Add A Child Component
     * @param c Child Component
     */
    public void addSubComp( Screen c )
    {
        comp.add(c);
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
}
