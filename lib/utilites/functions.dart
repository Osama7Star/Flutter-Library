import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Functions {
  static String getDate() {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }
}

/// WORKING WITH SHARED PREFERENCES TO CHECK USER AUTHENTICATION

addNameToSharedPreference(String name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('name', name);
}

addUserIdToSharedPreference(String id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('userId', id);
}

addStatusToSharedPreference(bool status) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('status', status);
}

/// GET

getName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String name = prefs.getString('name');
  return name;
}

getUserId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String userId = prefs.getString('userId');
  return userId;
}

getStatus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String status = prefs.getString('status');
  return status;
}

class UserSimplePreferences {
  static SharedPreferences _preferences;

  static const _keyName = 'name';
  static const _keyUserId = 'userId';
  static const _keyStatus = 'status';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setName(String name) async =>
      await _preferences.setString(_keyName, name);

  static String getName() => _preferences.getString(_keyName);



  static Future setUserId(String userId) async =>
      await _preferences.setString(_keyUserId, userId);

  static String getUserId() => _preferences.getString(_keyUserId);




  static Future setStatus(String status) async =>
      await _preferences.setString(_keyStatus, status);

  static String getStatus() => _preferences.getString(_keyStatus);
}
