import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PersistentStorage {
  PersistentStorage._internal();

  factory PersistentStorage() => _instance;

  static late final PersistentStorage _instance = PersistentStorage._internal();

  static late SharedPreferences _preferences;

  static Future<PersistentStorage> getInstance() async {
    //SharedPreferences 单列的
    _preferences = await SharedPreferences.getInstance();

    return _instance;
  }

  // /// 是否包含某个key
  Future<bool> hasKey(String key) async {
    return _preferences.containsKey(key);
  }

//  static void _sharedPreferences() async {

//  _preferences = await SharedPreferences.getInstance();

//   }

  /// 通用设置持久化数据
  setLocalStorage<T>(String key, T value) {
    String type = value.runtimeType.toString();

    switch (type) {
      case "String":
        _preferences.setString(key, value as String);
        break;
      case "int":
        _preferences.setInt(key, value as int);
        break;
      case "bool":
        _preferences.setBool(key, value as bool);
        break;
      case "double":
        _preferences.setDouble(key, value as double);
        break;
      case "List<String>":
        _preferences.setStringList(key, value as List<String>);
        break;
      // case "_InternalLinkedHashMap<String, String>":
      //   _preferences.set(key, value as Map);
      //   break;
    }
  }

  /// 获取持久化数据
  /// 获取持久化数据
  dynamic getLocalStorage<T>(String key) {
    dynamic value = _preferences.get(key);

    if (value == null) return null;
    if ( _isJson(value)) {
      return JsonDecoder().convert(value);
    } else {
      // 不是 则直接返回
      return value;
    }
   
  }

  // /// 删除key指向的存储 如果key存在则删除并返回true，否则返回false
  Future<bool> removeStorage(String key) async {
    if (await hasKey(key)) {
      await _preferences.remove(key);
      return true;
    } else {
      return false;
    }
    // return  _storage.remove(key);
  }

  // /// 清空存储 并总是返回true
  Future<bool> clear() async {
    _preferences.clear();
    return true;
  }

  // /// 获取所有的key 类型为Set<String>
  Future<Set<String>> getKeys() async {
    return _preferences.getKeys();
  }

  // // 判断是否是JSON字符串
  _isJson(dynamic value) {
    try {
      // 如果value是一个json的字符串 则不会报错 返回true
      JsonDecoder().convert(value);
      return true;
    } catch (e) {
      // 如果value不是json的字符串 则报错 进入catch 返回false
      return false;
    }
  }
}
