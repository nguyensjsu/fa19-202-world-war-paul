/** Item Model */
public class Item extends Screen implements IDisplayComponent
{

    
    private String name;
    private int startingWidth = 10;
    private int startingHeight = 10;

    public Item(String name) {
       
        this.name = name;
        
    }

    /**
     * Display Item screen
     */
    public void display() {
        
 
        text(name, startingWidth, startingHeight);
        

    }

}
