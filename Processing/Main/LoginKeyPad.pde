/* (c) Copyright 2018 Paul Nguyen. All Rights Reserved */


import java.util.ArrayList;

/** Key Pad */
public class LoginKeyPad implements ITouchEventHandler, IDisplayComponent, IKeyPadSubject
{
    ITouchEventHandler nextHandler ;
    private ArrayList<IKeyPadObserver> observers ;
    int countPinDigits = 0 ;
    String lastKey = "" ;
    boolean flag = false;


    PImage[] num = new PImage[10];
    PImage backSpace;

    public LoginKeyPad()
    {
        observers = new ArrayList<IKeyPadObserver>() ;

        // display setup
        for(int i = 0; i < 10; i ++)
          num[i] = loadImage("../../img/keyPad/key" + Integer.toString(i) + "_50.png");
        backSpace = loadImage("../../img/keyPad/backspace_50.png");
    }

    /**
     * Touch Event
     * @param x X Coord
     * @param y Y Coord
     */
    public void touch(int x, int y) {
        System.out.println("Mouse Touched: " + mouseX + " " + mouseY);
        if(260 <= mouseX && mouseX <= 340 && 560 <= mouseY && mouseX <= 640){
            this.lastKey = getKey();
            if (countPinDigits > 0){
              countPinDigits --;
              notifyObservers();
            }
        }
        else{
            this.lastKey = getKey();
            System.out.println("Keypad: " + this.lastKey);
            if(!this.lastKey.equals("-1")){
                this.flag = false;
                countPinDigits++;
                touchUnder4PinFlag();
                notifyObservers();
            }
        }

        // if ( y > 4 )
        // {
        //     System.err.println( "KeyPad Touched at (" + x + ", " + y + ")" ) ;
        //     this.lastKey = getKey( x, y ) ;
        //     if ( x==3 && y==8   )
        //     {
        //         countPinDigits-- ;
        //     }
        //     else if ( y < 8 || (x==2 && y==8))
        //     {
        //         countPinDigits++ ;
        //     }
        // }
        // else
        // {
        //     if ( nextHandler != null )
        //         nextHandler.touch(x,y) ;
        // }
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
     * Get Key Number from (mouseX, mouseY) Touch Coord's
     * @return   [description]
     */
    private String getKey()
    {
        int x = int(mouseX);
        int y = int(mouseY);
        if(40 <= x && x <= 120){
            if(245 <= y && y <= 325){
                return "1";
            }
            if(350 <= y && y <= 430){
                return "4";
            }
            if(455 <= y && y <= 535){
                return "7";
            }
        }
        else if(150 <= x && x <= 230){
            if(245 <= y && y <= 325){
                return "2";
            }
            if(350 <= y && y <= 430){
                return "5";
            }
            if(455 <= y && y <= 535){
                return "8";
            }
            if(460 <= y && y <= 640){
                return "0";
            }
        }
        else if(260 <= x && x <= 340){
            if(245 <= y && y <= 325){
                return "3";
            }
            if(350 <= y && y <= 430){
                return "6";
            }
            if(455 <= y && y <= 535){
                return "9";
            }
            if(460 <= y && y <= 640){
                return "X";
            }
        }
        return "-1";



        // int kx = 0, ky = 0 ;
        // kx = x;
        // ky = y-4 ;
        // if ( kx==3 && ky ==4 )
        //     return "X" ;
        // else if ( kx==2 && ky == 4 )
        //     return "0" ;
        // else if ( kx==1 && ky ==4 )
        //     return " " ;
        // else
        //     return Integer.toString(kx+3*(ky-1)) ;
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

        image(num[1], 40, 245, 80, 80);
        image(num[2], 150, 245, 80, 80);
        image(num[3], 260, 245, 80, 80);

        image(num[4], 40, 350, 80, 80);
        image(num[5], 150, 350, 80, 80);
        image(num[6], 260, 350, 80, 80);

        image(num[7], 40, 455, 80, 80);
        image(num[8], 150, 455, 80, 80);
        image(num[9], 260, 455, 80, 80);

        image(num[0], 150, 560, 80, 80);
        image(backSpace, 260, 560, 80, 80);

        String output =  "  [1] [2] [3]\n" ;
               output += "  [4] [5] [6]\n" ;
               output += "  [7] [8] [9]\n" ;
               output += "  [_] [0] [x]" ;

        return output ;
    }

    public void touchUnder4PinFlag() {
    if (countPinDigits == 4){
        countPinDigits = 0;
        this.flag = true;
    }
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
