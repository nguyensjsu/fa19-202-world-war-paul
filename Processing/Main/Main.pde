/* (c) Copyright 2018 Paul Nguyen. All Rights Reserved */
 //<>// //<>// //<>//
Device d;

// HomePageScreen Testing Code
// HomePageScreen mp;

void setup() {
  size(380, 680);
  
  // old starbuck starter code 
  d = new Device();
  d.display();

  // // HomePageScreen Testing Code
  // mp = new HomePageScreen("San Jose State University");
  // Store s1 = new Store("../../img/store/starbucks_300x150.png", "StarBucks1", "Student Union", "Pickup: 7:00am - 10:00pm", 20);
  // Store s2 = new Store("../../img/store/starbucks_300x150.png","StarBucks2", "Student Union", "Pickup: 7:00am - 10:00pm", 250);
  // mp.addSubComponent(s1);
  // mp.addSubComponent(s2);
  // mp.display();
    
  // TODO: Update all display() function: Change all System.out.print() call to processing drawings
}

void draw() {

  // // HomePageScreen Testing Code
  // if (mousePressed) {
  //   mp.display();
  // }


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

  // // HomePageScreen Testing Code
  // mp.touch(mouseX, mouseY);

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
