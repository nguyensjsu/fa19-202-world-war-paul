
/* (c) Copyright 2018 Paul Nguyen. All Rights Reserved */


/**
 * Main App Controller Class
 */
public class AppController implements IProxy {

    // TODO: Update Screens and Commands
    private IScreen orderHistory ;
    private IScreen home ;
    //private IScreen account ;
    private IMenuCommand displayOrderHistory ;
    private IMenuCommand displayHome ;
    //private IMenuCommand displayAccount ;
    private IFrame frame ;

    public AppController() {
        orderHistory = new OrderHistoryScreen() ;
        //account = new MyAccountScreen(20) ;
        home = new HomePageScreen("San Jose State University") ;
        frame = new Frame( home ) ;
        //Test order screen
        //frame = new Frame( orderHistory ) ;

        // setup command pattern
        displayOrderHistory  = new MenuCommand() ;
        displayHome = new MenuCommand() ;
        //displayAccount  = new MenuCommand() ;
        
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
        //displayAccount.setReceiver(
        //  new IMenuReceiver() {
        //      /** Command Action */
        //      public void doAction() {
        //          frame.setCurrentScreen( account ) ;
        //      }
        //}
        //) ;
      
        frame.setMenuItem ( "order", displayOrderHistory ) ; // left
        frame.setMenuItem ( "home", displayHome ) ; // middle
        //frame.setMenuItem ( "account", displayAccount ) ; // right
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
        frame.previousScreen() ;
    }

    /**
     * Navigate to Next Screen
     */
    public void next() {
        frame.nextScreen() ;
    }

    /**
     * Get Current Screen Name
     * @return Screen Name
     */
    public String screen() {
        return frame.screen() ;
    }

    /**
     * Get Current Screen Contents
     * @return Current Screen Contents
     */
    public String screenContents() {
        // TODO: home(store) screen pop up
        background(51);
        return frame.contents() ;
    }

}
