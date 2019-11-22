public class SmallItem
{
	private double price;
	private String name;    

	public SmallItem(String itemName, double itemPrice)
	{
		price = itemPrice;
		name = itemName;
	}

	/**
	 * return total price 
	 * @return the smallal price
	 */
	public double getPrice()
	{
		return price;
	}

	/**
	* return name
	* @return name of Small Item
	*/
	public String getName(){
		return name;
	}     
}