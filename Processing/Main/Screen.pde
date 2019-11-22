/**
 * Base Class for Screens.
 *
 * Provides Common Functionality
 * For Setting Up the Composite and
 * Chain of Responsibility Patterns.
 *
 */
public class Screen implements IScreen, IDisplayComponent
{
    public static final int START_HEIGHT = 0;
    public static final int END_HEIGHT = 680;
    public static final int START_WIDTH = 0;
    public static final int END_WIDTH = 380;
    public int order_id = 0;
    public IFrame frame;

    protected IScreen prevScreen;
    protected IScreen nextScreen;
    protected PShape optionImg1;
    protected PShape optionImg2;

    /** Display Components */
    private ArrayList<IDisplayComponent> components = new ArrayList<IDisplayComponent>() ;

    /** Front of Event Chain */
    private ITouchEventHandler chain ;

    /** Constructor */
    public Screen()
    {
        optionImg1 = loadShape("../../img/customItem/option1.svg");  //file destination for file name ad-solid.svg
        optionImg2 = loadShape("../../img/customItem/option2.svg");  //file destination for file name ad-solid.svg
    }

    /**
     * Send Touch Events to the Chain
     * @param x Touch X Coord.
     * @param y Touch Y Coord.
     */
    public void touch(int x, int y) {
        if(chain != null)
            chain.touch(x, y) ;
    }

    /** Next Screen - Not Used */
    public void next() {
        if (nextScreen != null) {
            frame.setCurrentScreen(nextScreen);
        }
    }

    /** Previous Screen - Not Used */
    public void prev()  {
        if (prevScreen != null) {
            frame.setCurrentScreen(prevScreen);
        }
    }

    /**
     * Set Next Screen
     * @param s Next Screen Object
     */
    public void setNext(IScreen s) {
        nextScreen = s;
    }

    /**
     * Send Previous Screen
     * @param s Previous Screen Object
     */
    public void setPrev(IScreen s)  {
        prevScreen = s;
    }

    /**
     * Add Display Component to Screen
     * @param c Display Component
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
     * Get Display Contents
     * @return Display Contents
     */
    public void display() {
        for (IDisplayComponent c: components) {
            c.display();
        }
    }

    /**
     * Setup the current Frame reference
     * @param f THe frame reference
     */
    public void setFrame(IFrame f) {
        frame = f;
    }

    /**
     * Get the current Frame reference
     */
    public IFrame getFrame() {
        return frame;
    }

    /**
     * Get Class Name of Current Screen
     * @return Class Name of Current Screen
     */
    public String name() {
        return (this.getClass().getName());
    }

    /**
     * add price back
     */
    public double add(){
        //do nothing
        return 0.0;
    }

    /**
     * return the name to print
     */
    public String title(){
        return "";
    }

    // TODO: delele later 
    public double getPrice(){
        //Do nothing
        return 0.0;
    }

    /**
     * @param map, fileName, Taking a map and convert to JSON file with the fileName
     */
    public void serialization(Object obj, String fileName)
    {
        Gson gson = new Gson();
        String jsonString = gson.toJson(obj);
        try
        {
            FileWriter file = new FileWriter("." +File.separator+fileName); // might need to improve about the directory
            file.write(jsonString);
            file.close();
        }
        catch(IOException e)
        {
            e.printStackTrace();
            //TODO: direct to error msg screen
        }
    }

    /**
     * @param taking a fileName as a String
     * @return Order converted from a JSON file
     */
    public ArrayList<Order> deserialization(String fileName)
    {
        Gson gson = new Gson();
        TypeToken<List<Order>> token = new TypeToken<List<Order>>(){};
        ArrayList<Order> result = new ArrayList<Order>();
        try
        {
            FileReader fr = new FileReader("."+File.separator+fileName);
            result = gson.fromJson(fr, token.getType()); // has to be a class type
            
            fr.close();
        }
        catch(IOException e)
        {
            e.printStackTrace();
        }
        return result;
    }

    /*
     * Delete file by file name used by clean basket
     * @param fileName
     */
    public void deleteFile(String fileName){
        File file = new File("." + fileName);  //or this?

        if(file.delete())
        {
            //System.out.println("File deleted successfully");
        }
    }

   /**
    * reset the selected button to unselected
    */
    public void unselected(){
        //do nothing over here //this function is required for OptionTitle to use
    }
}
