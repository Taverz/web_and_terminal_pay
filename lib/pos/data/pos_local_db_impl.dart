// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:web_and_terminal_pay/crud/crud.dart';
import 'package:web_and_terminal_pay/pos/data/pos_local_db.dart';
import 'package:web_and_terminal_pay/service/model/transaction_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_and_terminal_pay/service/model/organization_pos_terminal_model.dart';
import 'package:web_and_terminal_pay/service/model/pos_settings_model.dart';

class SberLocalDB implements PosOperationDB {
  final String _keySettingsSberShared = 'sber_settings_shared';
  final String _keyOrganizationSberShared = 'sber_organization_shared';
  final String _keyCheckShared = 'sber_refund_shared';

  // SharedPreferences? sharedInit;
  final CRUDInterface sberSettings;
  final CRUDInterface organizationSber;
  final CRUDInterface checkSber;

  SberLocalDB(
    this.sberSettings,
    this.organizationSber,
    this.checkSber,
  );

  Future<void> init() async {
    await sberSettings.init(_keySettingsSberShared);
    await organizationSber.init(_keyOrganizationSberShared);
    await checkSber.init(_keyCheckShared);
  }

  @override
  Future<bool> saveSettingsTerminal(PosSettingsModel model) async {
    await sberSettings.setParameter(
      jsonEncode(model.toJson()),
    );
    return true;
  }

  @override
  Future<PosSettingsModel?> getSettingsTerminal() async {
    final data = await sberSettings.getAllMap();
    if (data.isEmpty) {
      return null;
    }
    return PosSettingsModel.fromJson(data);
  }

  @override
  Future<bool> deleteSettingsTerminal() async {
    await sberSettings.deleteMap();
    return true;
  }

  @override
  Future<bool> deleteAllOrganization() async {
    await organizationSber.deleteMap();
    return true;
  }

  @override
  Future<List<OrganizationPosTerminalSber>?> getAllOrganization() async {
    final data = await organizationSber.getAllList();
    if (data.isEmpty) {
      return null;
    }
    return data
        .map((value) => OrganizationPosTerminalSber.fromJson(value))
        .toList();
  }

  @override
  Future<bool> saveNewOrganization(OrganizationPosTerminalSber model) async {
    final data = await organizationSber.getAllList();
    List<OrganizationPosTerminalSber> organizations = [];
    if (data.isNotEmpty) {
      final List<dynamic> jsonList = data;
      organizations = jsonList
          .map((json) => OrganizationPosTerminalSber.fromJson(json))
          .toList();
    }
    final organizationsSet = organizations.toSet();
    organizationsSet.add(model);
    await organizationSber.updateList(
      organizationsSet.map((org) => org.toJson()).toList(),
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
