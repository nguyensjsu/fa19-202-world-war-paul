/* (c) Copyright 2018 Paul Nguyen. All Rights Reserved */

/**
 * Authentication Proxy for App Controller
 */
public class Device implements IApp, IPinAuthObserver {
    
    private Device theDevice = null;   
    private boolean fourPin = true ;
    private boolean sixPin = false ;
    private String pin = "" ; 

    private IApp app ;
    private KeyPad kp ;
    private Passcode pc ;
    private PinScreen ps ;
    private Spacer sp ;
    private boolean authenticated = false ;
    private PinEntryMachine pm ;

    public static final int screen_frame_header = 3 ;
    public static final int portrait_screen_width = 15 ;
    public static final int portrait_screen_length = 10 ;
    public static final int landscape_screen_width = 32 ;
    public static final int landscape_screen_length = 6 ;

    private int device_orientation_state ;

    public int getDeviceOrientation() {
        return this.device_orientation_state ;
    }

    public void setPortraitOrientation() {
        this.device_orientation_state = 0;
    }

    public void setLandscapeOrientation() {
        this.device_orientation_state = 1;
    }

    private Device() {
    }



    /**
     * Get Current Auth State
     * @return Auth T/F
     */
    public String isAuthenticated() {
        return Boolean.toString( authenticated ) ;
    }    

    /**
     * Return the current Pin Option:
     *  0 = User Chosed No Pin
     *  4 = User Chosed 4-digit Pin
     *  6 = User Chosed 6-digit Pin
     * @return Pin Option
     */
    public int getPinOption() {
        if ( fourPin )
            return 4 ;
        else if ( sixPin )
            return 6 ;
        else
            return 0 ;
    }

    /**
     * Get Current Pin
     * @return Pin
     */
    public String getPin() {
        return pin ;
    }


    /**
     * Set Pin
     * @param p New Pin
     */
    private void setPin( String p ) {
        pin = p ;
        int len = p.length() ;
        switch ( len ) {
            case 0:
                fourPin = false ;
                sixPin = false ;              
            case 4:
                fourPin = true ;
                sixPin = false ;
                break ;
            case 6:
                fourPin = false ;
                sixPin = true ;
                break ;
            default:
                fourPin = false ;
                sixPin = false ;
        }
    }

    /**
     * Device Reset Pin  
     */
    private void clearPin()
    {
        this.pin = "" ;
    }

    /**
     * Get Singleton Instance
     * @return Reference to Current Device Config (Create if none exists)
     */
    public Device getInstance() {
        if (theDevice == null) {
            return getNewInstance( "1234" ) ;
        }
        else
            return theDevice;
    }

    /**
     * Get New Instance 
     * @return Reference to Device (Create New Singleton)
     */
    public Device getNewInstance() {
        return getNewInstance( "1234" ) ;
    }

    public Device getNewInstance( String pin ) {
        theDevice = new Device() ;
        theDevice.setPin( pin ) ;
        theDevice.startUp() ;
        return theDevice ;
    }

    /**
     * Device Starup Process.  
     * Starts Up with Default 4-Pin Option
     */
    public void startUp()
    {
        kp = new KeyPad() ;
        pc = new Passcode() ;
        sp = new Spacer() ;
        ps = new PinScreen() ;
        pm = new PinEntryMachine() ;

        // setup the composite pattern
        ps.addSubComponent( pc ) ;
        ps.addSubComponent( sp ) ;
        ps.addSubComponent( kp ) ;

        // setup the observer pattern
        ((IKeyPadSubject)kp).attach( pc ) ;
        ((IKeyPadSubject)kp).attach( pm ) ;
        ((IPinAuthSubject)pm).registerObserver(this) ;

        // get app controller reference
        app = new AppController() ;        

        // startup in portrait
        this.device_orientation_state = 0;
    }

    /**
    * Switch to Landscape View
    */
    public void landscape() {
        if ( authenticated )
            app.landscape() ;
    }

    /**
     * Switch to Portait View
     */
    public void portrait() {
        if ( authenticated )
            app.portrait() ;
    }

    /**
     * User Touch at X,Y Coordinates
     * @param x X Coordinate
     * @param y Y Coordinate
     */
    public void touch(int x, int y) {
        if ( authenticated )
            app.touch(x, y) ;
        else
            ps.touch(x, y) ;
    }

    /**
     * Display Screen Contents to Terminal
     */
    public void display() {
        System.out.println( screenContents() ) ;
    }

    /**
     * Get Class Name of Screen
     * @return Class Name of Current Screen
     */
    public String screen() {
        if ( authenticated )
            return app.screen() ;
        else
            return ps.name() ;
    }

    /**
     * Get Screen Contents as a String
     * @return Screen Contents of Current Screen
     */
    public String screenContents() {
        if ( authenticated ) {
            return app.screenContents() ;
        } else {
            String out = "" ;
            out = "----------------\n" ;
            out += "   " + ps.name() + "  \n" ;
            out += "----------------\n\n\n" ;
            out += ps.display() ;
            out += "\n\n\n----------------\n" ;
            return out ;
        }
    }


    /**
     * Select a Menu Command
     * @param c Menu Option (A, B, C, E, or E)
     */
    public void execute( String c ) {
        if ( authenticated )
            app.execute( c ) ;
    }

    /**
     * Navigate to Previous Screen
     */
    public void prev() {
        if ( authenticated )
            app.prev() ;
    }

    /**
     * Navigate to Next Screen
     */
    public void next() {
        if ( authenticated )
            app.next() ;
    }

    /**
     * Receive Authenticated Event from Authenticator
     */
    public void authEvent() {
        this.authenticated = true ;
    }



}
