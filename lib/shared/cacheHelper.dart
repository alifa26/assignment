import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CachHelper {
  static SharedPreferences? sharedpreferences;
  static init() async{
    sharedpreferences = await SharedPreferences.getInstance();
  //// await sharedpreferences!.setBool('firstTime', false);
  }

  static Future<bool> putData({
    @required String? key,
    @required bool? value
  }
  )async{
   return await sharedpreferences!.setBool(key!, value!);
  }
  static bool? getData({@required String? key}){
    return sharedpreferences!.getBool(key!);
  }
}