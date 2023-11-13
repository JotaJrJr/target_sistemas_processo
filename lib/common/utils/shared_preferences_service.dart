import 'package:shared_preferences/shared_preferences.dart';
import 'package:target_sistemas_prova/common/models/user_model.dart';

class SharedPreferencesService {
  bool firstTime = false;

  static final SharedPreferencesService _singleton = SharedPreferencesService._internal();

  factory SharedPreferencesService() {
    return _singleton;
  }

  SharedPreferencesService._internal();

  Future<void> initialize() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // firstTime = prefs.getBool("first_time") ?? true;
  }

  Future<bool> saveStringPreference(String name, String save) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool result = await prefs.setString(name, save);

    return result;
  }

  Future<bool> saveBoolPreference(String name, bool save) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool result = await prefs.setBool(name, save);

    return result;
  }

  Future<bool> saveIntPreference(String name, int save) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool result = await prefs.setInt(name, save);

    return result;
  }

  Future<bool> saveDoublePreference(String name, double save) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool result = await prefs.setDouble(name, save);

    return result;
  }

  Future<bool> saveApp(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var result = prefs.setBool('first_time', value);

    firstTime = value;

    return result;
  }

  UserModel getUser() {
    return UserModel(
      user: "",
      email: "EMAIL",
      isLogged: true,
    );
  }

  Future<bool> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.clear();
  }
}
