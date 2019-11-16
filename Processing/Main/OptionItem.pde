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
        //Add a white rectangular to avoid repeat writing string
        fill(255);   
        stroke(255); 
        rectMode(CORNER); 
        rect(20,cHeight,360,20); 

        if(!isSelected)
          img = loadShape("../../img/customItem/option1.svg");  //file destination for file name ad-solid.svg
        else
          img = loadShape("../../img/customItem/option2.svg");  //file destination for file name ad-solid.svg
        shape(img, 20, cHeight, 20, 20);
        textSize(14);
        fill(0);

        text(name, 45, cHeight + 15);

        String tmp;
        if(price != 0){
          tmp ="$" +price;
          text(tmp, 320, cHeight + 15);
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
        if (cHeight <= y && y <= cHeight+25) {
          isSelected = (isSelected == true) ? false : true;
          display();

          // TODO: next() should jump to next screen           
          next();
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
