import 'package:shared_preferences/shared_preferences.dart';

// Example to store data
Future<void> saveUserData(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}
