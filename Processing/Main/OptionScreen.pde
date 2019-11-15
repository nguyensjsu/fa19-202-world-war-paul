/** Payments Screen */
public class OptionScreen extends Screen
{
    /** Display Components */
    private ArrayList<IDisplayComponent> components = new ArrayList<IDisplayComponent>() ;

    public OptionScreen()
    {
    }

    /** 
      * Display function
      * @return: currently useless
      */ 
    public void display(){
        int startingWidth = 10;
        int currentHeight = 20;
        background(255);
        textSize(20);
        fill(0, 0, 0, 255);

        String address = "Attact Burger";

        text(address, (380 - address.length() * 9) / 2, currentHeight);
        currentHeight += 20;

        for (IDisplayComponent c: components) {
            c.display();
        }
    }

    /** 
      * touch function
      */
    public void touch(int x, int y){

    }

        /**
     * Add A Child Component
     * @param c Child Component
     */
    public void addSubComponent( IDisplayComponent c )
    {
        components.add( c ) ;
        // if (components.size() == 1 )
        // {
        //     chain = (ITouchEventHandler) c ;
        // }
        // else
        // {
        //     ITouchEventHandler prev = (ITouchEventHandler) components.get(components.size()-2) ;
        //     prev.setNext( (ITouchEventHandler) c ) ;
        // }
    }

    

}
