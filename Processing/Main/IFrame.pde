/* (c) Copyright 2018 Paul Nguyen. All Rights Reserved */


/**
 * Frame Interface
 */
public interface IFrame
{
    /**
     * Set Current Screen
     * @param s Reference to Screen
     */
    void setCurrentScreen( IScreen s ) ;

    /**
     * Set Menu Item
     * @param slot Slot Object
     * @param c    Command Object
     */
    void setMenuItem( String slot, IMenuCommand c ) ;

    /**
     * Send a Touch Event
     * @param x Screen X Coord
     * @param y Screen Y Coord
     */
    void touch(int x, int y) ;


    // Handle drag.
    void drag();

    
    String screen() ;

    /**
     * Display Screen to Terminal/Log
     */
    void display() ;
    /**
     * Execute a Command: A, B, C, D or E
     * @param c Command to Execute
     */
    void cmd( String c ) ;

}
