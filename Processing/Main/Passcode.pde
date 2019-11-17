/* (c) Copyright 2018 Paul Nguyen. All Rights Reserved */


/** Passcode Screen Component */
public class Passcode implements ITouchEventHandler, IDisplayComponent, IKeyPadObserver
{
    ITouchEventHandler nextHandler ;

    private int count = 0;

    /**
     * Touch Event Ignored by Passcode
     * @param x Touch X
     * @param y Touch Y
     */
    public void touch(int x, int y)
    {
        if ( y==2 )
        {
            System.err.println( "Passcode Touched at (" + x + ", " + y + ")" ) ;
        }
        else
        {
            if ( nextHandler != null )
                nextHandler.touch(x,y) ;
        }
    }

    /**
     * Set Next Touch Handler
     * @param next Touch Event Handler
     */
    public void setNext( ITouchEventHandler next)
    {
        nextHandler = next ;
    }


    /**
     * Display "Echo Feedback" on Pins enterred so far
     * @return Passcode String for Display
     */

    public void display()
    {
        background(209);
        textSize(46);
        fill(50);
        switch ( count )
        {
            case 0:
              text("[_]  [_]  [_]  [_]", 40, 130);
              break ;
            case 1:
              text("[*]  [_]  [_]  [_]", 40, 130);
              break ;
            case 2:
              text("[*]  [*]  [_]  [_]", 40, 130);
              break ;
            case 3:
              text("[*]  [*]  [*]  [_]", 40, 130);
              break ;
            case 4:
              text("[*]  [*]  [*]  [*]", 40, 130);

              break ;
        }


    }

    /**
     * Add Display Component to Screen
     * @param c Display Component
     */
    public void addSubComponent( IDisplayComponent c )
    {
    }

    /**
     * Key Event Update
     * @param c   Count of Keys So Far
     * @param key Last key Pressed
     */
    public void keyEventUpdate( int c, String key )
    {
        System.err.println( "Key: " + key ) ;
        count = c ;
    }
}
