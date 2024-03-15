import 'package:shared_preferences/shared_preferences.dart';

class YelpLocalData {
  static late SharedPreferences prefs;
  static Future<void> sharedInit() async {
    // Obtain shared preferences.
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> userCardentials({
    required String username,
    required String password,
  }) async {
    await prefs.setString("username", username);
    await prefs.setString("password", password);
  }

  static String? getUsername() {
    return prefs.getString("username");
  }

  static String? getPassword() {
    return prefs.getString("password");
  }
}
