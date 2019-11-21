public class BasketScreen extends Screen implements IDisplayComponent {

    /** Display Components */
    private ArrayList<IDisplayComponent> components = new ArrayList<IDisplayComponent>() ;
    private ITouchEventHandler chain ;
    //Map<String, String> order = new HashMap<String, String>();
    List<Map<String, String>> orderList = new ArrayList<Map<String, String>>();
    
    int lineCounter = 0;

    double totalPrice = 0;
    String storeName = "";

    double BigItemPrice = 0;
    String BigItemName = "";

    double SmallItemPrice = 0;
    String SmallItemName = "";
    
    double serviceFee = 0;
    double tax = 0;
    
    private DecimalFormat df2 = new DecimalFormat("#.##");
    
    Order order = new Order();
    BigItem bi = new BigItem();
    SmallItem si = new SmallItem();



    public BasketScreen() {
      si.setName("Cheese");
      si.setPrice(3.45);
      bi.setName("Buger");
      bi.setPrice(10.15);
      bi.addSmallItem(si);
      bi.calculateSmallItemPrice();
      //order.setPrice(13.6);
      order.addBigItem(bi);
      order.calculatePrice();
      order.setStoreName("Burger King");
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

        serialization(order, "OrderTest.json");
        order = deserialization("OrderTest.json"); // fileName can be hardcode since it will be decided during the design

        storeName = order.getStoreName();
        serviceFee = order.getPrice() * 0.15;
        tax = order.getPrice() * 0.1;
        totalPrice = order.getPrice() + serviceFee + tax;

        // println("The Order Number is " + order.getOrderNumber());
        println("The total Price is " + order.getPrice());
        for(int i = 0; i < order.getBigItem().size(); i++)
        {
            BigItemName = order.getBigItem().get(i).getName();
            BigItemPrice = order.getBigItem().get(i).getPrice();
            // println("Big Item name is " + order.getBigItem().get(i).getName());
            // println("Big Item Price is" + order.getBigItem().get(i).getPrice());
            
            for(int j = 0; j < order.getBigItem().get(i).getSmallItem().size(); j++)
            {
                SmallItemName = order.getBigItem().get(i).getSmallItem().get(j).getName();
                SmallItemPrice = order.getBigItem().get(i).getSmallItem().get(j).getPrice();
                // println("Small Item name is " +order.getBigItem().get(i).getSmallItem().get(j).getName());
                // println("Small Item price is " + order.getBigItem().get(i).getSmallItem().get(j).getPrice());
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
      text(BigItemName, 10, 100 + 20*lineCounter);
      text("$" + df2.format(BigItemPrice), 300, 100 + 20*lineCounter);
      lineCounter ++;
      fill(0, 0, 0, 150);
      text(SmallItemName, 10, 100 + 20*lineCounter); // need to determine if the text length is above 380
      text("$" + df2.format(SmallItemPrice), 300, 100 + 20*lineCounter);
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
      text("$" + df2.format(totalPrice), 370, 600);
      textAlign(LEFT);
      text("Total: ", 10, 600);
      
   
      textSize(20);
      textAlign(LEFT);
      text("Tax: ", 10, 100 + 20*lineCounter);
      text("$" +  df2.format(tax), 300, 100 + 20*lineCounter);
      lineCounter ++;
      text("Service Fee: ", 10, 100 + 20*lineCounter);
      text("$" + df2.format(serviceFee), 300, 100 + 20*lineCounter);
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
}
