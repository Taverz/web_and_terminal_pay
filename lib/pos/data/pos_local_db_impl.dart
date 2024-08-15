// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:web_and_terminal_pay/pos/data/pos_local_db.dart';
import 'package:web_and_terminal_pay/service/model/transaction_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_and_terminal_pay/service/model/organization_pos_terminal_model.dart';
import 'package:web_and_terminal_pay/service/model/pos_settings_model.dart';

class SberLocalDB implements PosOperationDB {
  final String _keySettingsSberShared = 'sber_settings_shared';
  final String _keyOrganizationSberShared = 'sber_organization_shared';
  final String _keyCheckShared = 'sber_refund_shared';

  SharedPreferences? sharedInit;

  Future<void> init() async {
    final shared = await SharedPreferences.getInstance();
    sharedInit = shared;
  }

  @override
  Future<bool> saveSettingsTerminal(PosSettingsModel model) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(
      _keySettingsSberShared,
      jsonEncode(model.toJson()),
    );
    return true;
  }

  @override
  Future<PosSettingsModel?> getSettingsTerminal() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final data = sharedPreferences.getString(_keySettingsSberShared);
    if (data == null) {
      return null;
    }
    return PosSettingsModel.fromJson(jsonDecode(data));
  }

  @override
  Future<bool> deleteSettingsTerminal() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(_keySettingsSberShared);
    return true;
  }

  @override
  Future<bool> deleteAllOrganization() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(_keyOrganizationSberShared);
    return true;
  }

  @override
  Future<List<OrganizationPosTerminalSber>?> getAllOrganization() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final data = sharedPreferences.getString(_keyOrganizationSberShared);
    if (data == null) {
      return null;
    }
    final List<dynamic> jsonList = jsonDecode(data);
    return jsonList
        .map((json) => OrganizationPosTerminalSber.fromJson(json))
        .toList();
  }

  @override
  Future<bool> saveNewOrganization(OrganizationPosTerminalSber model) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final data = sharedPreferences.getString(_keyOrganizationSberShared);
    List<OrganizationPosTerminalSber> organizations = [];
    if (data != null) {
      final List<dynamic> jsonList = jsonDecode(data);
      organizations = jsonList
          .map((json) => OrganizationPosTerminalSber.fromJson(json))
          .toList();
    }
    final organizationsSet = organizations.toSet();
    organizationsSet.add(model);
    await sharedPreferences.setString(
      _keyOrganizationSberShared,
      jsonEncode(organizationsSet.map((org) => org.toJson()).toList()),
    );
    return true;
  }

  @override
  Future<bool> saveTransaction({
    required TransactionTerminal mapCurrentCheck,
    required String idCheck,
  }) async {
    final allCheck = await getAllChecks();
    allCheck[idCheck] = mapCurrentCheck.toMap();
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_keyCheckShared, jsonEncode(allCheck));
    return true;
  }

  @override
  Future<TransactionTerminal> getIdTransaction({
    required String idCheck,
  }) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final data = sharedPreferences.getString(_keyCheckShared);
    if (data == null) {
      throw Exception('Empty');
    }
    final map = (jsonDecode(data) as Map);
    return TransactionTerminal.fromMap(
        map.values.firstWhere((element) => element['id'] == idCheck)
            as Map<String, dynamic>);
  }

  @override
  Future<Map> deleteTransaction({required String idCheck}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final data = sharedPreferences.getString(_keyCheckShared);
    if (data == null) {
      throw Exception('Empty');
    }
    final map = (jsonDecode(data) as Map);
    map.removeWhere((key, value) => value['id'] == idCheck);
    await sharedPreferences.setString(_keyCheckShared, jsonEncode(map));
    return map;
  }

  @override
  Future<bool> deleteAllTransaction() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final data = await sharedPreferences.remove(_keyCheckShared);
    return data;
  }

  @override
  Future<Map<String, dynamic>> getAllChecks() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final data = sharedPreferences.getString(_keyCheckShared);
    if (data == null) {
      return {};
    }
    return (jsonDecode(data) as Map<String, dynamic>);
  }

  @override
  Future<bool> clearAllCheck() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_keyCheckShared, jsonEncode({}));
    return true;
  }

  @override
  Future<List<TransactionTerminalMain>> getAllTransaction() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final data = sharedPreferences.getString(_keyCheckShared);
    if (data == null) {
      return [];
    }
    final listMap = jsonDecode(data) as Map<String, dynamic>;
    final convert = listMap.entries.map((entry) {
      return TransactionTerminalMain(
        id: entry.key,
        transactionTerminal: TransactionTerminal.fromMap(entry.value),
      );
    }).toList();
    return convert;
  }
}
