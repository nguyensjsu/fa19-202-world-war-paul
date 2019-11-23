# SJSU Fall 2019 CS 202 Hackathon Project

## Team Name
World War Paul

## Project Name
World War Food: Mobile Food Ordering

## Team Members & Journals
Kun Su
Sung-Yin Yang
Taylor Yang
Zijian Guan
Ru Zhang

## Dependency
To run our application correctly, you need to install the following dependency.

[Here is the link to download GSON.jar]
(https://jar-download.com/artifacts/com.google.code.gson/gson/2.8.2/source-code)

[Here is the link to download Processing]
(https://processing.org/download/)

[Here is the link about how to add the library to Processing]
(https://github.com/processing/processing/wiki/How-to-Install-a-Contributed-Library)

## Project Description
Use World War Food mobile ordering to preorder meals from your favorite spots on campus, and pay using your credit/debit card or meal plan. Just pull out your phone and pick your current food craving, customize your meal, and choose a pickup time that works best for you!

## Presentation

[World War Paul Presentation]

[World War Paul Presentation AD Video]

## Project Progress (Agile)

### Burndown Map

https://docs.google.com/spreadsheets/d/1RTbq7yntsJt69ADQimevnhguH2hgphhL/edit#gid=2134553984

## Individual Contributions

### Kun Su
### Sung-Yin Yang
### Taylor Yang
1. Design and develop the overall screen flows between each screens. For example, how do one screen connected to the other screen and how to switch between screens.
2. Polish homepage, button, Store Screen, Order Screen and all connected screens in order the flows between all screens are correct and smooth. 
3. Use ```Command```Pattern to control the menu bar and switch from home screen,  order history screen and account screen.
4. Use ```Composite```Pattern to add leaf components to the screen. 
5. Use ```Chain of Responsibility```Pattern to pass requests along the chain of handlers. So that the display and touch functionalities made by buttons can make the screens switch become possible and make sense.   
6. Use ```Proxy```Pattern to control access to the original screen flows or stay in the login screen.
7. Gathered and provided suitable images for the project.
8. Produce and edit the demo videos needed in presentation.
9. Edit and produce all team meeting videos and keep them updated.
10. Write the slides for the presentation for the demo day.

### Zijian Guan
### Ru Zhang

## Overall Activity Diagram

<img src="Activity Diagram.svg">

# Class Diagram

## Class Diagram Chain of Responsibility Pattern

<img src="Chain of Responsibility Class Diagram.svg">

## Class Diagram Composite Pattern

<img src="Composite Class Diagram.svg">

## Class Diagram State Pattern

<img src="State Class Diagram.svg">

## Class Diagram Commmand Pattern

<img src="Commmand Class Diagram.svg">

## Class Diagram Observer Pattern

<img src="Observer Class Diagram.svg">

# Use Case Specification

## Documentation

## Use Case - Login

<img src="Login Squence Diagram.svg">

## Use Case - Add Credit Card

<img src="Add Card Sequence Diagram.svg">

## Use Case - View Store Page

<img src="View Store Sequence Diagram.svg">

## Use Case - Place An Order

<img src="Place An Order Sequence Diagram.svg">

## Use Case - View Order History

<img src="View Order History Sequence Diagram.svg">

## Use Case - View Acconut Information

<img src="View Acconut Information Sequence Diagram.svg">