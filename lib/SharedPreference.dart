import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static SharedPreferences? prefs;

  static String token = 'token';
  static String merchantAccountStatus = 'merchantAccountStatus';
  static String isclub = 'club';
  static String isCoach = 'Coach';
  static String isOrganizer = 'Organizer';
  static String isPlayerParent = 'playerparent';
  static String isParent = 'parent';
  static String isStaff = 'staff';
  static String eventid = 'eventid';
  static String teamId = 'eventid';
  static String fcmtoken = 'fcmtoken';

  static addStringToSF(String key, String value) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setString(key, value);
  }

  static addIntToSF(String key, int value) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setInt(key, value);
  }

  static addBoolToSF(String key, bool value) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setBool(key, value);
  }

  static Future<String> getStringValuesSF(String key) async {
    prefs = await SharedPreferences.getInstance();
    String? getString = prefs!.getString(key);
    return (getString != null) ? getString : '';
  }

  static Future<int> getIntValuesSF(String key) async {
    prefs = await SharedPreferences.getInstance();
    int? getString = prefs!.getInt(key);
    return (getString != null) ? getString : 0;
  }

  static Future<bool> getBoolValuesSF(String key) async {
    prefs = await SharedPreferences.getInstance();
    bool? getbool = prefs!.getBool(key);
    return (getbool != null) ? getbool : false;
  }

  static Future<bool> removeValues(String key) async {
    prefs = await SharedPreferences.getInstance();
    return await prefs!.remove(key);
  }

  static dynamic containsKey(String key) async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.get(key);
  }

  static Future<bool> removePrefs() async {
    prefs = await SharedPreferences.getInstance();
    return await prefs!.clear();
  }
}
