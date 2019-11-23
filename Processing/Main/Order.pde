public class Order
{
	private int orderNumber;
	private double tax;
	private double price;
	private double serviceFee;
	private String storeName;
	private ArrayList<BigItem> bigItemList;

	public Order()
	{
		price = 0;
		orderNumber = 0;
		bigItemList = new ArrayList<BigItem>();
	}

	/**
	* set StoreName
	*/
	public void setStoreName(String name){
		storeName = name;
	}

	/**
	* return totalPrice
	* @return totalPrice include tax and service fee
	*/
	public double getTotalPrice()
	{
		return price *(1 + 0.1 + 0.15);
	}

	/**
	 * return price that do not include tax service
	 * @return the price that do not include tax service
	 */
	public double getPrice()
	{
		return price;
	}

	/**
	 * udpate price everytime adding a new big or small item
	 */
	public void updatePrice(){
		double subtotal = 0.0;  //recalculate require hard reset
		for(BigItem entry: bigItemList){
			subtotal += entry.getTotalPrice();
		}
		price = subtotal;

		tax = getTax();
		serviceFee = getServiceFee();
	}


	/**
	 * return the latest item total price
	 * @return the total price
	 */
	public double getLatestPrice()
	{
		double totalPrice = 0.0;
		if (bigItemList.size() > 0) {
			totalPrice = bigItemList.get(bigItemList.size()-1).getPrice();
		}
		return totalPrice;
	}

	/**
	 * Add Big item into the order
	 * @param name = Item name
	 * @param price = Item price
	 */
	public void addBigItem(BigItem bigItem)
	{
		bigItemList.add(bigItem);
		updatePrice(); //update price is required
	}

	/**
	 * Add small item into the order
	 * @param name = Item name
	 * @param price = Item price
	 */
	public void addSmallItem(SmallItem smallItem)
	{		
		//add the small item to the latest BigItem
		if (bigItemList.size() > 0) {
			BigItem latestBigItem = bigItemList.get(bigItemList.size()-1);
			latestBigItem.addSmallItem(smallItem);
			updatePrice();
		}
	}

	/**
	* return Storename
	* @return Storename
	*/
	public String getStoreName()
	{
		return storeName;
	}

	/**
	* return serviceFee
	* @return serviceFee
	*/
	public double getServiceFee()
	{
		serviceFee = price * 0.15;
		return serviceFee;
	}

	/**
	* return tax
	* @return tax
	*/
	public double getTax()
	{
		tax = price * 0.1;
		return tax;
	}

	/**
	 * return a list of big Item
	 * @return a list of big Item
	 */
	public ArrayList<BigItem> getBigItemList()
	{
		return bigItemList;
	}

	/**
	 * Reset Big Item
	 */
	public void resetCurrentBigItem() {
		if (bigItemList.size() > 0) {
			bigItemList.remove(bigItemList.size() - 1);
		}
	}

	/**
	 * Reset Big Item
	 */
	public void resetBigItem() {
		bigItemList = new ArrayList<BigItem>();
	}
}
