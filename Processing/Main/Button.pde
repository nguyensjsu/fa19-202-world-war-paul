/** Store Model */
public class Button extends Screen implements ITouchEventHandler, IDisplayComponent
{
    ITouchEventHandler nextHandler ;
    private ArrayList<IDisplayComponent> components = new ArrayList<IDisplayComponent>() ;
    String buttonName;
    public Button(String name) {
      buttonName = name;
    }

    /**
     * Display Pay button
     */
    public void display() {
      fill(0, 255, 0, 100);
      rect(0, 620, 380, 60);
      textAlign(CENTER);
      textSize(32); 
      fill(255, 255, 255, 255);
      text("Pay", width/2, 660); // Pay Title
    }

    /**
     * Set Next Touch Handler
     * @param next Touch Event Handler
     */
    public void setNext(ITouchEventHandler next) 
    { 
        nextHandler = next ;
    }

    /**
     * Touch Event 
     * @param x Touch X
     * @param y Touch Y
     * reuseable, can be changed to other name and direct to other screen
     */
    public void touch(int x, int y) 
    {
       
      if(buttonName.equals("Pay")) // case for Payment, more cases can be added later
      {
        if(x > 0 && x < 380 && y > 620 && y < 680)
        {
          try
          {
            FileReader fr = new FileReader("." + "file.json"); //TODO: figure out a way to make it general or the file made from AddCard to store cardInfo should be named specificlly
            fr.close();
          }
          catch(IOException e)
          {
            print(components.size());
            for (IDisplayComponent c: components) {
              c.display();
            }
            //TODO: should go to addcard screen
          }
        }
      }
    }
    
    @Override
    public void addSubComponent( IDisplayComponent c )
    {
        components.add( c ) ; 
    }
}
