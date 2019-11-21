public class Order
{
	private int orderNumber;
	double price;
	String storeName;
	ArrayList<BigItem> bigItemList;
	double serviceFee;
	double tax;

	public Order(String n)
	{
		price = 0;
		orderNumber = 0;
		storeName = n;
		bigItemList = new ArrayList<BigItem>();
	}
	
	public void setPrice(double p)
	{
		price = p;
	}

	public ArrayList<BigItem> getBigItem()
	{
		return bigItemList;
	}

	/**
	 * return total price 
	 * @return the total price
	 */
	public double getPrice()
	{
		if(bigItemList.size()>0){
			double subtotal = 0.0;  //recalculate require hard reset
			for(BigItem entry: bigItemList){
				subtotal += entry.getPrice();
			}
			price = subtotal;
		}
		return price;
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
		
		price = getPrice(); //update price is required
	}

	/**
	 * Add small item into the order
	 * @param name = Item name
	 * @param price = Item price
	 */
	public void addSmallItem(String name, double price)
	{
		SmallItem smallItem = new SmallItem(name, price);
		
		//add the small item to the latest BigItem
		BigItem latestBigItem = bigItemList.get(bigItemList.size()-1);
		latestBigItem.addSmallItem(name, price);

		price = getPrice(); //update price is required
	}
	
	//debug purpose
	public void print(){
		System.out.println("first big item is "+ bigItemList.get(orderNumber).getName());
		System.out.println("first big item is "+bigItemList.get(orderNumber).getPrice());
	}

	public String getStoreName()
	{
		return storeName;
	}

	public double getServiceFee()
	{
		serviceFee = price * 0.15;
		return serviceFee;
	}

	public double getTax()
	{
		tax = price * 0.1;
		return tax;
	}

	public double getTotalPrice()
	{
		return price *(1 + 0.1 + 0.15);
	}
}
