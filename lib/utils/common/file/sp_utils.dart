
import 'package:shared_preferences/shared_preferences.dart';

class SpUtils{

  Future putStringValue(String key,dynamic value) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    switch(value.runtimeType){
      case int:
        sp.setInt(key, value);
        break;

      case String :
        sp.setString(key, value);
        break;

      case double:
        sp.setDouble(key, value);
        break;

      case bool:
        sp.setBool(key, value);
        break;
    }
  }

  Future<dynamic> getStringValue(String key) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.get(key);
  }

}