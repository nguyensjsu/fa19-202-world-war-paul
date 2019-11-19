/* Error Screen */
public class Header extends Screen implements ITouchEventHandler, IDisplayComponent{


    private ITouchEventHandler nextHandler ;

    public Header(String str){

    }

    // display error message on top of the screen for a few second
    public void display(){

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
