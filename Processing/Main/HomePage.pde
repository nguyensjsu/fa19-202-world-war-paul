public class HomePage {

    /** Display Components */
    private ArrayList<IDisplayComponent> components = new ArrayList<IDisplayComponent>() ;

    private int height;
    private int width;

    public HomePage() {
        height = 380;
        width = 680;
    }

    public void display() {
        
        int startingWidth = 10;
        int currentHeight = 10;
        background(255);
        textSize(14);
        fill(0, 0, 0, 255);

        String address = "San Jose State University";

        text(address, (380 - address.length() * 7) / 2, currentHeight);
        currentHeight += 20;

        for (IDisplayComponent c: components) {
            c.display();
        }
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
