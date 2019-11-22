public class OrderHistoryScreen extends Screen implements IDisplayComponent {

    /** Display Components */
    private ArrayList<IDisplayComponent> components = new ArrayList<IDisplayComponent>() ;

    /** Front of Event Chain */
    private ITouchEventHandler chain ;
    private MenuBarScreen menuBar;
    private Header header;

    private int startHeight;

    private int currentHeight;
    private int startLeft;


    private DecimalFormat df2 = new DecimalFormat("#.##");


    private ArrayList<Order> orderList;

    int[] data = {30, 10, 45, 35, 60, 38, 75, 67 };


    public OrderHistoryScreen() {

        startHeight = 60;

        startLeft = 40;


        // TODO: should actually get the items from the orderItem

        header = new Header("Order History");
        menuBar = new MenuBarScreen();

        LineChart LineChart = new LineChart();

        addSubComponent(menuBar);
        addSubComponent(header);
        addSubComponent(LineChart);



    }

    /**
     * Display content
     */
    @Override
    public void display() {

        currentHeight = startHeight+20;
        orderList = deserialization("optionScreenDetail.json");

        background(255);

        // System.out.println("orderList: " + orderList.size());
        for(Order order : orderList){ // get each order
            if (order != null){

              fill(0, 0, 0, 255);
              textSize(16);
              order.updatePrice();
              text(order.getStoreName() + " Order: $" + df2.format(order.getTotalPrice()), startLeft, currentHeight);
              currentHeight += 20;

              ArrayList<BigItem> bigItemList = order.getBigItemList();
              if(bigItemList != null){
                for(BigItem bigItem: bigItemList){ // get each Item in Order

                  fill(0, 0, 0, 255);
                  textSize(13);
                  text("-" + bigItem.getName(), startLeft + 10, currentHeight);
                  currentHeight += 20;
                }
              }

            }
            currentHeight += 15;
        }
        if (currentHeight == 80){

          fill(0, 0, 0, 255);
          textSize(18);
          text("No Order Available !", startLeft, currentHeight );
        }
        currentHeight += 40;





        // Line chart

        int startX = 40;
        int endX = 340;
        int startY = 100;
        int endY = 230;

        strokeWeight(1.5);
        stroke(0, 0, 0);
        // axis
        line(startX, startY, startX, endY);
        line(startX, endY, endX, endY);

        int step = (endX - startX - 30) / (data.length-1);
        int currentX = startX + 15;



        strokeWeight(1);
        textSize(10);
        fill(0);

        // put three y-axis point
        line(startX,
          map(min(data), min(data)-10, max(data)+10, startY, endY),
          startX+5,
          map(min(data), min(data)-10, max(data)+10,startY, endY)
        );
        text(0 - min(data), startX - 15, map(min(data), min(data)-10, max(data)+10,startY, endY)+2);
        line(startX,
          map(max(data), min(data)-10, max(data)+10, startY, endY),
          startX+5,
          map(max(data), min(data)-10, max(data)+10,startY, endY)
        );
        text(0 - max(data), startX - 15, map(max(data), min(data)-10, max(data)+10,startY, endY)+2);
        line(startX,
          map(int((max(data)+min(data))/2), min(data)-10, max(data)+10, startY, endY),
          startX+5,
          map(int((max(data)+min(data))/2), min(data)-10, max(data)+10,startY, endY)
        );
        text(0 - int((max(data)+min(data))/2), startX - 15, map(int((max(data)+min(data))/2), min(data)-10, max(data)+10,startY, endY)+2);


        for (int i = 0; i < data.length-1; i ++){
            float a = map(data[i], min(data) - 10, max(data) + 10, startY, endY);
            float b = map(data[i+1], min(data) - 10, max(data) + 10, startY, endY);
            line(currentX, a ,currentX + step, b);

            // x-axis point
            line(currentX, endY, currentX, endY - 5);
            text(i+1, currentX-2, endY + 12);

            currentX += step;
        }
        line(currentX, endY, currentX, endY - 5);
        text(data.length, currentX-2, endY + 12);


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
        if (chain != null) {
            chain.touch(x, y);
        }
    }

    /**
     * set the frame for MenuBar Screen
     * @param frame The frame reference
     */
    public void setFrame(IFrame frame) {
        this.frame = frame;
        menuBar.setFrame(frame);
    };
}
