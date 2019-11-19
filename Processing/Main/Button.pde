/** Button Model */
public class Button extends Screen implements ITouchEventHandler, IDisplayComponent
{
    private ITouchEventHandler nextHandler ;
	private String buttonName;

	// Error Screen reference
	private ErrorScreen err;

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
				File file = new File("." + "file.json"); //TODO: figure out a way to make it general or the file made from AddCard to store cardInfo should be named specificlly
				boolean exists = file.exists();
				if (exists) {
					// TODO: jump to orderResultScreen
				} else {
					err.setTimer(millis()+ 1000); // 1000 = 1 second
					err.setFlag(true); // display error message
				}
			}
		} else if (nextHandler != null) {
			nextHandler.touch(x,y);
		}
    }
    
    /**
     * Add Display Component to Screen
     * @param c Display Component
     */
    @Override
    public void addSubComponent( IDisplayComponent c ) {}
	
	/**
	 * Set up the error message screen
	 */
	public void setErrorMessage(ErrorScreen e) {
		err = e;
	}
}
