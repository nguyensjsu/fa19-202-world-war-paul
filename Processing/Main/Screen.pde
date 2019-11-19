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

    /**
     * Serialize a Map into JSON and write it into a local file
     * @param map a map and convert to JSON file with the fileName
     * @param fileName the file name
     */
    public void serialization(Map<String, String> map, String fileName)
    {
        Gson gson = new Gson();
        String jsonString = gson.toJson(map);
        try
        {
            FileWriter file = new FileWriter("." + fileName); // might need to improve about the directory
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
     * Deserialize a local file from JSON into Map
     * @param fileName a fileName as a String
     * @return map converted from a JSON file
     */
    public Map<String, String> deserialization(String fileName)
    {
        Gson gson = new Gson();
        HashMap<String, String> result = new HashMap<String, String>();
        try
        {
            FileReader fr = new FileReader("." + fileName);
            StringBuilder str = new StringBuilder();
            int i;
            while ((i=fr.read()) != -1)
            {
            str.append((char)i);
            }
            String jsonString = str.toString();
            Type type = new TypeToken<HashMap<String, String>>(){}.getType();
            result = gson.fromJson(jsonString, type);
            fr.close();
        }
        catch(IOException e)
        {
            e.printStackTrace();
            // TODO: error message
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
