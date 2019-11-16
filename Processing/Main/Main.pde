/* (c) Copyright 2018 Paul Nguyen. All Rights Reserved */
 //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
Device d;

// HomePageScreen Testing Code
// HomePageScreen mp;

//StoreScreen Testing code
StoreScreen storeScreen;

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

   //Store Screen Testing Code
    int base = 90;
    storeScreen = new StoreScreen();
    OptionTitle b1 = new OptionTitle("Choose a Burger", "Burger", base-15);
    Screen c1 = new OptionItem("1/3LB Burger", 9.5, base);
    Screen c2 = new OptionItem("2/3LB Burger", 11.5, base + 25*1);
    Screen c3 = new OptionItem(" 1 LB Burger", 13.5, base + 25*2);
    storeScreen.addSubComponent( b1);
    storeScreen.addSubComponent( c1);
    storeScreen.addSubComponent( c2);
    storeScreen.addSubComponent( c3);
    storeScreen.addSubComp(c1);
    storeScreen.addSubComp(c2);
    storeScreen.addSubComp(c3);
    storeScreen.display();
}

void draw() {

  // // HomePageScreen Testing Code
  // if (mousePressed) {
  //   mp.display();
  // }

  //OptionScreen Testing Code  //Store Screen Testing code
   if (mousePressed) {
     storeScreen.display();
   } 

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

  //Store Screen Testing code
  storeScreen.touch(mouseX, mouseY);

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
