/** Payments Screen */
public class OptionScreen extends Screen
{
    /** Display Components */
    private ArrayList<IDisplayComponent> components = new ArrayList<IDisplayComponent>() ;

    /** Front of Event Chain */
    private ITouchEventHandler chain ;
    private double totalPrice;

    public OptionScreen()
    {
        totalPrice = 0;
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

        String address = "Burger Option";

        text(address, (380 - address.length() * 9) / 2, currentHeight);
        currentHeight += 20;

        for (IDisplayComponent c: components) {
            c.display();
        }

        //Add Basket green Rectangular
        fill(0,204,0);   
        stroke(0,204,0); 
        rectMode(CORNER); 
        rect(0,630,380,50); 

        //Add to basket text
        textSize(20);
        fill(255);
        text("Add to Basket", 130, 660);
    }


    /**
     * Touch Event 
     * @param x Touch X
     * @param y Touch Y
     */
    @Override
    public void touch(int x, int y) {
        //hard code add to basket touch
        if(630 <= y && y<=680){
            totalPrice = addUp();

            //Can be comment out
            System.out.println(printDescription());
            System.out.println("subtotal is:  "+totalPrice);
        }
        chain.touch(x, y);
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

    /**test */
    public double addUp(){
        double subtotal = 0.0;
        for (IDisplayComponent c: components) {
            subtotal += c.add();
        }
        return subtotal;
    }


    /**
     * A print description
     * @return a string that comprise all component information
     */
    public String printDescription(){
        String total ="";
        for (IDisplayComponent c: components) {
            if(!c.title().equals("")){
                if(c.getClass().toString().split(" ", 2)[1].equals("Main$OptionTitle") ){
                    total += "\n" + c.title() + ": ";
                }else
                    total += c.title() + ",";
            }
        }
        return total;
    }

    

}
