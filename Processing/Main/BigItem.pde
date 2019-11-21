public class BigItem
{
	double price;
	ArrayList<SmallItem> smallItemList;  
	String name;  

	public BigItem(String itemName, double itemPrice)
	{
		price = itemPrice;
		smallItemList = new ArrayList<SmallItem>();
		name = itemName;
	}

	/**
	 * return total price 
	 * @return the smallal price
	 */
	public double getPrice()
	{
		if(smallItemList.size() > 0){
			double subtotal = price;
			for(SmallItem entry: smallItemList){
				subtotal += entry.getPrice();
			}
			return subtotal;
		}
		else{
			return price;
		}
	}

	public void addSmallItem(String name, double price)
	{
		SmallItem smallItem = new SmallItem(name, price);
		smallItemList.add(smallItem);
		
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

	public ArrayList<SmallItem> getSmallItem(){
		return smallItemList;
	}
}
