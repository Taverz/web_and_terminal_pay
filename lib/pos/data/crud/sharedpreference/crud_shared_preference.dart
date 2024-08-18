import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_and_terminal_pay/pos/data/crud/crud.dart';

class SharedPreferencesCRUD implements CRUDInterface {
  SharedPreferences? _prefs;
  String? _key;

  @override
  Future<void> init(String key) async {
    _prefs = await SharedPreferences.getInstance();
    _key = key;
  }

  @override
  Future<void> putMap(Map<String, dynamic> value) async {
    _ensureKeyIsSet();
    final jsonString = json.encode(value);
    await _prefs?.setString(_key!, jsonString);
  }

  @override
  Future<void> putList(List<dynamic> value) async {
    _ensureKeyIsSet();
    final stringList = value.map((e) => json.encode(e)).toList();
    await _prefs?.setStringList(_key!, stringList);
  }

  @override
  Future<void> updateMap(Map<String, dynamic> value) async {
    _ensureKeyIsSet();
    final currentMap = await getAllMap();
    currentMap.addAll(value);
    await putMap(currentMap);
  }

  @override
  Future<void> updateList(List<dynamic> value) async {
    _ensureKeyIsSet();
    final currentList = await getAllList();
    currentList.addAll(value);
    await putList(currentList);
  }

  @override
  Future<void> deleteElementFromList(dynamic element) async {
    _ensureKeyIsSet();
    final currentList = await getAllList();
    currentList.remove(element);
    await putList(currentList);
  }

  @override
  Future<void> deleteElementFromMap(String mapKey) async {
    _ensureKeyIsSet();
    final currentMap = await getAllMap();
    currentMap.remove(mapKey);
    await putMap(currentMap);
  }

  @override
  Future<dynamic> getElementFromMap(String mapKey) async {
    _ensureKeyIsSet();
    final currentMap = await getAllMap();
    return currentMap[mapKey];
  }

  @override
  Future<dynamic> getElementFromList(int index) async {
    _ensureKeyIsSet();
    final currentList = await getAllList();
    if (index < currentList.length) {
      return currentList[index];
    }
    return null;
  }

  @override
  Future<List<dynamic>> getAllList() async {
    _ensureKeyIsSet();
    final stringList = _prefs?.getStringList(_key!);
    if (stringList != null) {
      return stringList.map((e) => json.decode(e)).toList();
    }
    return [];
  }

  @override
  Future<Map<String, dynamic>> getAllMap() async {
    _ensureKeyIsSet();
    final jsonString = _prefs?.getString(_key!);
    if (jsonString != null) {
      return json.decode(jsonString);
    }
    return {};
  }

  @override
  Future<void> setParameter(String key, dynamic value) async {
    if (value is int) {
      await _prefs?.setInt(key, value);
    } else if (value is double) {
      await _prefs?.setDouble(key, value);
    } else if (value is bool) {
      await _prefs?.setBool(key, value);
    } else if (value is String) {
      await _prefs?.setString(key, value);
    } else if (value is List<String>) {
      await _prefs?.setStringList(key, value);
    }
  }

  @override
  Future<dynamic> getParameter(String key) async {
    return _prefs?.get(key);
  }

  void _ensureKeyIsSet() {
    if (_key == null) {
      throw Exception(
          "SharedPreferencesORM key is not initialized. Call init(key) first.");
    }
  }
}
