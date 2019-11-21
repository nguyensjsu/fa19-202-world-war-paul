public class Order
{
	private int orderNumber;
	double price;
	String storeName;
	ArrayList<BigItem> bigItemList;
	double serviceFee;
	double tax;

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
			subtotal += entry.getPrice();
		}
		price = subtotal;
	}


	/**
	 * return the latest item total price
	 * @return the total price
	 */
	public double getLatestPrice()
	{
		return bigItemList.get(bigItemList.size()-1).getPrice();
	}

	/**
	 * Add Big item into the order
	 * @param name = Item name
	 * @param price = Item price
	 */
	public void addBigItem(String name, double price)
	{
		BigItem bigItem = new BigItem(name, price);
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
		BigItem latestBigItem = bigItemList.get(bigItemList.size()-1);
		latestBigItem.addSmallItem(smallItem);

		updatePrice();
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
}
