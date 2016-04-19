
SettingsJson settings;

void setup() {
  
  size(400,400);
  settings = new SettingsJson("settings.json");
  
  println("serialport "+ settings.getString("serialport","test") );
  
  settings.save();
}


void draw() {
  
  
}