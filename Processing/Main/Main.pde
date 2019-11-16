Device d;
ErrorScreen err;
// HomePageScreen Testing Code
HomePageScreen mp;

// MyAccountScreen & MenuBarScreen Testing Code
// MyAccountScreen mas;
// MenuBarScreen ms;

void setup() {
	size(380, 680);

	// old starbuck starter code
	// d = new Device();
	// d.display();

	// // HomePageScreen Testing Code
	mp = new HomePageScreen("San Jose State University");
	Store s1 = new Store("../../img/store/starbucks_300x150.png", "StarBucks1", "Student Union", "Pickup: 7:00am - 10:00pm", 20);
	Store s2 = new Store("../../img/store/starbucks_300x150.png","StarBucks2", "Student Union", "Pickup: 7:00am - 10:00pm", 250);
	mp.addSubComponent(s1);
	mp.addSubComponent(s2);

  err = new ErrorScreen("123");
  err.setTimer(millis()+ 1000);
  err.setFlag(true);

  mp.addSubComponent(err);

	// MyAccountScreen Testing Code
	// mas = new MyAccountScreen(20);
	// ms = new MenuBarScreen();
	// mas.addSubComponent(ms);
	// mas.display();


}

void draw() {
  mp.display();
  // // HomePageScreen Testing Code
  // if (mousePressed) {
  //   mp.display();
  // }

	// // MyAccountScreen & MenuBarScreen Testing Code
	// if (mousePressed) {
	// 	mas.display();
	// }

	//  if (mousePressed) {
	//    mp.touch(mouseX, mouseY);
	//  } else {
	//    fill(255);
	//  }
	//  //ellipse(mouseX, mouseY, 80, 80);
}



void mouseClicked(){
	// TODO: Update all touch() function

	// // HomePageScreen Testing Code
	// mp.touch(mouseX, mouseY);

	// // MyAccountScreen & MenuBarScreen Testing Code
	// mas.touch(mouseX, mouseY);

  //  if (mousePressed) {
  //    System.out.println(mouseX + " " +  mouseY);
  //    mp.touch(mouseX, mouseY);
  //  }
  // app.touch();


  // login screen test code
  //d.touch(mouseX, mouseY);

}


//void mouseDragged(){
//  // TODO: Fill Device drag() function
//  println("dragged: ", mouseX, "  ", mouseY);
//  // app.drag();
//}
