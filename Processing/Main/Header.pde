/* Error Screen */
public class Header extends Screen implements ITouchEventHandler, IDisplayComponent{

    private String header;
    private ITouchEventHandler nextHandler ;

    public Header(String str){
        this.header = str;
    }

    public void display(){
        textSize(22);
        textAlign(CENTER);
        text(header, 190, 30);
        textAlign(LEFT);
        textSize(14);

        strokeWeight(1);
        stroke(0, 0, 0);
        line(0, 45, 380, 45);

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
    public void touch(int x, int y){
        if (nextHandler != null) {
            nextHandler.touch(x,y);
        }
    }

}
