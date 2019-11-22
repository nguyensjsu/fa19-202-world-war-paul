/** Payments Screen */
public class OptionItem extends Screen implements IDisplayComponent, ITouchEventHandler
{
    private ITouchEventHandler nextHandler ;
    PShape optionImg1;
    PShape optionImg2;
    private OptionScreen optionScreen;

    String name;
    double price;
    int curHeight;
    boolean isSelected;
    String storeName;

    public OptionItem(String sName, String itemName, double p, int h)
    {
		storeName = sName;
        name = itemName;
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
			addNewOrder(storeName, "optionScreenDetail.json");
          	isSelected = (isSelected == true) ? false : true;
			display();

			// Reset
			unselected();

      if (name.indexOf("Burger") != -1){
         optionScreen = new OptionScreen("Custom Burger Options", name);
       }
       else{
         optionScreen = new OptionScreen("Custom Starbuck Options", name);
       }

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
    public void unselected() {
      	isSelected = false;
    }

    // TODO: delele later
    public double getPrice(){
      	return price;
    }

    /**
     * Store user input as map and out put json file and timeline
     * @param filename the store input into file name
     */
    public void addNewOrder(String storeName, String filename){

		System.out.println("Running");
		File orderFile = new File("." + File.separator + filename);
		ArrayList<Order> orderList = deserialization(filename); //reread userinput from storeScreen

		if (orderList.size() > 0) {
			Order currentOrder = orderList.get(orderList.size() - 1);
			BigItem newItem = new BigItem(name, price);
			currentOrder.addBigItem(newItem);
			currentOrder.updatePrice();
            orderList.set(orderList.size() - 1, currentOrder);
		} else {
			Order currentOrder = new Order();
			BigItem newItem = new BigItem(name, price);
			currentOrder.addBigItem(newItem);
			currentOrder.setStoreName(storeName);
			orderList.add(currentOrder);
		}

		// Put orderList back into local file.
        serialization(orderList, filename);
    }
}
