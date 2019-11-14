/** Payments Screen */
public class OptionItem extends Screen implements IDisplayComponent
{
    String name;
    float price;
    int cHeight;
    public OptionItem(String n, float p, int h)
    {
        name = n;
        price  = p;
        cHeight = h;
    }

    /** 
      * Display function
      * @return: currently useless
      */ 
    public void display(){
        PShape img;
        img = loadShape("../../img/customItem/option1.svg");  //file destination for file name ad-solid.svg
        shape(img, 20, cHeight, 20, 20);
        textSize(14);
        fill(0); 
        String tmp;
        tmp = name +String.format("%" + (50-name.length())  + "s", "") + "$" +price;
        text(tmp, 45, cHeight + 15);
    }

    /** 
      * touch function
      */
    public void touch(int x, int y){
    }

    

}


