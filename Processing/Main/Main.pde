/* (c) Copyright 2018 Paul Nguyen. All Rights Reserved */
 //<>// //<>// //<>//
Device d;
HomePageScreen mp;
void setup() {
  size(380, 680);
  
  // old starbuck starter code 
   d = new Device();
    d.display();
    mp = new HomePageScreen("San Jose State University");
    Store s1 = new Store("../../img/store/starbucks_300x150.png", "StarBucks1", "Student Union", "Pickup: 7:00am - 10:00pm", 20);
    Store s2 = new Store("../../img/store/starbucks_300x150.png","StarBucks2", "Student Union", "Pickup: 7:00am - 10:00pm", 250);
    mp.addSubComponent(s1);
    mp.addSubComponent(s2);
    mp.display();
     // d.touch(1, 5);  // 1
     // d.touch(2, 5);  // 2
     // d.touch(3, 5);  // 3
     // d.touch(1, 6);  // 4
    //d.execute("C");

     //d.display();
  // TODO: Update all display() function: Change all System.out.print() call to processing drawings
}

void draw() {

  if (mousePressed) {
    mp.display();
  }
  // d.touch(1, 5);  // 1
  // d.touch(2, 5);  // 2
  // d.touch(3, 5);  // 3
  // d.touch(1, 6);  // 4
  // d.display();

//  if (mousePressed) {
//    mp.touch(mouseX, mouseY);
//  } else {
//    fill(255);
//  }
//  //ellipse(mouseX, mouseY, 80, 80);
//  // TODO: Update screenContents() & all display() functions: Change all System.out.print() call to processing drawings
//  // app.screenContents()
}



void mouseClicked(){
 // TODO: Update all touch() function
    System.out.println(mouseX + " " +  mouseY);
    mp.touch(mouseX, mouseY);
//  if (mousePressed) {
//    System.out.println(mouseX + " " +  mouseY);
//    mp.touch(mouseX, mouseY);
//  }
 // app.touch();
  
}


//void mouseDragged(){
//  // TODO: Fill Device drag() function
//  println("dragged: ", mouseX, "  ", mouseY);
//  // app.drag();
//}
