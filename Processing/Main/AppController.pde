/**
 * Main App Controller Class
 */
public class AppController implements IProxy {

    // TODO: Update Screens and Commands

    private IScreen home ;
    private IScreen orderHistory ;
    private IScreen account ;
    private IScreen burgerStore ;
    private IScreen starbucksStore;
    private IMenuCommand displayHome ;
    private IMenuCommand displayOrderHistory ;
    private IMenuCommand displayAccount ;
    private IMenuCommand displayBurgerStore ;
    private IMenuCommand displayStarbucksStore ;
    private IFrame frame ;

    public AppController() {

        home = new HomePageScreen("San Jose State University");
        orderHistory = new OrderHistoryScreen() ;
        account = new MyAccountScreen(20) ;
        burgerStore = new StoreScreen("Attack Burger"); 
        starbucksStore = new StoreScreen("Starbucks");
        
        frame = new Frame( home ) ;

        // Set frame for MenuBar
        home.setFrame(frame);
        orderHistory.setFrame(frame);
        account.setFrame(frame);
        starbucksStore.setFrame(frame);
        burgerStore.setFrame(frame);
        
        // Set the screen flow

        //addCard.setFrame();


        // setup command pattern
        displayOrderHistory  = new MenuCommand() ;
        displayHome = new MenuCommand() ;
        displayAccount  = new MenuCommand() ;
        displayBurgerStore = new MenuCommand() ;
        displayStarbucksStore = new MenuCommand() ;
        
        displayOrderHistory.setReceiver(
          new IMenuReceiver() {
              /** Command Action */
              public void doAction() {
                  frame.setCurrentScreen( orderHistory ) ;
              }
        }
        ) ;
        displayHome.setReceiver(
          new IMenuReceiver() {
              /** Command Action */
              public void doAction() {
                  frame.setCurrentScreen( home ) ;
              }
        }
        ) ;
        displayAccount.setReceiver(
          new IMenuReceiver() {
              /** Command Action */
              public void doAction() {
                  frame.setCurrentScreen( account ) ;
              }
        }
        ) ;
        displayBurgerStore.setReceiver(
          new IMenuReceiver() {
              /** Command Action */
              public void doAction() {
                  frame.setCurrentScreen( burgerStore ) ;
              }
        }
        ) ;
        displayStarbucksStore.setReceiver(
          new IMenuReceiver() {
              /** Command Action */
              public void doAction() {
                  frame.setCurrentScreen( starbucksStore ) ;
              }
        }
        ) ;
      
        frame.setMenuItem ("home", displayHome ) ; // left
        frame.setMenuItem ("order", displayOrderHistory ) ; // middle
        frame.setMenuItem ("account", displayAccount ) ; // right
        frame.setMenuItem ("burgerStore", displayBurgerStore ) ;
        frame.setMenuItem ("starbucksStore", displayStarbucksStore ) ;
    }

    /**
     * Send In Touch Events
     * @param x X Coord
     * @param y Y Coord
     */
    public void touch(int x, int y) {
        frame.touch(x, y) ;
    }

    /**
    * drag method
    */
    public void drag(){
        frame.drag();
    }

    /**
     * Display Current Screen
     */
    public void display() {
        frame.display() ;
    }

    /**
     * Execute Menu Bar Command
     * @param c Menu Bar Option (A, B, C, D or E)
     */
    public void execute( String c ) {
        frame.cmd( c ) ;
    }

    /**
     * Navigate to Previous Screen
     */
    public void prev() {
        //frame.previousScreen() ;
    }

    /**
     * Navigate to Next Screen
     */
    public void next() {
       // frame.nextScreen() ;
    }

    /**
     * Get Current Screen Name
     * @return Screen Name
     */
    public String screen() {
        return frame.screen() ;
    }

}
