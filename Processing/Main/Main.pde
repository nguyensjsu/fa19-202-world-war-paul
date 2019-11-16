/* (c) Copyright 2018 Paul Nguyen. All Rights Reserved */
 //<>// //<>// //<>// //<>// //<>// //<>//
Device d;

// HomePageScreen Testing Code
// HomePageScreen mp;

//OptionScreen Testing Code
OptionScreen a;

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

  //Custom Item Screen Testing Code
  int base = 90;
   a = new OptionScreen();
   OptionTitle b1 = new OptionTitle("Choose a Cheese", "Cheese", base-15);
   OptionItem c1 = new OptionItem("Danish Blue Cheese", 1, base);
   OptionItem c2 = new OptionItem("Horseradish Cheddar", 1, base + 25*1);
   OptionItem c3 = new OptionItem("Yello American", 1, base + 25*2);
   OptionTitle b2 = new OptionTitle("Topping for any combination","Toppings", base + 25*4);
   OptionItem c4 = new OptionItem("Bermuda Red Onion", 0, base + 25*5);
   OptionItem c5 = new OptionItem("Black Olives", 0, base + 25*6);
   OptionItem c6 = new OptionItem("Carrot Strings", 0, base + 25*7);
   OptionItem c7 = new OptionItem("Coleslaw", 0, base + 25*8);
   OptionItem c8 = new OptionItem("Jalepenos", 0, base + 25*9);
   OptionItem c9 = new OptionItem("Sprouts", 0, base + 25*10);
   OptionTitle b3 = new OptionTitle("Choose a Sauce","Sauce", base + 25*12);
   OptionItem c10 = new OptionItem("Ranch", 0.75, base + 25*13);
   OptionItem c11 = new OptionItem("Appricot Sauce", 0.75, base + 25*14);
   OptionItem c12 = new OptionItem("Besil Pestol", 0.75, base + 25*15);
   a.addSubComponent( b1);
   a.addSubComponent( c1);
   a.addSubComponent( c2);
   a.addSubComponent( c3);
   a.addSubComponent( b2);
   a.addSubComponent( c4);
   a.addSubComponent( c5);
   a.addSubComponent( c6);
   a.addSubComponent( c7);
   a.addSubComponent( c8);
   a.addSubComponent( c9);
   a.addSubComponent( b3);
   a.addSubComponent( c10);
   a.addSubComponent( c11);
   a.addSubComponent( c12);
   a.display();
}

void draw() {

  // // HomePageScreen Testing Code
  // if (mousePressed) {
  //   mp.display();
  // }

  //OptionScreen Testing Code
  if (mousePressed) {
    a.display();
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

  //CustomItem Screen Testing code
  a.touch(mouseX, mouseY);

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
