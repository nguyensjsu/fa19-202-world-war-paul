/** Store Screen which can choose item*/
public class StoreScreen extends Screen
{
    /** Display Components */
    private ArrayList<IDisplayComponent> components = new ArrayList<IDisplayComponent>() ;

    //use lower add component
    private ArrayList<Screen> comp = new ArrayList<Screen>() ;

    /** Front of Event Chain */
    private ITouchEventHandler chain ;

    //a map to store user input
    Map< String,String> userInfoMap;; 

    //for Screen Title
    private String title;

    //for Store Name
    private String storeName;

    //for time Line count
    private int timeLine;

    public StoreScreen(String screenTitle, String currentStoreName)
    {
        title = screenTitle;
        storeName = currentStoreName;
        userInfoMap =  new HashMap< String,String>(); 
        timeLine = 0;
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

        //TODO align
        text(title, (380 - title.length() * 7) / 2, currentHeight); 
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
        
        // //if touch the Button   // would not use in production
        // if(630<=y && y<= 680){
        //     storeUserInput("storeScreenDetail.json"); //store the userInput into a json file
        //     //System.out.println(printDescription());  //debugging code
        //     resetButton();  //reset the buttom to original
        // }
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

        String timeLineString = Integer.toString(timeLine);

        //add money tag
        userInfoMap.put (timeLineString+"Money", Double.toString(getSubTotal()));

        //add Store tag
        userInfoMap.put (timeLineString+"Store", storeName);

        //add currentItem tag for the value of selected item
        for (Screen c: comp) {
            if(!c.title().equals("")){
                if( !c.getClass().toString().split(" ", 2)[1].equals("Main$OptionTitle") ){
                    userInfoMap.put ("currentItem", timeLineString+c.title());
                }
            }
        }

        //add currentTimeLine tag for next class easier to read
        userInfoMap.put("currentTimeLine", timeLineString);

        //debug code to print userInfoMap
        //System.out.println(Arrays.asList(userInfoMap));   

        serialization(userInfoMap, filename);         //store userinput
        
        timeLine++; //update time line for next item

        //Sample Output
        //{"0Store":"BurgerStore","currentTimeLine":"0","0Money":"11.5","currentItem":"0Chicken Burger"}
    }

    /**
     * reset all button to original display
     */
    public void resetButton(){
        for(Screen c:comp){
            c.reset();
        }
    }

    /**
     * use when user leave the current store or user clear the basket
     */
    public void resetStore(){
        timeLine = 0;
        userInfoMap =  new HashMap< String,String>(); 
    }
}
