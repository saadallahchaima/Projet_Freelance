import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveUserData(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
  print('Saving: $key : $value');
  print('verif : $key :  ${prefs.getString(key)}');

}
