public class BasketScreen extends Screen implements IDisplayComponent {

    /** Display Components */
    private ArrayList<IDisplayComponent> components = new ArrayList<IDisplayComponent>() ;
    private ITouchEventHandler chain ;
    Map<String, String> order = new HashMap<String, String>();
    List<Map<String, String>> orderList = new ArrayList<Map<String, String>>();
    
    public BasketScreen() {
       
    }

    /**
     * Display content
     */
    @Override
    public void display() {
        
        background(255,255,255);
        textAlign(CENTER);
        textSize(32); 
        fill(0, 0, 0, 255);
        text("Basket", width/2, 50); // Basket Title
        
        strokeWeight(3);
        stroke(0, 0, 0);
        line(0, 60, 380, 60); // Line under title
        int lineCounter = 0;
        double totalPrice = 0;
        String storeName = "";
        
        order = deserialization("optionScreenDetail.json"); // fileName can be hardcode since it will be decided during the design
        
        //going through the order hash map and split the order into different hashmaps, then put all hashmap into an array;
        for (Map.Entry<String, String> entry : order.entrySet()) 
        {
          if(Integer.parseInt(entry.getKey().substring(0,1)) >= orderList.size() ) // if there is nothing on the spot of the orderList
          {
            //println(entry.getKey() + "  " + entry.getValue());
            Map<String, String> input = new HashMap<String, String>();
            input.put(entry.getKey().substring(1, entry.getKey().length()), entry.getValue());
            orderList.add(Integer.parseInt(entry.getKey().substring(0,1)), input);
          }
          else // if there is an order exist
          {
            orderList.get(Integer.parseInt(entry.getKey().substring(0,1))).put(entry.getKey().substring(1, entry.getKey().length()), entry.getValue());
          }
        }
        
        for(int i = 0; i < orderList.size(); i++) // display items, add-ons and money for each item
        {
          textSize(15);
          text("Item " + i + 1, 190, 80 + 20*lineCounter);
          lineCounter ++;
          for (Map.Entry<String, String> entry : orderList.get(i).entrySet()) 
          {
             println(entry.getKey() + "  " + entry.getValue());
             if(!entry.getKey().equals("Store") && !entry.getKey().equals("Money")) // in case if the items are too long to display
             {
               text(entry.getKey(), 190, 80 + 20*lineCounter);
               lineCounter ++;
               text("Add-Ons: " + entry.getValue(), 190, 80 + 20*lineCounter);
               lineCounter ++;
             }
             else if(entry.getKey().equals("Money"))
             {
               text(entry.getKey() + " : " + entry.getValue(), 190, 80 + 20*lineCounter);
               lineCounter ++;
               totalPrice += Double.parseDouble(entry.getValue());
             }
             else
             {
               storeName = entry.getValue();
             }
          }
        }
        
        textAlign(RIGHT);
        text("Store: " + storeName, 380, 590);
        text("Total Price: " + totalPrice, 380, 610);
        
        for (IDisplayComponent c: components) {
            c.display();
        }
    }

    /**
     * Add Display Component to Screen
     * @param c Display Component
     */
    @Override
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
     * Touch Event 
     * @param x Touch X
     * @param y Touch Y
     */
    @Override
    public void touch(int x, int y) {
        chain.touch(x, y);
    }
    @Override // for now, but all path of files shuold be standarized later during the group meeting
    public Map<String, String> deserialization(String fileName)
    {
      Gson gson = new Gson();
      HashMap<String, String> result = new HashMap<String, String>(); 
      try
      {
        FileReader fr = new FileReader("E:/Processing/processing-3.5.3-windows64/processing-3.5.3/" + fileName); // need to be repleaced to your own path of .json file
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
