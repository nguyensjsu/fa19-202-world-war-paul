/* (c) Copyright 2018 Paul Nguyen. All Rights Reserved */


//import java.util.ArrayList;

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
        // System.out.println("Mouse Touched: " + mouseX + " " + mouseY);
        if(260 <= x && x <= 340 && 560 <= y && y <= 640){
            this.lastKey = getKey(x, y);
            if (countPinDigits > 0){
              countPinDigits --;
              notifyObservers();
            }
        }
        else{
            this.lastKey = getKey(x, y);
            System.out.println("Keypad: " + this.lastKey);
            if(!this.lastKey.equals("-1")){
                this.flag = false;
                countPinDigits++;
                touchUnder4PinFlag();
                notifyObservers();
            }
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
     * Get Key Number from (mouseX, mouseY) Touch Coord's
     * @return   [description]
     */
    private String getKey(int x, int y)
    {
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

    }



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
    public void display()
    {
        int index = 1;
        int x = 40;
        int y = 245;

        // First three row of keypad.
        // 1 2 3
        // 4 5 6
        // 7 8 9

        for(int i = 1; i <= 3; i ++){
            x = 40;
            for(int j = 0; j < 3; j++){
                image(num[index], x, y, 80, 80);
                index ++;
                x += 110;

            }
            y += 105;
        }

        // last row of the keypad.
        // _ 0 X
        image(num[0], 150, 560, 80, 80);
        image(backSpace, 260, 560, 80, 80);

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
