/** Payments Screen */
public class OptionItem extends Screen implements IDisplayComponent,  ITouchEventHandler
{
    ITouchEventHandler nextHandler ;
    PShape img;

    String name;
    float price;
    int cHeight;
    boolean isSelected; 
    public OptionItem(String n, float p, int h)
    {
        name = n;
        price  = p;
        cHeight = h;
        isSelected = false;
    }

    /** 
      * Display function
      * @return: currently useless
      */ 
    public void display(){
        fill(255);   //fill the color of the rectangular, v1 v2 v3 = RGB color value
        stroke(255);  //set the color of the boarder
        rectMode(CORNER);  //Different mode to select
        rect(20,cHeight,360,20);  // (x,y) = (340, 40)  size = (60,30)
        if(!isSelected)
          img = loadShape("../../img/customItem/option1.svg");  //file destination for file name ad-solid.svg
        else
          img = loadShape("../../img/customItem/option2.svg");  //file destination for file name ad-solid.svg
        shape(img, 20, cHeight, 20, 20);
        textSize(14);
        fill(0); 
        String tmp;
        if(price == 0){
          tmp = name;
        }
        else{
          tmp = name +String.format("%" + (50-name.length())  + "s", "") + "$" +price;
        }
        text(tmp, 45, cHeight + 15);
    }

    /**
     * Set Next Touch Handler
     * @param next Touch Event Handler
     */
    public void setNext(ITouchEventHandler next) 
    { 
        nextHandler = next ;
    }

    /**
     * Touch Event 
     * @param x Touch X
     * @param y Touch Y
     */
    public void touch(int x, int y) 
    {
        if (cHeight <= y && y <= cHeight+25) {
          // TODO: next() should jump to next screen
          isSelected = (isSelected == true) ? false : true;
           
          System.out.println(isSelected);
          next();
          display();
          System.out.println("Jump into" + name);
        } else if (nextHandler != null) {
            nextHandler.touch(x,y);
        }

    }

    

}
