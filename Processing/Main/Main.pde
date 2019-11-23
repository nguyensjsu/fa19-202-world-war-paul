import com.google.gson.annotations.*;
import com.google.gson.*;
import com.google.gson.internal.*;
import com.google.gson.internal.bind.*;
import com.google.gson.internal.bind.util.*;
import com.google.gson.reflect.*;
import com.google.gson.stream.*;

import java.util.*;
import java.util.HashMap;
import java.lang.reflect.Type;
import java.io.*;

WelcomeScreen welcomeScreen;
Device device;

void setup() {

	// Finalize order, do not delete it.
	size(380, 680);

  welcomeScreen = new WelcomeScreen();
	device = new Device();

}

void draw() {

  if(welcomeScreen.isDisplay()){
    welcomeScreen.display();
  }else{
		device.display();
	}

}


void mouseClicked(){

  if (welcomeScreen.isDisplay()) {
		welcomeScreen.touch(mouseX, mouseY);
	} else {
		device.touch(mouseX, mouseY);
	}


}
