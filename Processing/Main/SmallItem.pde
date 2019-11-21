public class SmallItem
{
	double price;
	String name;    

	SmallItem()
	{
		price = 0;
		name = "";
	}
	
	void setPrice(double p)
	{
		price = p;
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
}