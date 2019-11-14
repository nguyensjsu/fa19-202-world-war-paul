/* (c) Copyright 2018 Paul Nguyen. All Rights Reserved */
 //<>// //<>// //<>//
Device d;
void setup() {
    size(380, 680);
    //KeyPad kp = new KeyPad();
 
    d = new Device();
    d.display();
    d.touch(1, 5);  // 1
    d.touch(2, 5);  // 2
    d.touch(3, 5);  // 3
    d.touch(1, 6);  // 4
    d.execute("E");

    //d.display();
  // TODO: Update all display() function: Change all System.out.print() call to processing drawings
}

void draw() {
     
     d.display();
}



void mouseClicked(){
  // TODO: Update all touch() function
  
    //println("clicked: ", mouseX, "  ", mouseY); 
    d.touch(mouseX, mouseY);
  
  
}


//void mouseDragged(){
//  // TODO: Fill Device drag() function
//  println("dragged: ", mouseX, "  ", mouseY);
//  // app.drag();
//}
