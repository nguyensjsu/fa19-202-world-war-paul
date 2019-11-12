<pre>
UseFULL code
1. Load Picture Images
  a. PNG/JPG file
    PImage img;
    img = loadImage("img/logo.png");  //file destination for file name logo.png
    image(img,55,450,100,100);      //Draw at coordinate (55, 450) at size 100 x 100

  b. SVG File
    PShape img;
    img = loadShape("img/ad-solid.svg");  //file destination for file name ad-solid.svg
    shape(bot, 110, 90, 100, 100);  // Draw at coordinate (110, 90) at size 100 x 100

2. Write Change Text Size/Color
  textSize(32);    //text size = 32
  fill(0, 102, 153, 51);   //file color with RGB = 0, 102, 153 and transparency 51
  text("word", 10, 90);    //print "word" in coordinate (10,90)


3. Draw Rectangular with different collor
    fill(v1, v2, v3);   //fill the color of the rectangular, v1 v2 v3 = RGB color value
    stroke(v1, v2, v3);  //set the color of the boarder
    rectMode(CENTER);  //Different mode to select
    rect(340,40,60,30);  // (x,y) = (340, 40)  size = (60,30)

4. Draw Thick BASELINE
    strokeWeight(2);  //thick = 2
    stroke(0, 0, 247);  // color of the line = (0,0,247) RGB value
    line(x-7, y-8, x, y); //draw line start from (x-7, y-8) to (x, y)


Documentation:
a. TextAlign
      textAlign(alignX)
      textAlign(alignX, alignY)
    Parameters
      alignX	int: horizontal alignment, either LEFT, CENTER, or RIGHT
      alignY	int: vertical alignment, either TOP, BOTTOM, CENTER, or BASELINE
    EX:
      textAlign(CENTER, CENTER) //all text is center

b. Rect
    rect(a, b, c, d)
    rect(a, b, c, d, r)  
    rect(a, b, c, d, tl, tr, br, bl)  

    a	float: x-coordinate of the rectangle by default
    b	float: y-coordinate of the rectangle by default
    c	float: width of the rectangle by default
    d	float: height of the rectangle by default
    r	float: radii for all four corners
    tl	float: radius for top-left corner
    tr	float: radius for top-right corner
    br	float: radius for bottom-right corner
    bl	float: radius for bottom-left corner
  Ex: rect(30, 20, 100, 100, 10) //(30,20)= coordinate, (100,100) = size
        , all corner are curve with raius = 10

c. Fill
(Fill color inside the shape)
    fill(rgb)
    fill(rgb, alpha)
    fill(gray)
    fill(gray, alpha)
    fill(v1, v2, v3)
    fill(v1, v2, v3, alpha)
  Parameters
    rgb	int: color variable or hex value
    alpha	float: opacity of the fill
    gray	float: number specifying value between white and black
    v1	float: red or hue value (depending on current color mode)
    v2	float: green or saturation value (depending on current color mode)
    v3	float: blue or brightness value (depending on current color mode)

7. Stroke
(Fill the boarder of the shape)
    stroke(rgb)
    stroke(rgb, alpha)
    stroke(gray)
    stroke(gray, alpha)
    stroke(v1, v2, v3)
    stroke(v1, v2, v3, alpha)
  Parameters
    rgb	int: color value in hexadecimal notation
    alpha	float: opacity of the stroke
    gray	float: specifies a value between white and black
    v1	float: red or hue value (depending on current color mode)
    v2	float: green or saturation value (depending on current color mode)
    v3	float: blue or brightness value (depending on current color mode)
 <pre>
