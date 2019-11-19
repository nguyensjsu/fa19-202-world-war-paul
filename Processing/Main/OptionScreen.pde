/** Option Screen which can choose custom option for item*/
public class OptionScreen extends Screen
{
    /** Display Components */
    private ArrayList<IDisplayComponent> components = new ArrayList<IDisplayComponent>() ;

    //use lower add component
    private ArrayList<Screen> comp = new ArrayList<Screen>() ;

    /** Front of Event Chain */
    private ITouchEventHandler chain ;

    /** a map to store user input **/
    private Map< String,String> userInfoMap; 

    //for Screen Title
    private String title;

    //store previous price
    private double previousPrice;

    //for time line 
    private String timeLineString;

    public OptionScreen(String t)
    {
        title = t;
        userInfoMap = deserialization("storeScreenDetail.json"); //reread userinput from storeScreen 
        timeLineString = userInfoMap.remove("currentTimeLine");
        previousPrice = Double.parseDouble(userInfoMap.get(timeLineString+"Money")); //add previous money
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

        text(title, (380 - title.length() * 7) / 2, currentHeight);
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
        chain.touch(x, y);
        display();  //require to redisplay otherwise price will not be accurate due to mouse press delay

        //if touch the Button
        if(630<=y && y<= 680){
            storeUserInput("optionScreenDetail.json"); //store the userInput into a json file
            //System.out.println(printDescription());  //debugging code
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
        StringBuilder optionDetail = new StringBuilder();

        //update money tag in map
        userInfoMap.put(timeLineString + "Money", Double.toString(previousPrice+getSubTotal()));

        String itemName = userInfoMap.remove("currentItem");

        //loop through all user input to update option detail for item
        for (Screen c: comp) {
            if(!c.title().equals("")){
                if(!c.getClass().toString().split(" ", 2)[1].equals("Main$OptionTitle") ){
                    optionDetail.append(c.title()+"+");
                }
                userInfoMap.put(itemName, optionDetail.toString());
            }
        }
        //System.out.println(Arrays.asList(userInfoMap));   //debug code to print user infor map
        serialization(userInfoMap, filename);

        //Sample Output
        //{"0Beef Burger":"Danish Blue Cheese+Horsadish Cheddar+Yello American+Bermuda RedOnion+Black Onions+Appricot Sauce+Ranch+","0Store":"BurgerStore","0Money":"18.0"}
    }

    /**
     * reset all button to original display
     */
    public void resetButton(){
        for(Screen c:comp){
            c.reset();
        }
    }
}