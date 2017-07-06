import processing.serial.*;

SettingsJson settings;

String[] ports;
String currentPort;
int currentPortIndex = 0;

Serial serial;

int data;

void setup() {

  size(400, 400);
  settings = new SettingsJson("settings.json");

  ports = Serial.list();
  println(ports);

  settings.save();
}


void draw() {
  background(127);
  text(data,30,30);
}

void keyPressed() {
  if ( serial != null) {
    serial.stop();
  }
  
  currentPort = ports[currentPortIndex];// settings.getString("serialport","test") ;

 
  try {

    serial = new Serial(this, currentPort, 57600);

} catch (Exception e){

   serial = null;
   println("could not open");
}

 println("currentPort "+ currentPort); 
  
  
  currentPortIndex++;
  currentPortIndex = currentPortIndex % ports.length;
}

void serialEvent(Serial p) { 
  data = p.read();
} 