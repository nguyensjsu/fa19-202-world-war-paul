/* (c) Copyright 2018 Paul Nguyen. All Rights Reserved */


/**
 * Frame Class -- Container for Screens
 */
public class Frame implements IFrame
{
    private IScreen current ;
    private IMenuInvoker menuA = new MenuOption() ;
    private IMenuInvoker menuB = new MenuOption() ;
    private IMenuInvoker menuC = new MenuOption() ;

    /**
     * Return Screen Name
     * @return Screen Name
     */
    public String screen() { return current.name() ; }
    
    /** Constructor */
    public Frame(IScreen initial)
    {
        current = initial ;
    }

    /**
     * Change the Current Screen
     * @param s Screen Object
     */
    public void setCurrentScreen( IScreen s )
    {
        s.setFrame(this);
        current = s ;
    }

    /**
     * Configure Selections for Command Pattern
     * @param slot A, B, ... E
     * @param c    Command Object
     */
    public void setMenuItem( String slot, IMenuCommand c )
    {
        if ( "home".equals(slot) ) { menuA.setCommand(c) ;  }
        if ( "order".equals(slot) ) { menuB.setCommand(c) ; }
        if ( "account".equals(slot) ) { menuC.setCommand(c) ; }
    }

    /**
     * Send Touch Event
     * @param x X Coord
     * @param y Y Coord
     */
    public void touch(int x, int y)
    {
        if ( current != null )
            current.touch(x,y) ;

    }

    // Drag Event.
    public void drag() {
        //TODO current.drag();
    }

    /** Display Contents of Frame + Screen */
    public void display()
    {
        if ( current != null )
        {
            current.display() ;
        }
    }

    /**
     *  Execute a Command
     * @param c Command
     */
    public void cmd( String c )
    {
        if ( "home".equals(c) ) { menuA.invoke(); }
        if ( "order".equals(c) ) { menuB.invoke(); }
        if ( "account".equals(c) ) { menuC.invoke(); }

    }

}
