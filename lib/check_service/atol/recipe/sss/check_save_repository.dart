import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CheckSaveRepository {
  CheckSaveRepository();

  final _keyCheckShared = 'check_shared';

  Future<bool> saveOneCheck({
    required Map<String, dynamic> mapCurrentCheck,
    required String idCheck,
  }) async {
    final allCheck = await getAllChecks();
    allCheck[idCheck] = mapCurrentCheck;
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_keyCheckShared, jsonEncode(allCheck));
    return true;
  }

  Future<Map> getIdCheck({required String idCheck}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final data = sharedPreferences.getString(_keyCheckShared);
    if (data == null) {
      throw Exception('Empty');
    }
    final map = (jsonDecode(data) as Map);
    map.remove(idCheck);
    await sharedPreferences.setString(_keyCheckShared, jsonEncode(map));
    return map;
  }

  Future<Map> deleteIdCheck({required String idCheck}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final data = sharedPreferences.getString(_keyCheckShared);
    if (data == null) {
      throw Exception('Empty');
    }
    final map1 = (jsonDecode(data) as Map);
    final map = map1;
    map.removeWhere((element, value) => value['id'] == idCheck);
    await sharedPreferences.setString(_keyCheckShared, jsonEncode(map));
    return map; //map.values.firstWhere((element) => element['id'] == idCheck);
  }

  Future<Map<String, dynamic>> getAllChecks() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final data = sharedPreferences.getString(_keyCheckShared);
    if (data == null) {
      return {};
    }
    final map = (jsonDecode(data) as Map<String, dynamic>);
    return map;
  }

  Future<bool> clearAllCheck() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_keyCheckShared, jsonEncode({}));
    return true;
  }
}
