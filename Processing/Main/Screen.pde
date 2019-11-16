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
    
    /** Display Components */
    private ArrayList<IDisplayComponent> components = new ArrayList<IDisplayComponent>() ;

    /** Front of Event Chain */
    private ITouchEventHandler chain ;

    /** Constructor */
    public Screen()
    {
        width = 380;
        height = 680;
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
        // add code here
    }

    /**
     * Set Next Screen - Not Used
     * @param s Next Screen Object
     * @param n Next Screen Label
     */
    public void setNext(IScreen s, String n )  {
        // add code here
    }

    /**
     * Send Previous Screen - Not Used
     * @param s Previous Screen Object
     * @param n Previous Screen Label
     */
    public void setPrev(IScreen s, String n )  {
        // add code here
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
     * Get Class Name of Current Screen
     * @return Class Name of Current Screen
     */
    public String name() {
        return (this.getClass().getName());
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
     * @param taking a fileName as a String
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
      }
      return result;
    }
}
