/** Payments Screen */
public class LeftItem extends Screen implements IDisplayComponent,  ITouchEventHandler
{
    private ITouchEventHandler nextHandler ;
    private OptionScreen optionScreen;
    private PShape optionImg1;
    private PShape optionImg2;
    
    private String name;
    private float price;
    private int curHeight;
    private boolean isSelected; 

    public LeftItem(String n, float p, int h)
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
            addNewOrder("optionScreenDetail.json");
            isSelected = (isSelected == true) ? false : true;
			display();
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

	// TODO: delele later
    public double getPrice(){
      	return price;
    }

    /**
     * Store user input as map and out put json file and timeline
     * @param filename the store input into file name
     */
    public void addNewOrder(String filename){

		File orderFile = new File("." + File.separator + filename);
		ArrayList<Order> orderList = deserialization(filename); //reread userinput from storeScreen
		
		if (orderList.size() > 0) {
            Order currentOrder = orderList.get(orderList.size() - 1);
            ArrayList<BigItem> itemList = currentOrder.getBigItemList();
            if (itemList.size() > 0) {
                BigItem currentItem = itemList.get(itemList.size() - 1);
                SmallItem newItem = new SmallItem(name, price);
		        currentItem.addSmallItem(newItem);
                itemList.set(orderList.size() - 1, currentItem);
            }
            currentOrder.updatePrice();
            orderList.set(orderList.size() - 1, currentOrder);
        } 
		// Put orderList back into local file.
        serialization(orderList, filename);
    }
}
