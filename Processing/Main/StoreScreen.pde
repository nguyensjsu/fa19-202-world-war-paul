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

    public StoreScreen()
    {
        totalPrice = 0;
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

        String address = "Choose an Item";

        text(address, (380 - address.length() * 7) / 2, currentHeight);
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
        //hard code add to basket touch
        if(630 <= y && y<=680){
            totalPrice = addUp();

            // //for testing purpose
            // System.out.println(printDescription());
            // System.out.println("subtotal is:  "+totalPrice);
        }
        chain.touch(x, y);

        //update price and update display price
        totalPrice = addUp();
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
    public double addUp(){
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
        String total ="";
        for (Screen c: comp) {
            if(!c.title().equals("")){
                if(c.getClass().toString().split(" ", 2)[1].equals("Main$OptionTitle") ){
                    total += "\n" + c.title() + ": ";
                }else
                    total += c.title() + ",";
            }
        }
        return total;
    }


}
