/** Payments Screen */
public class OptionTitle extends Screen implements IDisplayComponent
{    
    String name;
    int cHeight;
    public OptionTitle(String n, int height)
    {
        name = n;
        cHeight = height;
    }

    /** 
      * Display function
      * @return: currently useless
      */ 
    public void display(){
        //All Txt
        textSize(14);
        fill(0);  
        text(name, 20, cHeight);
    }

    /** 
      * touch function
      */
    public void touch(int x, int y){
        
    }

    

}