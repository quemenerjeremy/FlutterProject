import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUser {
  saveUser(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("userData", json.encode(value));
    print("saveUser SharedUserData");
  }

  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = jsonDecode(prefs.getString("userData"));
    print("getUser SharedUserData");
    print(value);
    return value;
  }
}