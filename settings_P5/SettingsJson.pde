

class SettingsJson {
  
  String filename;
  public JSONObject values; // first object

  
  SettingsJson( String jsonFile ) {
    filename = jsonFile;
    values = loadJSONObject(jsonFile);
    if ( values == null ) {
      println("SettingsJson : File not found");
      values = new JSONObject();
    } 
    
    
  }
  
  String getString( String key, String defaultValue ) {
    return values.getString(key,defaultValue);
  }
  
  String setString( String key, String defaultValue ) {
    return values.getString(key,defaultValue);
  }
  
  
  void save() {
    saveJSONObject(values, filename);
   
    
  }
  
}