/* (c) Copyright 2018 Paul Nguyen. All Rights Reserved */
/**
 * Add New Card Screen
 */

private final static int width = 380;

public class AddCard extends Screen
{
    KeyPad keypad = new KeyPad();
    StringBuilder cardNumber = new StringBuilder("");
    StringBuilder cardExpirty = new StringBuilder("");
    StringBuilder cvv = new StringBuilder("");
    boolean cardNumberFlag;
    boolean cardExpirtyFlag;
    boolean cardCVVFlag;
    Map <String, String> cardInfo = new HashMap<String, String>();

     /**
     * Constructor
     * Setting three flags for different focus
     */
    public AddCard()
    {
      cardNumberFlag = true;
      cardExpirtyFlag = false;
      cardCVVFlag = false;
    }
    /**
     * Display
     * display the UI of addcard and the button
     */
    public void display()
    {
      background(255,255,255);
      textAlign(CENTER);
      textSize(32); 
      fill(0, 0, 0, 100);
      text("Add Card", width/2, 50); // Add Card Title
      
      strokeWeight(3);
      stroke(0, 0, 0);
      line(0, 60, 380, 60); // Line under title
      
      textAlign(LEFT);
      textSize(25); 
      text("Card Number", 10, 90); // Card Number text
       
      text(cardNumber.toString(), 30, 115); // Card Number
      
      line(30, 120, 350, 120); // Line under Card Number
      
      text("Expirty", 10, 150); // Card Expirty title
      
      text(cardExpirty.toString(), 30, 175); // Card Expirty
      
      line(30, 180, 150, 180); // Line under Card Expirty
      
      text("CVV", 200, 150); // Card CVV title 

      text(cvv.toString(), 200, 175); // Card Expirty
      
      line(200, 180, 350, 180); // Line under Card Expirty
      
      keypad.display();
      
      rect(0, 620, 380, 60);
      textAlign(CENTER);
      textSize(32); 
      text("Save Payment Method", width/2, 660); // Add Card Title
      
      textAlign(LEFT);

    }
    /**
     * Touch
     * @param x, y int for taking the mouseX and mouseY
     * touch different button will get different result
     * save cardInfo to local json file
     */
    public void touch(int x, int y)
    {
      
      if(x > 10 && x < 130 && y > 80 && y < 100)
      {
        cardNumberFlag = true;
        cardExpirtyFlag = false;
        cardCVVFlag = false;
      }
      else if( x > 10 && x < 80 && y > 120 && y < 140)
      {
        cardNumberFlag = false;
        cardExpirtyFlag = true;
        cardCVVFlag = false;
      }
      else if( x > 120 && x < 300 && y > 120 && y < 140)
      {
        cardNumberFlag = false;
        cardExpirtyFlag = false;
        cardCVVFlag = true;
      }
      else if(x > 0 && x < 380 && y > 620 && y < 680)
      {
        if(cardNumber.length() == 16 && cardExpirty.length() == 4 && cvv.length() == 3)
        {
          cardInfo.put("cardNumber", cardNumber.toString());
          cardInfo.put("cardExpirty", cardExpirty.toString());
          cardInfo.put("cardCVV", cvv.toString());
          serialization(cardInfo, "cardInfo.json");
          frame.cmd("home");
        }
      }
        
      if(cardNumberFlag && (cardNumber.length() < 16 || (y >= 530 && y <= 590 && x >= 265 && x <= 325)))
      {
        inputTouch(cardNumber, x, y, "cardNumber");
      }
      else if(cardExpirtyFlag && (cardExpirty.length() < 4 || (y >= 530 && y <= 590 && x >= 265 && x <= 325)))
      {
        inputTouch(cardExpirty, x, y, "cardExpirty");
      }
      else if(cardCVVFlag && (cvv.length() < 3 || (y >= 530 && y <= 590 && x >= 265 && x <= 325)))
      {
        inputTouch(cvv, x, y, "cvv");
      }
      
    }
     /**
     * Next
     * go to next, Home screen
     */
   public void next() {
       super.next();
    }
     /**
     * inputTouch
     * @param input, x, y, section. Taking input as stringbuilder for cardNumber, cardExpirty, CVV and section name
     * touch for add number to cardNumber, cardExpirty and CVV 
     * go to next, Home screen
     */
    public void inputTouch(StringBuilder input, int x, int y, String section)
    {
      if(x >= 55 && x <= 115)
      {
        if(y >= 230 && y <= 290)
        {
          input.append("1");
        }
        else if(y >= 330 && y <= 390)
        {
          input.append("4");
        }
        else if(y >= 430 && y <= 490)
        {
          input.append("7");
        }
      }
      else if(x >= 160 && x <= 220)
      {
        if(y >= 230 && y <= 290)
        {
          input.append("2");
        }
        else if(y >= 330 && y <= 390)
        {
          input.append("5");
        }
        else if(y >= 430 && y <= 490)
        {
          input.append("8");
        }
        else if(y >= 530 && y <= 590)
        {
          input.append("0");
        }
      }
      else if(x >= 265 && x <= 325)
      {
        if(y >= 230 && y <= 290)
        {
          input.append("3");
        }
        else if(y >= 330 && y <= 390)
        {
          input.append("6");
        }
        else if(y >= 430 && y <= 490)
        {
          input.append("9");
        }
        else if(y >= 530 && y <= 590)
        {
          if(section.equals("cardNumber") && cardNumber.length() > 0)
          {
            print("Delete by one \n");
            cardNumber.setLength(cardNumber.length() -1);
          }
          else if(section.equals("cardExpirty") && cardExpirty.length() > 0)
          {
            cardExpirty.setLength(cardExpirty.length() -1);
          }
          else if(section.equals("cvv") && cvv.length() > 0)
          {
            cvv.setLength(cvv.length() -1);
          }
        }
      }
    }
    
     public void setFrame(IFrame frame) {
       super.setFrame(frame);
    };
    
}
