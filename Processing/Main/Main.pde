
import com.google.gson.annotations.*; //<>//
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


Device d;
AddCard ad;
// HomePageScreen Testing Code
// HomePageScreen mp;

//StoreScreen Testing code
 StoreScreen storeScreen;

// MyAccountScreen & MenuBarScreen Testing Code
// MyAccountScreen mas;
// MenuBarScreen ms;

void setup() {

	size(380, 680);

  // // HomePageScreen Testing Code
  // mp = new HomePageScreen("San Jose State University");
  // Store s1 = new Store("../../img/store/starbucks_300x150.png", "StarBucks1", "Student Union", "Pickup: 7:00am - 10:00pm", 20);
  // Store s2 = new Store("../../img/store/starbucks_300x150.png","StarBucks2", "Student Union", "Pickup: 7:00am - 10:00pm", 250);
  // mp.addSubComponent(s1);
  // mp.addSubComponent(s2);
  // mp.display();
  // TODO: Update all display() function: Change all System.out.print() call to processing drawings

  //  //Store Screen Testing Code
     //int base = 90;
     //storeScreen = new StoreScreen();
     //OptionTitle title1 = new OptionTitle("Choose a Burger", "Burger", base-15);
     //Screen item1 = new OptionItem("1/3LB Burger", 9.5, base);
     //Screen item2 = new OptionItem("2/3LB Burger", 11.5, base + 25*1);
     //Screen item3 = new OptionItem(" 1 LB Burger", 13.5, base + 25*2);
     //Screen basket = new Basket("View Basket", 630);
     //storeScreen.addSubComponent( title1);
     //storeScreen.addSubComponent( item1);
     //storeScreen.addSubComponent( item2);
     //storeScreen.addSubComponent( item3);
     //storeScreen.addSubComponent(basket);
     //storeScreen.addSubComp(item1);
     //storeScreen.addSubComp(item2);
     //storeScreen.addSubComp(item3);
     //storeScreen.display();
}

void draw() {
  // // HomePageScreen Testing Code
  // if (mousePressed) {
  //   mp.display();
  // }


	// // MyAccountScreen & MenuBarScreen Testing Code
	// if (mousePressed) {
	// 	mas.display();
	// }

  // // Store Screen Testing Code
	 //if (mousePressed) {
	 //	storeScreen.display();
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

	// // MyAccountScreen & MenuBarScreen Testing Code
	// mas.touch(mouseX, mouseY);


  // //Store Screen Testing Code
   //storeScreen.touch(mouseX, mouseY);

  // // MyAccountScreen & MenuBarScreen Testing Code
  // mas.touch(mouseX, mouseY);

  //  if (mousePressed) {
  //    System.out.println(mouseX + " " +  mouseY);
  //    mp.touch(mouseX, mouseY);
  //  }
  // app.touch();


  // login screen test code
  // d.touch(mouseX, mouseY);

}


//void mouseDragged(){
//  // TODO: Fill Device drag() function
//  println("dragged: ", mouseX, "  ", mouseY);
//  // app.drag();
//}
