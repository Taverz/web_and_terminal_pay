import 'package:web_and_terminal_pay/pos/pay_terminal.dart';
import 'package:web_and_terminal_pay/service/entity/transaction_history.dart';
import 'package:web_and_terminal_pay/pos/mappers/date_pos_mapper.dart';
import 'package:web_and_terminal_pay/service/model/current_operation_model.dart';
import 'package:web_and_terminal_pay/service/model/organization_pos_terminal_model.dart';
import 'package:web_and_terminal_pay/pos/model/pay/get/get_pos_payment_model.dart';
import 'package:web_and_terminal_pay/pos/model/pay/send/send_pos_payment_model.dart';
import 'package:web_and_terminal_pay/pos/data/pos_local_db.dart';
import 'package:web_and_terminal_pay/service/model/transaction_model.dart';
import 'package:pos_payment_terminal/pos_payment_terminal.dart';
import 'package:web_and_terminal_pay/service/model/pos_settings_model.dart';

/// Для оплаты через этот терминал, был создан отдельный класс, потому что он имеет свои особенности.
class PaymentSberTerminalKozenP12 implements PayTerminal {
  final PosOperationDB sberLocalDB;
  final PosMapper mapper;
  final PosSettingsModel posSettingsModel;
  late final POSPaymentModule posModule;
  final List<OrganizationPosTerminalSber>? organizations;
  PaymentSberTerminalKozenP12({
    required this.sberLocalDB,
    this.mapper = const PosMapper(),
    required this.posSettingsModel,
    this.organizations,
  });

  CurrentOperation _currentOperation = CurrentOperation.empty();

  dynamic get currentSession => _currentOperation;
  //TODO: value listenable currentSession

  @override
  Future<void> init() async {
    final settingsModel =
        posSettingsModel; //await sberLocalDB.getSettingsTerminal();
    // if (settingsModel == null) {
    //   throw Exception('No settings');
    // }
    posModule = POSPaymentModule(
      ip: settingsModel.terminalIP,
      port: settingsModel.terminalPort,
    );
  }

  @override
  Future<void> setSettingsJson(Map<String, dynamic> json) async {
    final settingsModel = PosSettingsModel.fromJson(json);
    await sberLocalDB.saveSettingsTerminal(settingsModel);
  }

  @override
  Future<void> setSettingsObject(PosSettingsModel settingsModel) async {
    final value = settingsModel;
    await sberLocalDB.saveSettingsTerminal(value);
  }

  @override
  Future<Object?> getSettings() async {
    final result = await sberLocalDB.getSettingsTerminal();
    return result;
  }

  @override
  Future<List?> getAllOrganization() async {
    return await sberLocalDB.getAllOrganization();
  }

  @override
  Future<List<TransactionTerminalMain>?> getAllTransaction() async {
    return await sberLocalDB.getAllTransaction();
  }

  @override
  Future<void> menuCall() async {
    await posModule.connect();
    await posModule.createService(
      organizationCode: _currentOperation.selectOrganization?.number,
      clientId: _currentOperation.currentClientId,
      idempotenceKeyERN: _currentOperation.idempotenceKeyERN,
      operationServiceType: OperationServiceType.CALL_APP_MENU,
    );
    await posModule.disconnect();
  }

  /// Сверка итогов
  @override
  Future<String?> reconciliationOfResults() async {
    await connect();
    final result = await posModule.createService(
      operationServiceType: OperationServiceType.CHECK_SUM,
      organizationCode: _currentOperation.selectOrganization?.number,
      clientId: _currentOperation.currentClientId,
      idempotenceKeyERN: _currentOperation.idempotenceKeyERN,
    );
    await disconnect();
    return result.receipt;
  }

  @override
  Future<String?> checkStatusCurrentOperation() async {
    await connect();
    final result = await posModule.checkStatus(
      organizationCode: _currentOperation.selectOrganization?.number,
      clientId: _currentOperation.currentClientId,
      idempotenceKeyERN: _currentOperation.idempotenceKeyERN,
    );
    await disconnect();
    return result.receipt;
  }

  @override
  Future<bool> selectOrganization(Object organization) async {
    if (!(organization is OrganizationPosTerminalSber)) {
      throw Exception(
        ' No OrganizationPosTerminalSber type Object from PaymentSberTerminalKozenP12 ',
      );
    }
    final select = organization as OrganizationPosTerminalSber;
    _currentOperation = _currentOperation.copyWith(selectOrganization: select);
    return true;
  }

  @override
  Future<bool> addOrganization(Object organization) async {
    if (!(organization is OrganizationPosTerminalSber)) {
      throw Exception(
        ' No OrganizationPosTerminalSber type Object from PaymentSberTerminalKozenP12 ',
      );
    }
    final select = organization as OrganizationPosTerminalSber;
    final result = await sberLocalDB.saveNewOrganization(select);
    if (!result) {
      return false;
    }
    _currentOperation = _currentOperation.copyWith(selectOrganization: select);
    return result;
  }

