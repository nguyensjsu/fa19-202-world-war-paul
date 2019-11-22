public class BasketScreen extends Screen implements IDisplayComponent {

    private ArrayList<IDisplayComponent> components = new ArrayList<IDisplayComponent>() ;
    private ITouchEventHandler chain ;
    List<Map<String, String>> orderList = new ArrayList<Map<String, String>>();
    
    int lineCounter = 0;

    double totalPrice = 0;
    String storeName = "";

    double bigItemPrice = 0;
    String bigItemName = "";

    double smallItemPrice = 0;
    String smallItemName = "";
    
    double serviceFee = 0;
    double tax = 0;
    
    private DecimalFormat df2 = new DecimalFormat("#.##");
    
    Order order;
    Button payButton;

    public BasketScreen() {
      payButton = new Button("Pay");
      addSubComponent(payButton);
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
        text("Basket", width/2, 50);
        
        strokeWeight(3);
        stroke(0, 0, 0);
        line(0, 60, 380, 60); 

        order = deserialization("OrderTest1.json"); 

        storeName = order.getStoreName();
        serviceFee = order.getPrice() * 0.15;
        tax = order.getTax();
        totalPrice = order.getTotalPrice();

        for(int i = 0; i < order.getBigItem().size(); i++)
        {
            bigItemName = order.getBigItem().get(i).getName();
            bigItemPrice = order.getBigItem().get(i).getPrice();
            
            for(int j = 0; j < order.getBigItem().get(i).getSmallItem().size(); j++)
            {
                smallItemName = order.getBigItem().get(i).getSmallItem().get(j).getName();
                smallItemPrice = order.getBigItem().get(i).getSmallItem().get(j).getPrice();
            }
            displayItem();
        }
        displayFee();
        lineCounter = 0;
        for (IDisplayComponent c: components) {
            c.display();
        }
    }
    
    public void displayItem()
    {
      fill(0, 0, 0, 255);
      textSize(20);
      textAlign(LEFT);
      text(bigItemName, 10, 100 + 20*lineCounter);
      text("$" + df2.format(bigItemPrice), 300, 100 + 20*lineCounter);
      lineCounter ++;
      fill(0, 0, 0, 150);
      text(smallItemName, 10, 100 + 20*lineCounter); // need to determine if the text length is above 380
      text("$" + df2.format(smallItemPrice), 300, 100 + 20*lineCounter);
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
        chain.touch(x, y);
    }
}
