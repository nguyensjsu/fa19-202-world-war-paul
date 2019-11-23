/** Store Model */
public class Store extends Screen implements ITouchEventHandler, IDisplayComponent
{
    private ITouchEventHandler nextHandler ;

    private PImage image;
    private String name;
    private String address;
    private String hours;
    private int startHeight;
    private int endHieght;
    private StoreScreen storeScreen;
    private Map<String, String> map;

    public Store(String imagePath, String name, String address, String hours, int height) {
        image = loadImage(imagePath);
        this.name = name;
        this.address = address;
        this.hours= hours;
        startHeight = height;

        map = new HashMap<String, String>();
        map.put("Attack Burger", "Starbucks");
        map.put("Starbucks", "Attack Burger");
    }

    /**
     * Display store screen
     */
    public void display() {

        int startingWidth = 10;
        int currentHeight = startHeight;

        image(image, startingWidth, currentHeight, 360, 150);
        currentHeight += 170;
        text(name, startingWidth, currentHeight);
        currentHeight += 20;
        text(address, startingWidth, currentHeight);
        currentHeight += 20;
        text(hours, startingWidth, currentHeight);
        currentHeight += 20;

        endHieght = currentHeight;
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
        if (startHeight <= y && y <= endHieght) {
            storeScreen = new StoreScreen(name);

            // Reset Order if user is trying to order food from different stores.
            resetOrder(name, "optionScreenDetail.json");

            setNext(storeScreen);
            next();
            System.out.println("Jump into" + name);
        } else if (nextHandler != null) {
            nextHandler.touch(x,y);
        }

    }

    /**
     * Setup the current Frame reference
     * @param frame THe frame reference
     */
    public void setFrame(){
        frame = getFrame();
        storeScreen.setFrame(frame);
    }

    /**
     * Reset Order from the current order
     * @param storeName the store name
     * @param filename the file name
     */
    public void resetOrder(String storeName, String filename) {

        File orderFile = new File("." + File.separator + filename);
        ArrayList<Order> orderList = deserialization(filename); //reread userinput from storeScreen

        if (orderList.size() > 0) {
            Order currentOrder = orderList.get(orderList.size() - 1);
            if (map.get(currentOrder.getStoreName()).equals(storeName)) {
                currentOrder.resetBigItem();
            }
            currentOrder.updatePrice();
            orderList.set(orderList.size() - 1, currentOrder);
        }
        // Put orderList back into local file.
        serialization(orderList, filename);
    }
}
