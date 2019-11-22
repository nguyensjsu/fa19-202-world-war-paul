/* Error Screen */
public class Header extends Screen implements ITouchEventHandler, IDisplayComponent{

    private String header;
    private ITouchEventHandler nextHandler ;
    private int endHieght = 45;

    public Header(String str){
        this.header = str;
    }

    public void display(){
        textSize(22);
        fill(0);
        textAlign(CENTER);
        text(header, 190, 30);

        // reset text front
        textAlign(LEFT);
        textSize(14);

        strokeWeight(2);
        stroke(0, 0, 0);
        line(0, 45, 380, 45);

        displayPrevButton();

    }

    public void displayPrevButton(){
      if(header.equals("Attack Burger")){
          strokeWeight(1.5);
          line(13, 22.5, 32, 35);
          line(13, 22.5, 32, 10);
      }
      else if(header.equals("Starbucks")){
        strokeWeight(1.5);
        line(13, 22.5, 32, 35);
        line(13, 22.5, 32, 10);
      }
      else if(header.equals("Custom Burger Options")){
        strokeWeight(1.5);
        line(13, 22.5, 32, 35);
        line(13, 22.5, 32, 10);
      }
      else if(header.equals("Custom Starbuck Options")){
        strokeWeight(1.5);
        line(13, 22.5, 32, 35);
        line(13, 22.5, 32, 10);
      }
      else if(header.equals("Add Card")){
        strokeWeight(1.5);
        line(13, 22.5, 32, 35);
        line(13, 22.5, 32, 10);
      }

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
     */
    public void touch(int x, int y){
        // handle prev button, navigate to screen base on current screen
        if(header.equals("Attack Burger") || header.equals("Starbucks")){
            if(y <= endHieght && x <= 40){
                HomePageScreen home = new HomePageScreen("San Jose State University") ;
                setPrev(home);
                prev();
            }
        }
        else if(header.equals("Custom Burger Options")){
            if(y <= endHieght && x <= 40){
                StoreScreen storeScreen = new StoreScreen("Attack Burger");
                setPrev(storeScreen);
                prev();
            }
        }
        else if(header.equals("Custom Starbuck Options")){
            if(y <= endHieght && x <= 40){
                StoreScreen storeScreen = new StoreScreen("Starbucks");
                setPrev(storeScreen);
                prev();
            }
        }
        else if(header.equals("Add Card")){
            if(y <= endHieght && x <= 40){
                MyAccountScreen account = new MyAccountScreen(60) ;
                setPrev(account);
                prev();
            }
        }
        else if (nextHandler != null) {
            nextHandler.touch(x,y);
        }
    }


    /**
     * Setup the current Frame reference
     * @param frame THe frame reference
     */
    public void setFrame(IFrame frame){
        this.frame = frame;
    }

}