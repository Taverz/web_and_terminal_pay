import 'package:web_and_terminal_pay/service/model/transaction_model.dart';
import 'package:web_and_terminal_pay/service/model/pos_settings_model.dart';

/// Работа с терминалом по локальной сети
abstract class PayTerminal {
  dynamic get currentSession;
  Future<void> init();
  Future<void> setSettingsJson(Map<String, dynamic> json);
  Future<void> setSettingsObject(PosSettingsModel settingsModel);
  Future<void> resetSettings();
  Future<Object?> getSettings();
  Future<void> connect();
  Future<void> disconnect();
  Future<void> abortPay();
  Future<void> refoundPay();
  Future<dynamic> createPay(dynamic paymentModel);

  /// Сверка итогов
  /// * Рекомендуется выполнять сверку автоматически перед снятием Z-отчета.
  /// В системах без Z-отчетов сверка также может выполняться автоматически
  /// с интервалом от 3 до 24 часов. Если сверка запускается вручную,
  /// ее обязательность должна быть указана в инструкции кассира​​.
  Future<String?> reconciliationOfResults();
  Future<String?> checkStatusCurrentOperation();
  Future<List?> getAllOrganization();
  Future<List<TransactionTerminalMain>?> getAllTransaction();
  Future<bool> selectOrganization(Object organization);
  Future<bool> addOrganization(Object organization);
  Future<void> clearSession();
  Future<void> menuCall();
  Future<void> close();
}
