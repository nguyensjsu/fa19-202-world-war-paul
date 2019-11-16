/* (c) Copyright 2018 Paul Nguyen. All Rights Reserved */
 //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
Device d;

// HomePageScreen Testing Code
// HomePageScreen mp;

//OptionScreen Testing Code
// OptionScreen optionScreen;

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

  //Custom OptionScreen Testing Code
  // int base = 90;
  // optionScreen = new OptionScreen();
  // OptionTitle title1 = new OptionTitle("Choose a Cheese", "Cheese", base-15);
  // OptionItem item1 = new OptionItem("Danish Blue Cheese", 1, base);
  // OptionItem item2 = new OptionItem("Horseradish Cheddar", 1, base + 25*1);
  // OptionItem item3 = new OptionItem("Yello American", 1, base + 25*2);
  // OptionTitle title2 = new OptionTitle("Topping for any combination","Toppings", base + 25*4);
  // OptionItem item4 = new OptionItem("Bermuda Red Onion", 0, base + 25*5);
  // OptionItem item5 = new OptionItem("Black Olives", 0, base + 25*6);
  // OptionItem item6 = new OptionItem("Carrot Strings", 0, base + 25*7);
  // OptionItem item7 = new OptionItem("Coleslaw", 0, base + 25*8);
  // OptionItem item8 = new OptionItem("Jalepenos", 0, base + 25*9);
  // OptionItem item9 = new OptionItem("Sprouts", 0, base + 25*10);
  // OptionTitle title3 = new OptionTitle("Choose a Sauce","Sauce", base + 25*12);
  // OptionItem item10 = new OptionItem("Ranch", 0.75, base + 25*13);
  // OptionItem item11 = new OptionItem("Appricot Sauce", 0.75, base + 25*14);
  // OptionItem item12 = new OptionItem("Besil Pestol", 0.75, base + 25*15);
  // optionScreen.addSubComponent( title1);
  // optionScreen.addSubComponent( item1);
  // optionScreen.addSubComponent( item2);
  // optionScreen.addSubComponent( item3);
  // optionScreen.addSubComponent( title2);
  // optionScreen.addSubComponent( item4);
  // optionScreen.addSubComponent( item5);
  // optionScreen.addSubComponent( item6);
  // optionScreen.addSubComponent( item7);
  // optionScreen.addSubComponent( item8);
  // optionScreen.addSubComponent( item9);
  // optionScreen.addSubComponent( title3);
  // optionScreen.addSubComponent( item10);
  // optionScreen.addSubComponent( item11);
  // optionScreen.addSubComponent( item12);
  // optionScreen.display();
}

void draw() {

  // // HomePageScreen Testing Code
  // if (mousePressed) {
  //   mp.display();
  // }

  // OptionScreen Testing Code  //Store Screen Testing code
  // if (mousePressed) {
  //   optionScreen.display();
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

  //CustomOption Screen Testing code  //Store Screen Testing code
  // optionScreen.touch(mouseX, mouseY);

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
