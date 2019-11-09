/* (c) Copyright 2018 Paul Nguyen. All Rights Reserved */
 //<>// //<>// //<>//

void setup() {
  size(500, 500);
  
   // old starbuck starter code 
        Device d = new Device().getInstance();
        
        d.display();
        d.touch(1, 5);  // 1
        d.touch(2, 5);  // 2
        d.touch(3, 5);  // 3
        d.touch(1, 6);  // 4
        d.display();
        // TODO: Update all display() function: Change all System.out.print() call to processing drawings
}

void draw() {
  if (mousePressed) {
    fill(0);
  } else {
    fill(255);
  }
  ellipse(mouseX, mouseY, 80, 80);
  // TODO: Update screenContents() & all display() functions: Change all System.out.print() call to processing drawings
  // app.screenContents()
}



void mouseClicked(){
  // TODO: Update all touch() function
  println("clicked: ", mouseX, "  ", mouseY);
  // app.touch();
  
}


void mouseDragged(){
  // TODO: Fill Device drag() function
  println("dragged: ", mouseX, "  ", mouseY);
  // app.drag();
}
