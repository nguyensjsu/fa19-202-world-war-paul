import java.util.* ;

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
    private int width;
    private int height;
    IFrame frame;
    protected IScreen prevScreen;
    protected IScreen nextScreen;
    private String filePath;

    /** Display Components */
    private ArrayList<IDisplayComponent> components = new ArrayList<IDisplayComponent>() ;

    /** Front of Event Chain */
    private ITouchEventHandler chain ;


    /** Constructor */
    public Screen()
    {
        width = 380;
        height = 680;

        //Required to update by self
        filePath = "/Users/stevenyang/Desktop/fa19-202-world-war-paul/Processing/Main/"; //TODO
    }

    /**
    * Get the Screen Witdh
    */
    public int getWidth() {
        return width;
    }

    /**
    * Get the Screen Height
    */
    public int getHeight() {
        return height;
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
        // add code here
    }

    /** Previous Screen - Not Used */
    public void prev()  {
        if (prevScreen != null) {
            frame.setCurrentScreen(prevScreen);
        }
    }

    /**
     * Set Next Screen - Not Used
     * @param s Next Screen Object
     * @param n Next Screen Label
     */
    public void setNext(IScreen s) {
        nextScreen = s;
    }

    /**
     * Send Previous Screen - Not Used
     * @param s Previous Screen Object
     * @param n Previous Screen Label
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

    public void setFrame(IFrame frame) {
        this.frame = frame;
    }

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
     * @param map, fileName, Taking a map and convert to JSON file with the fileName
     */
    public void serialization(Map<String, String> map, String fileName)
    {
      Gson gson = new Gson();
      String jsonString = gson.toJson(map);
      try
      {
        FileWriter file = new FileWriter(filePath + fileName);
        //FileWriter file = new FileWriter("./" + fileName);  //Original Code

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
     * @return map converted from a JSON file
     */
    public Map<String, String> deserialization(String fileName)
    {
      Gson gson = new Gson();
      HashMap<String, String> result = new HashMap<String, String>();
      try
      {
        FileReader fr = new FileReader(filePath + fileName);
        //FileReader fr = new FileReader("." + fileName);  //Original Code

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
      }
      return result;
    }

    /*
     * Delete file by file name used by clean basket
     * @param fileName
     */
    public void deleteFile(String fileName){
        File file = new File(filePath + fileName);
        //File file = new File("." + fileName);  //or this?

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
