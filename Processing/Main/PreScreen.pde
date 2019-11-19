/* Welcome Screen */
public class WelcomeScreen extends Screen {

    private int startHeight;
    private int endHeight;
    private int startWidth;
    private int endWidth;
    private int time;
    private boolean display;
    private PImage image;

    public WelcomeScreen(){
        startHeight = 0;
        endHeight = 680;
        startWidth = 0;
        endWidth = 380;
		image = loadImage("../../img/preScreen/preScreen.png");
		display = true;
	}
	
	/**
	 * Display welcome screen.
	 */
    public void display() {
		time = 2 - (int)millis()/1000;
		if (0 <= time){
			image(image, startHeight, startWidth, endWidth, endHeight);  
		} else {
			display = false;
		}
	}
	
    /**
     * Touch Event
     * @param x Touch X
     * @param y Touch Y
     */
    public void touch(int x, int y){
		if (x > 0 && x < 380 && y > 0 && y < 680)
		{
			display = false;
		}
	}
	
	/**
	 * Set the display for display options
	 * @return display
	 */
    public boolean isDisplay()
    {
      	return display;
    }
}
