import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  static setStringList(key, data) async {
    final SharedPreferences prefs = GetIt.instance.get();
    List datas = getData(key);
    datas.add(data);
    await prefs.setString(key, json.encode(datas));
  }

  static Future setData(key, data) async {
    final SharedPreferences prefs = GetIt.instance.get();
    await prefs.setString(key, json.encode(data));
  }

  static getData(key) {
    final SharedPreferences prefs = GetIt.instance.get();
    final value = prefs.getString(key);
    if (value != null) {
      return json.decode(value);
    } else {
      return "";
    }
  }

  static setIntData(key, data) async {
    final SharedPreferences prefs = GetIt.instance.get();
    await prefs.setInt(key, data);
  }

  static getIntData(key) {
    final SharedPreferences prefs = GetIt.instance.get();
    final value = prefs.getInt(key);
    if (value != null) {
      return value;
    } else {
      return -1;
    }
  }

  static clearData() async {
    final SharedPreferences prefs = GetIt.instance.get();
    await prefs.clear();
  }

  static removeKey(key) async {
    final SharedPreferences prefs = GetIt.instance.get();
    prefs.remove(key);
  }
}
