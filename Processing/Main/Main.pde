import com.google.gson.annotations.*;
import com.google.gson.*;
import com.google.gson.internal.*;
import com.google.gson.internal.bind.*;
import com.google.gson.internal.bind.util.*;
import com.google.gson.reflect.*;
import com.google.gson.stream.*;

import java.util.Map;
import java.util.HashMap;
import java.lang.reflect.Type;
import java.io.*;

WelcomeScreen welcomeScreen;
Device device;

// HomePageScreen Testing Code
// HomePageScreen mp;

// StoreScreen Testing code
// StoreScreen storeScreen;

// OptionScreen Testing code
// OptionScreen optionScreen;

// MyAccountScreen & MenuBarScreen Testing Code
// MyAccountScreen mas;
// MenuBarScreen ms;

void setup() {

	// Finalize order, do not delete it.
	size(380, 680);

	//d = new Device();

  welcomeScreen = new WelcomeScreen();
	device = new Device();

File directory = new File(".");
System.out.println(directory.getAbsolutePath());

	//device.display();

	// // HomePageScreen Testing Code
	 //mp = new HomePageScreen("San Jose State University");
	// Store s1 = new Store("../../img/store/starbucks_300x150.png", "StarBucks1", "Student Union", "Pickup: 7:00am - 10:00pm", 20);
	// Store s2 = new Store("../../img/store/starbucks_300x150.png","StarBucks2", "Student Union", "Pickup: 7:00am - 10:00pm", 250);

  //Pay Button Testing Code
  // bs = new BasketScreen();
  // pb = new Button("Pay");
  // es = new ErrorScreen("Card Not Found");
  // pb.setErrorMessage(es);
	// bs.addSubComponent(pb);
  // bs.addSubComponent(es);
	// bs.display();

  // ErrorScreen test code
   //ErrorScreen err = new ErrorScreen("123");
   //err.setTimer(millis()+ 1000);
   //err.setFlag(true);
   //mp.addSubComponent(err); // err need be added as last component to show on top

	// mp.addSubComponent(s1);
	// mp.addSubComponent(s2);

	// MyAccountScreen Testing Code
	// mas = new MyAccountScreen(20);
	// ms = new MenuBarScreen();
	// mas.addSubComponent(ms);
	// mas.display();
  
  // TODO: Update all display() function: Change all System.out.print() call to processing drawings

  // // Store Screen Testing Code
  // int base = 90;
  // storeScreen = new StoreScreen("Choose an Item");
  // OptionTitle title1 = new OptionTitle("Choose a Burger", "Burger", base-15);
  // Screen item1 = new OptionItem("1/3LB Burger", 9.5, base);
  // Screen item2 = new OptionItem("2/3LB Burger", 11.5, base + 25*1);
  // Screen item3 = new OptionItem(" 1 LB Burger", 13.5, base + 25*2);
  // Screen basket = new Basket("View Basket", 630);
  // storeScreen.addSubComp( title1);
  // storeScreen.addSubComp( item1);
  // storeScreen.addSubComp( item2);
  // storeScreen.addSubComp( item3);
  // storeScreen.addSubComp(basket);
  // storeScreen.display();

    // // Option Screen Testing Code
  // int base = 90;
  // optionScreen = new OptionScreen("Choose Custom Options");
  // OptionTitle title1 = new OptionTitle("Choose Cheese", "Cheese", base-15);
  // Screen item1 = new OptionItem("Danish Blue Cheese", 1, base);
  // Screen item2 = new OptionItem("Horsadish Cheddar", 1, base + 25*1);
  // Screen item3 = new OptionItem("Yello American", 1, base + 25*2);
  // OptionTitle title2 = new OptionTitle("Choose Topping", "Topping", base + 25*4);
  // Screen item4 = new OptionItem("Bermuda RedOnion", 0, base+ 25*5);
  // Screen item5 = new OptionItem("Black Onions", 0, base + 25*6);
  // Screen item6 = new OptionItem("Carrot Strings", 0, base + 25*7);
  // Screen item7 = new OptionItem("Coloslaw", 0, base + 25*8);
  // Screen item8 = new OptionItem("Jolepenos", 0, base + 25*9);
  // Screen item9 = new OptionItem("Sprouts", 0, base + 25*10);
  // OptionTitle title3 = new OptionTitle("Choose Sauce", "Sauce", base + 25*12);
  // Screen item10 = new OptionItem("Appricot Sauce", 0.75, base + 25*13);
  // Screen item11 = new OptionItem("Ranch", 0.75, base + 25*14);
  // Screen item12 = new OptionItem("Besil Pesto", 0.75, base + 25*15);
  // Screen basket = new Basket("View Basket", 630);
  // optionScreen.addSubComp(title1);
  // optionScreen.addSubComp(item1);
  // optionScreen.addSubComp(item2);
  // optionScreen.addSubComp(item3);
  // optionScreen.addSubComp(title2);
  // optionScreen.addSubComp(item4);
  // optionScreen.addSubComp(item5);
  // optionScreen.addSubComp(item6);
  // optionScreen.addSubComp(item7);
  // optionScreen.addSubComp(item8);
  // optionScreen.addSubComp(item9);
  // optionScreen.addSubComp(title3);
  // optionScreen.addSubComp(item10);
  // optionScreen.addSubComp(item11);
  // optionScreen.addSubComp(item12);
  // optionScreen.addSubComp(basket);
  // optionScreen.display();
}

void draw() {

  // if (welcomeScreen.isDisplay() == false) {
	// 	welcomeScreen.display();
	// } else {
		device.display();
	// }
      

	// // HomePageScreen Testing Code
	// if (mousePressed) {
	//   mp.display();
	// }

	// // MyAccountScreen & MenuBarScreen Testing Code
	// if (mousePressed) {
	// 	mas.display();
	// }

  // // Store Screen Testing Code
  // if (mousePressed) {
  // 	 storeScreen.display();
  // }

  // //Option Screen Testing Code
  // if(mousePressed){
  //   optionScreen.display();
  // }

	//  if (mousePressed) {
	//    mp.touch(mouseX, mouseY);
	//  } else {
	//    fill(255);
	//  }

	//  // TODO: Update screenContents() & all display() functions: Change all System.out.print() call to processing drawings
}



void mouseClicked(){
	
  //   if (welcomeScreen.isDisplay()) {
	// 	welcomeScreen.touch(mouseX, mouseY);
	// } else {
		device.touch(mouseX, mouseY);
	// }
      	

      
	// // HomePageScreen Testing Code
	// mp.touch(mouseX, mouseY);

	// // MyAccountScreen & MenuBarScreen Testing Code
	// mas.touch(mouseX, mouseY);

  //Pay Button Testing Code
  //   bs.touch(mouseX, mouseY);

	//  if (mousePressed) {
	//    System.out.println(mouseX + " " +  mouseY);
	//    mp.touch(mouseX, mouseY);
	//  }
	// app.touch();

  // //Store Screen Testing Code
  //  storeScreen.touch(mouseX, mouseY);

  //OptionScreen Testing Code
  // optionScreen.touch(mouseX, mouseY);

  // // MyAccountScreen & MenuBarScreen Testing Code
  // mas.touch(mouseX, mouseY);

  // if (mousePressed) {
  //   System.out.println(mouseX + " " +  mouseY);
  //   mp.touch(mouseX, mouseY);
  // }
  // app.touch();

	//  WelcomeScreen test code

}
