public class BigItem
{
	String name;
	double price;
	double smallItemPrice;
	ArrayList<SmallItem> smallItem = new ArrayList<SmallItem>();    

	BigItem()
	{
		price = 0;
		name = "";
		smallItemPrice = 0;
	}
	
	void setPrice(double p)
	{
		price = p;
	}

	void addSmallItem(SmallItem item)
	{
		println("added something to big item");
		smallItem.add(item);
	}

	void setName(String n)
	{
		name = n;
	}

	double getPrice()
	{
		return price;
	}

	String getName()
	{
		return name;
	}

	void calculateSmallItemPrice()
	{
		println("Small item array size is " + smallItem.size());
		for(int i = 0; i < smallItem.size(); i++)
		{
			smallItemPrice += smallItem.get(i).getPrice();
		}
		println("Small item price is " + smallItemPrice);
	}

	double getSmallItemPrice()
	{
		return smallItemPrice;
	}

	ArrayList<SmallItem> getSmallItem()
	{
		return smallItem;
	}
}