  @override
  Future<void> abortPay() async {
    if (_currentOperation.idempotenceKeyERN.isEmpty) {
      throw Exception('No generate key idempotence');
    }
    if (_currentOperation.currentClientId.isEmpty) {
      throw Exception('No current create pay');
    }
    await connect();
    posModule.createAbort(
      organizationCode: _currentOperation.selectOrganization?.number,
      clientId: _currentOperation.currentClientId,
      idempotenceKeyERN: _currentOperation.idempotenceKeyERN,
    );
    await disconnect();
  }

  @override
  Future<dynamic> createPay(dynamic paymentModel) async {
    if (!(paymentModel is SendPosPaymentModel)) {
      throw Exception(' paymentModel должен быть тип SendPosPaymentModel ');
    }
    // if (posModule != null) {
    //   throw Exception(' posModule no init ');
    // }
    await connect();
    paymentModel = (paymentModel as SendPosPaymentModel);
    final idempotKey = paymentModel.idempotenceKeyERN;
    final idempotenceKey =
        idempotKey.length > 9 ? idempotKey.substring(0, 8) : idempotKey;
    _currentOperation = _currentOperation.copyWith(
      currentClientId: paymentModel.clientId,
      idempotenceKeyERN: idempotenceKey,
      amount: paymentModel.amount,
    );

    /// Max timout Sber termianl 4.55 minutes
    final resultCreatePay = await posModule
        .createPayment(
          amount: paymentModel.amount,
          clientId: paymentModel.clientId,
          idempotenceKeyERN: idempotenceKey,
          organizationCode: _currentOperation.selectOrganization?.number,
        )
        .timeout(const Duration(minutes: 5));
    _currentOperation = _currentOperation.copyWith(
      retrievalReferenceNumber: resultCreatePay.retrievalReferenceNumber,
    );
    await sberLocalDB.saveTransaction(
      mapCurrentCheck: TransactionTerminal(
        request: (paymentModel as SendPosPaymentModel),
        result: resultCreatePay,
        checkCalled: false,
        createAtUTC: DateTime.now().toUtc(),
        idTransactionString: idempotenceKey,
        payCalled: false,
        refundCalled: false,
        sumFull: paymentModel.amount,
        transactionType: TransactionType.paySuccessAfterCheck,
      ),
      idCheck: idempotenceKey,
    );

    await disconnect();
    return GetPosPaymentModel(
      clientId: resultCreatePay.clientId,
      idempotenceKeyERN: idempotenceKey,
      success: resultCreatePay.success,
      receipt: resultCreatePay.receipt,
      amount: resultCreatePay.amount,
      rrn: resultCreatePay.retrievalReferenceNumber,
      dateTime: mapper.convertPosToDateTime(
        date: resultCreatePay.date,
        time: resultCreatePay.time,
      ),
    );
  }

  @override
  Future<void> refoundPay() async {
    if (_currentOperation.idempotenceKeyERN.isEmpty) {
      throw Exception('No generate key idempotence');
    }
    if (_currentOperation.currentClientId.isEmpty) {
      throw Exception('No current create pay');
    }
    if (!(_currentOperation.retrievalReferenceNumber != null &&
        _currentOperation.retrievalReferenceNumber!.isNotEmpty)) {
      throw Exception('No create pay');
    }
    await connect();
    await posModule
        .createRefund(
          amount: _currentOperation.amount,
          retrievalReferenceNumber: _currentOperation.retrievalReferenceNumber!,
          clientId: _currentOperation.currentClientId,
          organizationCode: _currentOperation.selectOrganization?.number,
          idempotenceKeyERN: _currentOperation.idempotenceKeyERN,
        )
        .timeout(const Duration(minutes: 5));
    await sberLocalDB.deleteTransaction(
      idCheck: _currentOperation.idempotenceKeyERN,
    );
    await disconnect();

    /// Max timout Sber termianl 4.55 minutes
  }

  @override
  Future<void> disconnect() async {
    final result =
        await posModule.disconnect().timeout(const Duration(seconds: 5));
    if (!result) {
      throw Exception(' Disconnect failure: Ошибка отсоединения, ... . ');
    }
  }

  @override
  Future<void> connect() async {
    final result =
        await posModule.connect().timeout(const Duration(seconds: 5));
    if (!result) {
      throw Exception(
          ' Connect failure: Ошибка соединения, возможно терминал в другой подсети. ');
    }
  }

  @override
  Future<void> resetSettings() async {
    await sberLocalDB.deleteSettingsTerminal();
    await sberLocalDB.deleteAllOrganization();
    await sberLocalDB.deleteAllTransaction();
  }

  @override
  Future<void> clearSession() async {
    _currentOperation = CurrentOperation.empty();
  }

  @override
  Future<void> close() async {}
}
