import processing.serial.*;

/**
 * ControlP5 snapshot
 *
 * this example shows how to use the snapshot methods for ControllerProperties.
 * Snapshots allow you to save controller states in memory, recall, save and remove them.
 *
 * find a list of public methods available for the ControllerProperties Controller
 * at the bottom of this sketch.
 *
 * by Andreas Schlegel, 2012
 * www.sojamo.de/libraries/controlp5
 *
 */

DropdownList serialDropdownList;   

String[] ports;


import controlP5.*;
ControlP5 cp5;

public float n = 50;
public float s = 10;
public float k = 100;



void setup() {
  size(400, 400);
  smooth();
  cp5 = new ControlP5(this);




  cp5.addKnob("k")
  .setPosition(200, 100)
  .setRadius(50)
  .setScrollSensitivity(0.001)
  .setMin(60)
  .setMax(140)
  .setDisplayStyle(Controller.ARC)
  ;

  cp5.addRange("r")
  .setPosition(10,200)
  .setSize(100,20)
  .setRange(0, 200)
  ;
  
  serialDropdownList = cp5.addDropdownList("list-1",10,25,100,84); 
  
  populateDropdownList(serialDropdownList);
} 

//here we setup the dropdown list.
void populateDropdownList(DropdownList ddl) {
  //Set the background color of the list (you wont see this though).
  ddl.setBackgroundColor(color(200));
  //Set the height of each item when the list is opened.
  ddl.setItemHeight(20);
  //Set the height of the bar itself.
  ddl.setBarHeight(15);
  //Set the lable of the bar when nothing is selected.
  ddl.getCaptionLabel().set("Select COM port");
  //Set the top margin of the lable.
  ddl.getCaptionLabel().getStyle().marginTop = 3;
  //Set the left margin of the lable.
  ddl.getCaptionLabel().getStyle().marginLeft = 3;
  //Set the top margin of the value selected.
  ddl.getValueLabel().getStyle().marginTop = 3;
  //Store the Serial ports in the string comList (char array).
  ports = Serial.list();

  //Now well add the ports to the list, we use a for loop for that. How many items is determined by the value of size1.
  for(int i=0; i< ports.length ; i++)
  {
    //This is the line doing the actual adding of items, we use the current loop we are in to determin what place in the char array to access and what item number to add it as.
    ddl.addItem(ports[i],i);
  }
  //Set the color of the background of the items and the bar.
  ddl.setColorBackground(color(60));
  //Set the color of the item your mouse is hovering over.
  ddl.setColorActive(color(255,128));
} 



void draw() {
  background(0);
}


void keyPressed() {
  switch(key) {
    case('1'):
    cp5.getProperties().setSnapshot("hello1");
    break;
    case('2'):
    cp5.getProperties().setSnapshot("hello2");
    break;
    case('3'):
    cp5.getProperties().setSnapshot("hello3");
    break;

    case('a'):
    cp5.getProperties().getSnapshot("hello1");
    break;
    case('s'):
    cp5.getProperties().getSnapshot("hello2");
    break;
    case('d'):
    cp5.getProperties().getSnapshot("hello3");
    break;
    
    case('z'):
    cp5.getProperties().removeSnapshot("hello1");
    break;
    case('x'):
    cp5.getProperties().removeSnapshot("hello2");
    break;
    case('c'):
    cp5.getProperties().removeSnapshot("hello3");
    break;
    
    case('i'):
    cp5.getProperties().saveSnapshot("hello1");
    break;
    case('o'):
    cp5.getProperties().load("hello1.ser");
    break;
  }

  println(cp5.getProperties().getSnapshotIndices());
}


public void controlEvent(ControlEvent theEvent) {
  println("got a control event from controller with name "+theEvent.getController().getName() + " " + theEvent.getController().getValue() );
 
}


/*
a list of all methods available for the ControllerProperties Controller
use ControlP5.printPublicMethodsFor(ControllerProperties.class);
to print the following list into the console.

You can find further details about class ControllerProperties in the javadoc.

Format:
ClassName : returnType methodName(parameter type)


controlP5.ControllerProperties : ArrayList getSnapshotIndices() 
controlP5.ControllerProperties : ControllerProperties addSet(String) 
controlP5.ControllerProperties : ControllerProperties delete(ControllerProperty) 
controlP5.ControllerProperties : ControllerProperties getSnapshot(String) 
controlP5.ControllerProperties : ControllerProperties move(ControllerInterface, String, String) 
controlP5.ControllerProperties : ControllerProperties move(ControllerProperty, String, String) 
controlP5.ControllerProperties : ControllerProperties only(ControllerProperty, String) 
controlP5.ControllerProperties : ControllerProperties print() 
controlP5.ControllerProperties : ControllerProperties register(ControllerInterface, String) 
controlP5.ControllerProperties : ControllerProperties remove(ControllerInterface) 
controlP5.ControllerProperties : ControllerProperties remove(ControllerInterface, String) 
controlP5.ControllerProperties : ControllerProperties remove(ControllerInterface, String, String) 
controlP5.ControllerProperties : ControllerProperties removeSnapshot(String) 
controlP5.ControllerProperties : ControllerProperties saveSnapshot(String) 
controlP5.ControllerProperties : ControllerProperties saveSnapshotAs(String, String) 
controlP5.ControllerProperties : ControllerProperties setSnapshot(String) 
controlP5.ControllerProperties : ControllerProperties updateSnapshot(String) 
controlP5.ControllerProperties : ControllerProperty getProperty(ControllerInterface, String) 
controlP5.ControllerProperties : ControllerProperty getProperty(ControllerInterface, String, String) 
controlP5.ControllerProperties : ControllerProperty register(ControllerInterface, String, String) 
controlP5.ControllerProperties : HashSet getPropertySet(ControllerInterface) 
controlP5.ControllerProperties : List get(ControllerInterface) 
controlP5.ControllerProperties : Map get() 
controlP5.ControllerProperties : String toString() 
controlP5.ControllerProperties : boolean load() 
controlP5.ControllerProperties : boolean load(String) 
controlP5.ControllerProperties : boolean save() 
controlP5.ControllerProperties : boolean saveAs(String) 
controlP5.ControllerProperties : void setFormat(Format) 
java.lang.Object : String toString() 
java.lang.Object : boolean equals(Object) 


*/