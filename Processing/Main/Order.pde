public class Order
{
	int  orderNumber;
	double price;
	String storeName;
	ArrayList<BigItem> bigItem = new ArrayList<BigItem>();

	Order()
	{
		orderNumber = 0;
		price = 0;
		storeName = "";	
	}

	void setOrderNumber(int n)
	{
		 orderNumber = n;
	}

	void addBigItem(BigItem item)
	{
		bigItem.add(item);
	}

	void setStoreName(String n)
	{
		storeName = n;
	}

	int getOrderNumber()
	{
		return orderNumber;
	}

	void calculatePrice()
	{
		for(int i = 0; i < bigItem.size(); i++)
		{
			price += bigItem.get(i).getSmallItemPrice();
			price += bigItem.get(i).getPrice();
		}
		println("Big Item price is " + price);
	}

	void setPrice(double p)
	{
		price = p;
	}

	double getPrice()
	{
		return price;
	}

	String getStoreName()
	{
		return storeName;
	}

	ArrayList<BigItem> getBigItem()
	{
		return bigItem;
	}
}
