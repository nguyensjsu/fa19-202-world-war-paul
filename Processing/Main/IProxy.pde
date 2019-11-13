/* (c) Copyright 2018 Paul Nguyen. All Rights Reserved */


/**
 * App Interface -- Actions Users can Take.
 */
public interface IProxy
{        

    /**
     * Send touch event to current screen
     * @param x Touch at X Coord
     * @param y Touch at Y Coord
     */
    void touch(int x, int y) ;  


    /**
    * drag command
    */ 
    void drag();

    /**
     * Display contents of current screen
     */
    void display() ;       

    /**
     * Trigger a nav bar menu item
     * @param c A, B, C, D or E
     */
    void execute( String c ) ;  

    /**
     * Navigate to previous screen
     */
    void prev() ;               

    /**
     * Navigate to next screen
     */
    void next() ;

    /**
     * Get Screen Name
     * @return Screen Name
     */
    String screen() ;           

    /**
     * Get Screen Contents
     * @return Screen Content
     */
    String screenContents() ;   

}
