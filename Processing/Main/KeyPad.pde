/* (c) Copyright 2018 Paul Nguyen. All Rights Reserved */


import java.util.ArrayList;



/** Key Pad */
public class KeyPad implements ITouchEventHandler, IDisplayComponent, IKeyPadSubject
{
    ITouchEventHandler nextHandler ;
    PImage [] imgKeyPad = new PImage[12];
    PImage imgBackspace;
    private ArrayList<IKeyPadObserver> observers ;
    int countPinDigits = 0 ;
    String lastKey = "" ;

    public KeyPad()
    {
      for(int i = 0; i < 10; i++)
      {
        imgKeyPad[i] = loadImage("../../img/keyPad/key" + Integer.toString(i) + "_50.png");
      }
      observers = new ArrayList<IKeyPadObserver>() ;
    }

    /**
     * Touch Event
     * @param x X Coord
     * @param y Y Coord
     */
    public void touch(int x, int y) { 
        if ( y > 4 )
        {
            System.err.println( "KeyPad Touched at (" + x + ", " + y + ")" ) ; 
            this.lastKey = getKey( x, y ) ;
            if ( x==3 && y==8   )
            {
                countPinDigits-- ;
            }
            else if ( y < 8 || (x==2 && y==8))
            {
                countPinDigits++ ;
            }
            notifyObservers() ;            
        }
        else
        {
            if ( nextHandler != null )
                nextHandler.touch(x,y) ;
        }
    }

    /**
     *  Get Last Key Pressed 
     * @return Lasy Key
     */
    public String lastKey() { 
        System.err.println( "Key Pressed: " + this.lastKey ) ;
        return this.lastKey ; 
    }

    /**
     * Get Key Number from (X,Y) Touch Coord's
     * @param  x [description]
     * @param  y [description]
     * @return   [description]
     */
    private String getKey( int x, int y )
    {
        int kx = 0, ky = 0 ;
        kx = x;
        ky = y-4 ;
        if ( kx==3 && ky ==4 )
            return "X" ;
        else if ( kx==2 && ky == 4 )
            return "0" ;
        else if ( kx==1 && ky ==4 )
            return " " ;
        else
            return Integer.toString(kx+3*(ky-1)) ;   
    }

    /*
    kx = 1, ky = 1  ==> 1
    kx = 1, ky = 2  ==> 4
    kx = 1, ky = 3  ==> 7

    kx = 2, ky = 1  ==> 2
    kx = 2, ky = 2  ==> 5
    kx = 2, ky = 3  ==> 8

    kx = 3, ky = 1  ==> 3
    kx = 3, ky = 2  ==> 6
    kx = 3, ky = 3  ==> 9

    n = kx + 3 * (ky-1)

    */

    /**
     * Set Next Touch Event Handler
     * @param next Event Handler
     */
    public void setNext( ITouchEventHandler next) { 
        nextHandler = next ;
    }

    /**
     * Get Key Pad Display
     * @return Key Pad View Contents
     */
    public String display() 
    {
        int intervalX = 45;
        int intervalY = 60;
        int keycount = 1;
        for(int i = 0; i < 3; i++)
        {
          for(int j = 0; j < 3; j++)
          {
            image(imgKeyPad[keycount], 55 + j*(intervalX + 60), 230+i*(intervalY+40), 60, 60);
            keycount++;
          }
        }
        
        image(imgKeyPad[0], 55 + intervalX + 60, 230+3*(intervalY+40), 60, 60);
        imgBackspace = loadImage("../../img/keyPad/backspace_50.png");
        image(imgBackspace, 55 + 2*(intervalX + 60), 230+3*(intervalY+40), 60, 60);
        return "This is Keypad" ;
    }

    /**
     * Add Sub Component (Not used)
     * @param c Display Component
     */
    public void addSubComponent( IDisplayComponent c ) 
    {
    }

    /**
     * Attach a Key Pad Observer
     * @param obj Observer
     */
    public void attach( IKeyPadObserver obj ) 
    {
        observers.add( obj ) ;
    }

    /**
     * Remove Key Pad Observer
     * @param obj Observer
     */
    public void removeObserver( IKeyPadObserver obj )
    {
        int i = observers.indexOf(obj) ;
        if ( i >= 0 )
            observers.remove(i) ;
    }

    /**
     * Notify all Observers of Update Event
     */
    public void notifyObservers( )
    {
        for (int i=0; i<observers.size(); i++)
        {
            IKeyPadObserver observer = observers.get(i) ;
            observer.keyEventUpdate( countPinDigits, lastKey ) ;
        }
    }    

}
