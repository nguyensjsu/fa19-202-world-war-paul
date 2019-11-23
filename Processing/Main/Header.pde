/* Error Screen */
public class Header extends Screen implements ITouchEventHandler, IDisplayComponent{

    private String header;
    private ITouchEventHandler nextHandler ;
    private int endHieght = 45;

    private String prevScreen;

    public Header(String str){
        this.header = str;
    }

    public Header(String str, String prev){
        this.header = str;
        this.prevScreen = prev;
    }

    public void display(){
        textSize(22);
        fill(0);
        textAlign(CENTER);
        text(header, 190, 30);

        // reset text front
        textAlign(LEFT);
        textSize(14);

        strokeWeight(2);
        stroke(0, 0, 0);
        line(0, 45, 380, 45);

        displayPrevButton();
    }

    public void displayPrevButton(){
        if(header.equals("Attack Burger")){
            strokeWeight(1.5);
            line(13, 22.5, 32, 35);
            line(13, 22.5, 32, 10);
        }
        else if(header.equals("Starbucks")){
            strokeWeight(1.5);
            line(13, 22.5, 32, 35);
            line(13, 22.5, 32, 10);
        }
        else if(header.equals("Custom Burger Options")){
            strokeWeight(1.5);
            line(13, 22.5, 32, 35);
            line(13, 22.5, 32, 10);
        }
        else if(header.equals("Custom Starbuck Options")){
            strokeWeight(1.5);
            line(13, 22.5, 32, 35);
            line(13, 22.5, 32, 10);
        }
        else if(header.equals("Add Card")){
            strokeWeight(1.5);
            line(13, 22.5, 32, 35);
            line(13, 22.5, 32, 10);
        }
        else if(header.equals("Basket")){
            strokeWeight(1.5);
            line(13, 22.5, 32, 35);
            line(13, 22.5, 32, 10);
        }else if(header.equals("Order Result")){
            strokeWeight(1.5);
            line(13, 22.5, 32, 35);
            line(13, 22.5, 32, 10);
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
    public void touch(int x, int y){
        // handle prev button, navigate to screen base on current screen
        if (y <= endHieght && x <= 40) {
            if(header.equals("Attack Burger") || header.equals("Starbucks")|| header.equals("Order Result")){
                HomePageScreen home = new HomePageScreen("San Jose State University") ;
                setPrev(home);
                prev();
            }
            else if(header.equals("Custom Burger Options")){
                StoreScreen storeScreen = new StoreScreen("Attack Burger");
                setPrev(storeScreen);
                resetBigItem("optionScreenDetail.json");
                prev();
            }
            else if(header.equals("Custom Starbuck Options")){
                StoreScreen storeScreen = new StoreScreen("Starbucks");
                setPrev(storeScreen);
                resetSmallItem("optionScreenDetail.json");
                prev(); 
            }
            else if(header.equals("Add Card")){
                MyAccountScreen account = new MyAccountScreen(60) ;
                setPrev(account);
                prev();
            }
            else if(header.equals("Basket")){
                if(prevScreen != null){
                    StoreScreen storeScreen = new StoreScreen(prevScreen);
                    setPrev(storeScreen);
                    prev();
                }
            }
        }
        else if (nextHandler != null) {
            nextHandler.touch(x,y);
        }
    }

    /**
     * Setup the current Frame reference
     * @param frame THe frame reference
     */
    public void setFrame(IFrame frame){
        this.frame = frame;
    }

    /**
     * Reset Small Item from the current order
     * @param filename the file name
     */
    public void resetSmallItem(String filename) {
        File orderFile = new File("." + File.separator + filename);
		ArrayList<Order> orderList = deserialization(filename); //reread userinput from storeScreen
		
		if (orderList.size() > 0) {
            Order currentOrder = orderList.get(orderList.size() - 1);
            ArrayList<BigItem> itemList = currentOrder.getBigItemList();
            if (itemList.size() > 0) {
                BigItem currentItem = itemList.get(itemList.size() - 1);
                currentItem.resetSmallItem();
                itemList.set(orderList.size() - 1, currentItem);
            }
            currentOrder.updatePrice();
            orderList.set(orderList.size() - 1, currentOrder);
        } 
		// Put orderList back into local file.
        serialization(orderList, filename);
    }

    /**
     * Reset Big Item from the current order
     * @param filename the file name
     */
    public void resetBigItem(String filename) {
        File orderFile = new File("." + File.separator + filename);
		ArrayList<Order> orderList = deserialization(filename); //reread userinput from storeScreen
		
		if (orderList.size() > 0) {
            Order currentOrder = orderList.get(orderList.size() - 1);
            currentOrder.resetCurrentBigItem();
            currentOrder.updatePrice();
            orderList.set(orderList.size() - 1, currentOrder);
        } 
		// Put orderList back into local file.
        serialization(orderList, filename);
    }
}
