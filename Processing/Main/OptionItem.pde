/** Payments Screen */
public class OptionItem extends Screen implements IDisplayComponent,  ITouchEventHandler
{
    ITouchEventHandler nextHandler ;
    PShape optionImg1;
    PShape optionImg2;

    String name;
    float price;
    int curHeight;
    boolean isSelected; 
    public OptionItem(String n, float p, int h)
    {
        name = n;
        price  = p;
        curHeight = h;
        isSelected = false;
        optionImg1 = loadShape("../../img/customItem/option1.svg");  //file destination for file name ad-solid.svg
        optionImg2 = loadShape("../../img/customItem/option2.svg");  //file destination for file name ad-solid.svg

    }

    /** 
      * Display function
      * @return: currently useless
      */ 
    public void display(){
        //Add a white rectangular to avoid repeat writing string
        fill(255);   
        stroke(255); 
        rectMode(CORNER); 
        rect(20,curHeight,360,20); 

        if(!isSelected){
          shape(optionImg1, 20, curHeight, 20, 20);
        }
        else{
          shape(optionImg2, 20, curHeight, 20, 20);
        }
        textSize(14);
        fill(0);

        text(name, 45, curHeight + 15);

        if(price != 0){
          text("$"+price, 320, curHeight + 15);
        }
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
        if (curHeight <= y && y <= curHeight+25) {
          isSelected = (isSelected == true) ? false : true;
          display();

        } else if (nextHandler != null) {
            nextHandler.touch(x,y);
        }
    }


    /**
     * add price back
     */
    public double add(){
      if(isSelected){
        return price;
      }
      else{
        return 0.0;
      }
    }

   /**
     * return the name to print
     */
    public String title(){
      if(isSelected){
        return name;
      }
      else
        return "";
    }
    

}
