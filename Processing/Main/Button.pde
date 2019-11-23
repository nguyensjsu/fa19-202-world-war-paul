/** Button Model */
public class Button extends Screen implements ITouchEventHandler, IDisplayComponent
{
    private ITouchEventHandler nextHandler ;
    private String buttonName;

    // Error Screen reference
    private ErrorScreen err;
    private BasketScreen basketScreen;
    private HomePageScreen homePageScreen;
    private String prevScreen;
    private Map<String, String> cardInfo;

    public Button(String name) {
      	buttonName = name;
        err = new ErrorScreen("Payment Method Is Not Set!");
    }

    public Button(String name, String prev) {
        buttonName = name;
        err = new ErrorScreen("Payment Method Is Not Set!");
        prevScreen = prev;
    }

    /**
     * Display Pay button
     */
    public void display() {
		fill(0, 255, 0, 100);
		rect(0, 620, 380, 60);
		textAlign(CENTER);

		textSize(32);
		fill(255, 255, 255, 255);
		text(buttonName, width/2, 660);
		textAlign(LEFT);
		err.display();
    }

    /**
     * Set Next Touch Handler
     * @param next Touch Event Handler
     */
    public void setNext(ITouchEventHandler next)
    {
        nextHandler = next ;
    }

    /**
     * Touch Event
     * @param x Touch X
     * @param y Touch Y
     * reuseable, can be changed to other name and direct to other screen
     */
    public void touch(int x, int y)
    {
		if(x > 0 && x < 380 && y > 620 && y < 680) // case for Payment, more cases can be added later
		{
			if(buttonName.equals("Pay"))
			{
				System.out.println("Running123123");
				boolean infoNotFound = true;

				Gson gson = new Gson();
				TypeToken<Map<String, String>> token = new TypeToken<Map<String, String>>(){};
				Map<String, String> cardInfo = new HashMap<String, String>();
				try
				{
					FileReader fr = new FileReader("."+File.separator+"cardInfo.json");
					cardInfo = gson.fromJson(fr, token.getType()); // has to be a class type
					
					fr.close();
				}
				catch(IOException e)
				{
					e.printStackTrace();
				}

				if (cardInfo.containsKey("cardNumber") && cardInfo.containsKey("cardExpirty") && cardInfo.containsKey("cardCVV")) {
					infoNotFound = false;
				}

				if (infoNotFound) {
					err = new ErrorScreen("Payment Method Is Not Set!");
					err.setTimer(millis()+ 1000); // 1000 = 1 second
					err.setFlag(true); // display error message
				} else {
					// TODO jump to order result screen
				}
			}
			else if(buttonName.equals("View Basket")) // case for Payment, more cases can be added later
			{
                ArrayList<Order>currentOrder = deserialization("optionScreenDetail.json");
                if (currentOrder.size() == 0){
                    err = new ErrorScreen("No Item in Basket Yet.");
                    err.setTimer(millis()+ 1000); // 1000 = 1 second
                    err.setFlag(true); // display error message
                }
                else{
					basketScreen = new BasketScreen(prevScreen);
					basketScreen.setFrame(frame);
					setNext(basketScreen);
					next();
                }
			}
            else if(buttonName.equals("Save Payment Method")) 
            {
                println("In the right spot");
                if(cardInfo.containsKey("cardCVV"));
                {
                    println("Correct");
                }
                serialization(cardInfo, "cardInfo.json");
                frame.cmd("home");
            }
		}
		else if (nextHandler != null) {
			nextHandler.touch(x,y);
		}
    }

    /**
     * Add Display Component to Screen
     * @param c Display Component
     */
    @Override
    public void addSubComponent( IDisplayComponent c ) {}

	/**
	 * Set up the error message screen
	 */
	public void setErrorMessage(ErrorScreen e) {
		err = e;
	}

	/**
	 * Setup the current Frame reference
	* @param frame THe frame reference
	*/
	public void setFrame(IFrame frame){
		this.frame = frame;
	}

	public void setCardInfo(Map<String, String> map)
	{
		cardInfo = map;
	}
}
