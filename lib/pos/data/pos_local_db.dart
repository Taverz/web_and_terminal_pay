// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:web_and_terminal_pay/service/model/transaction_model.dart';
import 'package:web_and_terminal_pay/service/model/organization_pos_terminal_model.dart';
import 'package:web_and_terminal_pay/service/model/pos_settings_model.dart';

abstract class PosOperationDB {
  // Future<void> saveTransaction();
  // Future<void> deleteTransaction();

  Future<void> init();

  Future<bool> saveSettingsTerminal(PosSettingsModel model);
  Future<PosSettingsModel?> getSettingsTerminal();
  Future<bool> deleteSettingsTerminal();

  Future<bool> saveNewOrganization(OrganizationPosTerminalSber model);
  Future<List<OrganizationPosTerminalSber>?> getAllOrganization();
  Future<bool> deleteAllOrganization();

  Future<bool> saveTransaction({
    required TransactionTerminal mapCurrentCheck,
    required String idCheck,
  });
  Future<TransactionTerminal> getIdTransaction({required String idCheck});
  Future<List<TransactionTerminalMain>> getAllTransaction();
  Future<Map> deleteTransaction({required String idCheck});
  Future<bool> deleteAllTransaction();
  Future<Map<String, dynamic>> getAllChecks();
  Future<bool> clearAllCheck();
}
