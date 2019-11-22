public class LineChart extends Screen  implements ITouchEventHandler, IDisplayComponent{

  private ITouchEventHandler nextHandler ;

  // Line chart location
  int startX = 40;
  int endX = 340;
  int startY = 100;
  int endY = 230;

  // Line chart values;
  int[] data  = {30, 12, 43, 22, 18, 26};

  public LineChart(){

    for(int i = 0; i < data.length; i++){
      data[i] = 0-data[i];
    }

  }

  /**
  * Display content
  */
  @Override
  public void display() {

    if(data.length < 2){
      textSize(18);
      fill(0);
      textAlign(CENTER);
      text("No enough order", 190, 160);
      textAlign(LEFT);
      return;
    }


    // x & y axis
    strokeWeight(1.5);
    stroke(0, 0, 0);
    line(startX, startY, startX, endY);
    line(startX, endY, endX, endY);
    textSize(12);
    fill(0);
    text("Order", (startX + endX) / 2, endY + 23);
    text("Price", startX - 5, startY - 16);

    int step = (endX - startX - 30) / (data.length-1);
    int currentX = startX + 20;

    // line chart
    strokeWeight(1);
    textSize(10);
    fill(0);

    // show three y-axis point
    line(startX,
    map(min(data), min(data)-10, max(data)+10, startY, endY),
    startX+5,
    map(min(data), min(data)-10, max(data)+10,startY, endY)
    );
    text(0 - min(data), startX - 15, map(min(data), min(data)-10, max(data)+10,startY, endY)+2);
    line(startX,
    map(max(data), min(data)-10, max(data)+10, startY, endY),
    startX+5,
    map(max(data), min(data)-10, max(data)+10,startY, endY)
    );
    text(0 - max(data), startX - 15, map(max(data), min(data)-10, max(data)+10,startY, endY)+2);
    line(startX,
    map(int((max(data)+min(data))/2), min(data)-10, max(data)+10, startY, endY),
    startX+5,
    map(int((max(data)+min(data))/2), min(data)-10, max(data)+10,startY, endY)
    );
    text(0 - int((max(data)+min(data))/2), startX - 15, map(int((max(data)+min(data))/2), min(data)-10, max(data)+10,startY, endY)+2);

    // draw lines
    for (int i = 0; i < data.length-1; i ++){
      float a = map(data[i], min(data) - 10, max(data) + 10, startY, endY);
      float b = map(data[i+1], min(data) - 10, max(data) + 10, startY, endY);
      line(currentX, a ,currentX + step, b);

      // x-axis point
      line(currentX, endY, currentX, endY - 5);
      text(i+1, currentX-2, endY + 12);

      currentX += step;
    }
    // last point on x-axis
    line(currentX, endY, currentX, endY - 5);
    text(data.length, currentX-2, endY + 12);

  }


  /**
 * Set Next Touch Handler
 * @param next Touch Event Handler
 */
  public void setNext(ITouchEventHandler next)
  {
      nextHandler = next ;
  }

  public void touch(int x, int y){

  }

}