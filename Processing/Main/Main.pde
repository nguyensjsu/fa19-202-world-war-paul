/* (c) Copyright 2018 Paul Nguyen. All Rights Reserved */

import java.io.Console; //<>// //<>// //<>//


void setup() {
  size(500, 500);
  
   
   
   // old starbuck starter code 
        Device d = new Device().getInstance();
        IApp app = (IApp) d ;
        String msg = "" ;
        System.out.println(app.screenContents()) ;
        app.touch(1, 5);  // 1
        app.touch(2, 5);  // 2
        app.touch(3, 5);  // 3
        app.touch(1, 6);  // 4
        System.out.println(app.screenContents()) ;

}

void draw() {
  if (mousePressed) {
    fill(0);
  } else {
    fill(255);
  }
  ellipse(mouseX, mouseY, 80, 80);
}
