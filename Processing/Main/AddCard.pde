/* (c) Copyright 2018 Paul Nguyen. All Rights Reserved */


/**
 * Add New Card Screen
 */
private final static int width = 380;

public class AddCard extends Screen
{
    KeyPad kp = new KeyPad();
    StringBuilder cn = new StringBuilder("");
    StringBuilder ce = new StringBuilder("");
    StringBuilder cvv = new StringBuilder("");
    boolean cardNumberFlag;
    boolean cardExpirtyFlag;
    boolean cardCVVFlag;
    
    public AddCard()
    {
      cardNumberFlag = true;
      cardExpirtyFlag = false;
      cardCVVFlag = false;
    }
    
    public String name()
    {
      return "AddCard";
    }
    
    public String display()
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
      fill(0, 0, 0, 100);
      text("Card Number", 10, 90); // Card Number text
      
      textAlign(LEFT);
      textSize(25); 
      fill(0, 0, 0, 100);
      text(cn.toString(), 30, 115); // Card Number
      
      strokeWeight(3);
      stroke(0, 0, 0);// black stroke line
      line(30, 120, 350, 120); // Line under Card Number
      
      textAlign(LEFT);
      textSize(25); 
      fill(0, 0, 0, 100);
      text("Expirty", 10, 150); // Card Expirty title
      
      textAlign(LEFT);
      textSize(25); 
      fill(0, 0, 0, 100);
      text(ce.toString(), 30, 175); // Card Expirty
      
      strokeWeight(3);
      stroke(0, 0, 0);// black stroke line
      line(30, 180, 150, 180); // Line under Card Expirty
      
      textAlign(LEFT);
      textSize(25); 
      fill(0, 0, 0, 100);
      text("CVV", 200, 150); // Card CVV title 
      
      textAlign(LEFT);
      textSize(25); 
      fill(0, 0, 0, 100);
      text(cvv.toString(), 200, 175); // Card Expirty
      
      strokeWeight(3);
      stroke(0, 0, 0);// black stroke line
      line(200, 180, 350, 180); // Line under Card Expirty
      
      kp.display();
      
      rect(0, 620, 380, 60);
      textAlign(CENTER);
      textSize(32); 
      fill(0, 0, 0, 100);
      text("Save Payment Method", width/2, 660); // Add Card Title
      System.out.print("AddCard Touched " + mouseX + " " + mouseY + "\n");
      return "This is Add Card Display";
    }
    
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
        
      if((cardNumberFlag && cn.length() < 16) || (cardNumberFlag 
                            && y >= 530 && y <= 590 && x >= 265 && x <= 325))
      {
        inputTouch(cn, x, y, "cn");
      }
      else if((cardExpirtyFlag && ce.length() < 4) || (cardExpirtyFlag 
                            && y >= 530 && y <= 590 && x >= 265 && x <= 325))
      {
        inputTouch(ce, x, y, "ce");
      }
      else if((cardCVVFlag && cvv.length() < 3) || (cardCVVFlag 
                            && y >= 530 && y <= 590 && x >= 265 && x <= 325))
      {
        inputTouch(cvv, x, y, "cvv");
      }
    }
    
    public void next()
    {
      /**TODO: 
      press save payment to go back to home
      add card info to database
      if card is not valid, do nothing
      */
    }
    
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
          if(section.equals("cn") && cn.length() > 0)
          {
            print("Delete by one \n");
            cn.setLength(cn.length() -1);
          }
          else if(section.equals("ce") && ce.length() > 0)
          {
            ce.setLength(ce.length() -1);
          }
          else if(section.equals("cvv") && cvv.length() > 0)
          {
            cvv.setLength(cvv.length() -1);
          }
        }
      }
    }
    
}
