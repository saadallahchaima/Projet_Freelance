import 'package:shared_preferences/shared_preferences.dart';



class SharedPrefService {
// Example to store data
  Future<void> saveUserData(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
    print('Saved $key: $value');
  }

// Example to read data
  Future<String> readUserData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(key) ?? '';
    print('Read $key: $value');
    return value;
  }

// clear field
  Future<void> clearUserData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
    print('Removed $key');
  }

// clear all
  Future<void> clearAllUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    print('All data removed');
  }

// check values of all keys
  Future<void> checkAllValues() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    for (String key in keys) {
      final value = prefs.getString(key) ?? '';
      print('Read $key: $value');
    }
  }

}
