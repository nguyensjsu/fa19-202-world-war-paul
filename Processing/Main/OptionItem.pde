/** Payments Screen */
public class OptionItem extends Screen implements IDisplayComponent,  ITouchEventHandler
{
    private ITouchEventHandler nextHandler ;
    PShape optionImg1;
    PShape optionImg2;
    private OptionScreen optionScreen;

    String name;
    float price;
    int curHeight;
    boolean isSelected; 

    public OptionItem(String n, float p, int h)
    {
        name = n;
        price  = p;
        curHeight = h;
        isSelected = false;
        optionImg1 = loadShape("../../img/customItem/option1.svg");  //file destination for file name ad-solid.svg
        optionImg2 = loadShape("../../img/customItem/option2.svg");  //file destination for file name ad-solid.svg
    }

    /** 
      * Display function
      * @return: currently useless
      */ 
    public void display(){
        //Add a white rectangular to avoid repeat writing string
        fill(255);   
        stroke(255); 
        rectMode(CORNER); 
        rect(20,curHeight,360,20); 

        shape(isSelected ? optionImg2 : optionImg1, 20, curHeight, 20, 20);
        textSize(14);
        fill(0);
        text(name, 45, curHeight + 15);

        if (price != 0){
         	text("$"+price, 320, curHeight + 15);
        }
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
     */
    public void touch(int x, int y) 
    {
        if (curHeight <= y && y <= curHeight+25) {
            isSelected = (isSelected == true) ? false : true;
			display();

			optionScreen = new OptionScreen("Choose Custom Options");
            optionScreen.setFrame(frame);
            setNext(optionScreen);
			next();
        } else if (nextHandler != null) {
            nextHandler.touch(x,y);
        }
    }

    /**
     * add price back
	 * @return the price
     */
    public double add(){
		if(isSelected){
			return price;
		}
		else{
			return 0.0;
		}
    }

    /**
     * return the name to print
	 * @return the name of the title
     */
    public String title(){
		if (isSelected){
			return name;
		}
		else
			return "";
    }

    /**
      * reset the selected button to unselected
      */
    public void unselected(){
      isSelected = false;
    }
}
