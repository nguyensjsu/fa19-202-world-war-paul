public class SmallItem
{
	double price;
	String name;    

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

	public String getName(){
		return name;
	}     
}