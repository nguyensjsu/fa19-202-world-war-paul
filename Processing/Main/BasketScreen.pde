public class BasketScreen extends Screen implements IDisplayComponent {

    /** Display Components */
    private ArrayList<IDisplayComponent> components = new ArrayList<IDisplayComponent>() ;
    private ITouchEventHandler chain ;
    Map<String, String> order = new HashMap<String, String>();
    List<Map<String, String>> orderList = new ArrayList<Map<String, String>>();
            
    int lineCounter = 0;
    double totalPrice = 0;
    
    String storeName = "";
    String itemPrice = "";
    String itemName = "";
    String itemAddon = "";
    
    String serviceFee = "";
    String tax = "";
    
    private DecimalFormat df2 = new DecimalFormat("#.##");
    
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
          lineCounter ++;
          for (Map.Entry<String, String> entry : orderList.get(i).entrySet()) 
          {
             println(entry.getKey() + "  " + entry.getValue());
             if(!entry.getKey().equals("Store") && !entry.getKey().equals("Money")) // in case if the items are too long to display
             {
               itemName = entry.getKey();
               itemAddon = entry.getValue();
             }
             else if(entry.getKey().equals("Money"))
             {
               itemPrice = entry.getValue();
               totalPrice += Double.parseDouble(entry.getValue());
             }
             else
             {
               storeName = entry.getValue();
             }
          }
          displayItem();      
        }
        displayFee();
        
        
        for (IDisplayComponent c: components) {
            c.display();
        }
    }
    
    public void displayItem()
    {
      fill(0, 0, 0, 255);
      textSize(20);
      textAlign(LEFT);
      text(itemName, 10, 100 + 20*lineCounter);
      text("$" + itemPrice, 300, 100 + 20*lineCounter);
      lineCounter ++;
      fill(0, 0, 0, 150);
      text(itemAddon, 10, 100 + 20*lineCounter); // need to determine if the text length is above 380
      lineCounter ++;
      strokeWeight(3);
      stroke(0, 0, 0);
      line(10, 100 + 20*lineCounter, 370, 100+20*lineCounter);
      lineCounter ++;
    }
    
    public void displayFee()
    {
      
      fill(0, 0, 0, 255);
      textAlign(CENTER);
      textSize(25); 
      text(storeName, 190, 90);
      textAlign(RIGHT);
      text("$" + totalPrice, 370, 600);
      textAlign(LEFT);
      text("Total: ", 10, 600);
      
   
      textSize(20);
      textAlign(LEFT);
      text("Tax: ", 10, 100 + 20*lineCounter);
      text("$" +  df2.format(totalPrice*0.1), 300, 100 + 20*lineCounter);
      lineCounter ++;
      text("Service Fee: ", 10, 100 + 20*lineCounter);
      text("$" + df2.format(totalPrice*0.15), 300, 100 + 20*lineCounter);
      lineCounter ++;
      
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
      if(x > 0 && y > 0)
        resetBasket("optionScreenDetail.json");
        //chain.touch(x, y);
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
        //TODO: direct the user to home screen
      }
      return result;
    }
}
