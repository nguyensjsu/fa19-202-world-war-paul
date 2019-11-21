public class BigItem
{
	private double price;
	private ArrayList<SmallItem> smallItemList;  
	private String name;  

	public BigItem(String itemName, double itemPrice)
	{
		price = itemPrice;
		smallItemList = new ArrayList<SmallItem>();
		name = itemName;
	}

	/**
	 * return total price 
	 * @return sum of the small item price
	 */
	public double getPrice()
	{
		return price;
	}

	/**
	 * update Price after adding new item
	 */ 
	public void updatePrice(){
		//just add the latest small item
		price += smallItemList.get(smallItemList.size()-1).getPrice();
	}

	/**
	 * add Small Item
	 * @param SmallItem
	 */
	public void addSmallItem(SmallItem smallItem)
	{
		smallItemList.add(smallItem);
		updatePrice();

		//debug purpose
		//System.out.println("small item name is: "+smallItem.getName());
		//System.out.println("small item price is: "+smallItem.getPrice());
	}

	/**
	 ＊ return name
	 * @return name of big item
	 */
	public String getName(){
		return name;
	}

	/**
	 * return a list of small Item
	 * @return a list of small Item
	 */
	public ArrayList<SmallItem> getSmallItemList(){
		return smallItemList;
	}
}
