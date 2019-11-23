public class BigItem
{
	private double price;
	private ArrayList<SmallItem> smallItemList;
	private String name;
	private double total;

	public BigItem(String itemName, double itemPrice)
	{
		price = itemPrice;
		smallItemList = new ArrayList<SmallItem>();
		name = itemName;
		total = 0.0;
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
	public double getTotalPrice(){
		total = price;
		for (SmallItem item : smallItemList) {
			total += item.getPrice();
		}
		return total;
	}

	/**
	 * add Small Item
	 * @param SmallItem
	 */
	public void addSmallItem(SmallItem smallItem)
	{
		smallItemList.add(smallItem);
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

	/**
	 * Reset Small Item
	 */
	public void resetSmallItem() {
		smallItemList = new ArrayList<SmallItem>();
	}
}
