/** Option Screen which can choose custom option for item*/
public class OptionScreen extends Screen
{
    /** Display Components */
    private ArrayList<IDisplayComponent> components = new ArrayList<IDisplayComponent>() ;

    //use lower add component
    private ArrayList<Screen> comp = new ArrayList<Screen>() ;

    /** Front of Event Chain */
    private ITouchEventHandler chain ;

    //for price display
    private double totalPrice;

    //for Screen Title
    private String title;

    public OptionScreen(String t)
    {
        totalPrice = 0;
        title = t;
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

        //if touch the Button
        if(630<=y && y<= 680){
            storeUserInput("test.json"); //store the userInput into a json file
            //System.out.println(printDescription());  //debugging code
            resetButton();  //reset the buttom to original

            Map< String,String> mp =  deserialization("test.json");
            System.out.println(Arrays.asList(mp));   //debug code
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
        Map< String,String> map =  new HashMap< String,String>(); 
        String optionTitle = "";
        StringBuilder optionDetail = new StringBuilder();
        for (Screen c: comp) {
            if(!c.title().equals("")){
                if(c.getClass().toString().split(" ", 2)[1].equals("Main$OptionTitle") ){
                    optionTitle = c.title();
                    optionDetail = new StringBuilder();
                }else
                    optionDetail.append(c.title()+",");
                map.put(optionTitle, optionDetail.toString());
            }
        }
        //System.out.println(Arrays.asList(map));   //debug code to print hashmap
        serialization(map, filename);
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