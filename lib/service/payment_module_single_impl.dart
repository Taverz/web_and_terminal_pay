import 'package:web_and_terminal_pay/check_service/atol/recipe/atol_service.dart';
import 'package:web_and_terminal_pay/pos/pay_terminal.dart';
import 'package:web_and_terminal_pay/service/entity/extension_pay_sber.dart';
import 'package:web_and_terminal_pay/service/entity/pay_entity.dart';
import 'package:web_and_terminal_pay/service/entity/payment_methods.dart';
import 'package:web_and_terminal_pay/service/entity/payment_status_operation_entity.dart';
import 'package:web_and_terminal_pay/service/entity/transaction_history.dart';
import 'package:web_and_terminal_pay/service/payment_module_single.dart';
import 'package:web_and_terminal_pay/telegram_message/repository_telegram.dart';

class PaySystemTerminal implements PaymentSystemSingle {
  // PaymentSberTerminalKozenP12
  final PayTerminal payTerminal;
  final AtolCheckService atolCheckService;
  final RepositoryTelegram repositoryTelegram;
  PaySystemTerminal({
    required this.payTerminal,
    required this.atolCheckService,
    required this.repositoryTelegram,
  });

  PayEntity? _paymentModel;
  List<PaymentMethodEntity>? _paymentMethods;
  // ignore: unused_field
  PaymentMethodEntity? _selectPaymentMethod;

  @override
  Future<void> init() async {
    _paymentModel = null;
    await payTerminal.init();
    //TODO: CityCreek Chat ID
    repositoryTelegram.initChatId('-11');
  }

  @override
  Future<void> abortPay() async {
    _paymentModel = null;
    await payTerminal.abortPay();
  }

  @override
  Future<void> close() async {
    _paymentModel = null;
    await payTerminal.close();
  }

  @override
  Future<void> closingShift() async {
    final result = await payTerminal.reconciliationOfResults();
    final dateTimeUTC = DateTime.now().toUtc().toIso8601String();
    final dateTime = DateTime.now().toIso8601String();
    final text =
        "\n <Сверка итогов> \n UTC date time: ${dateTimeUTC} \n LOCAL date time: ${dateTime} \n CHAT_reconciliationOfResults \n\n ${result}";
    await repositoryTelegram.sendMessage(text);
  }

  @override
  Future<TransactionHistory> getHistoryTransaction() async {
    final terminalTransactionHistory = await payTerminal.getAllTransaction();
    final List<Transaction> listTransaction = [];
    if (terminalTransactionHistory != null) {
      final converttt = terminalTransactionHistory
          .map(
            (e) => Transaction(
              createAtUTC: e.transactionTerminal.createAtUTC,
              transactionType: e.transactionTerminal.transactionType,
              sumFull: e.transactionTerminal.sumFull,
              idTransactionString: e.transactionTerminal.idTransactionString,
            ),
          )
          .toList();
      listTransaction.addAll(converttt);
    }
    final transactions = TransactionHistory(transaction: listTransaction);
    return transactions;
  }

  @override
  Future<void> pay(PayEntity paymentModel) async {
    _paymentModel = paymentModel;
    try {
      await payTerminal.createPay(_paymentModel!.payModelSberTerminal());
      await atolCheckService.check(_paymentModel!.checkModelAtol());
      //TODO: transaction save
    } catch (e) {
      //TODO: transaction save
    }
  }

  @override
  Future<void> refound() async {
    if (_paymentModel == null) {
      throw Exception('No pay create');
    }
    await payTerminal.refoundPay();
    await atolCheckService.checkRefound(_paymentModel!.checkModelAtol());
    //TODO:
    // await atolCheckService.checkRefound(checkModel);
  }

  @override
  Future<List<PaymentMethodEntity>> getPaymentMethods() async {
    _paymentModel = null;
    _paymentMethods = [PaymentMethodEntity.termianlSber];
    return _paymentMethods!;
  }

  @override
  Future<void> selectPaymentMethod(int index) async {
    if (_paymentMethods == null) {
      throw Exception('Empty list pay methods');
    }
    _selectPaymentMethod = _paymentMethods![index];
  }

  @override
  Future<PaymentStatusOperationEntity> statusPay() async {
    if (_paymentModel == null) {
      throw Exception('No pay create');
    }
    final statusString = await payTerminal.checkStatusCurrentOperation();
    final status =
        PaymentStatusOperationEntity.convertTerminal_StringToEnum(statusString);
    return status;
  }
}
