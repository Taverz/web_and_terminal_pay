import 'package:async/async.dart';
import 'package:web_and_terminal_pay/check_service/atol/recipe/atol_service.dart';
import 'package:web_and_terminal_pay/data/local_sum_transaction.dart';
import 'package:web_and_terminal_pay/pos/data/mapper/pay_system_mapper.dart';
import 'package:web_and_terminal_pay/pos/model/pay/send/send_pos_payment_model.dart';

import 'package:web_and_terminal_pay/pos/pay_terminal.dart';
import 'package:web_and_terminal_pay/service/entity/pay_entity.dart';
import 'package:web_and_terminal_pay/service/entity/payment_methods.dart';
import 'package:web_and_terminal_pay/service/entity/payment_status_operation_entity.dart';
import 'package:web_and_terminal_pay/service/entity/transaction_history.dart';
import 'package:web_and_terminal_pay/pos/model/pay/get/get_pos_payment_model.dart';
import 'package:web_and_terminal_pay/service/payment_module_multi.dart';
import 'package:web_and_terminal_pay/telegram_message/repository_telegram.dart';
import 'package:web_and_terminal_pay/web/yookassa/repository/yookassa_repository.dart';

class PaySystemWebAndTerminal implements PaymentSystemMulti {
  final PayTerminal payTerminal;
  final YookassaRepository payYookassa;
  final AtolCheckService atolCheckService;
  final RepositoryTelegram repositoryTelegram;
  final TransactionsSumSaveRepository transactionsSumSaveRepository;

  PaySystemWebAndTerminal({
    required this.payTerminal,
    required this.payYookassa,
    required this.atolCheckService,
    required this.repositoryTelegram,
    required this.transactionsSumSaveRepository,
  });

  // ignore: unused_field
  PayEntity? _paymentModel;
  List<PaymentMethodEntity>? _paymentMethods;
  PaymentMethodEntity? _selectPaymentMethod;
  CancelableOperation<bool>? _paymentOperation;

  @override
  Future<void> init({String? Chat_ID}) async {
    List<PaymentMethodEntity> paymentMethods = [
      PaymentMethodEntity.termianlSber
    ];
    try {
      final info = await payYookassa.getHostPayment();
      // final payMethods = info['payment_methods'] as List<String>;
      paymentMethods.addAll(info);
    } catch (e) {}
    try {
      repositoryTelegram.initChatId(Chat_ID);
    } catch (e) {}

    payTerminal.init();
    transactionsSumSaveRepository.init();

    _paymentMethods = paymentMethods;
  }

  @override
  Future<void> close() async {
    payYookassa.clearSession();
    payTerminal.clearSession();
    await payTerminal.close();
    _paymentModel = null;
    if (_paymentOperation != null) await _paymentOperation!.cancel();
  }

  @override
  Future<List<PaymentMethodEntity>> getPaymentMethods() async {
    if (_paymentMethods == null) {
      throw Exception(
        'no contains methods pay, pless run init() from load method pay',
      );
    }
    // List<PaymentMethodEntity> paymentMethods = [
    //   PaymentMethodEntity.termianlSber
    // ];
    // try {
    //   final paymentMethYookassa = await payYookassa.getMethodsPayment();
    //   final listYookassaMethods = convertYookassa(paymentMethYookassa);
    //   paymentMethods.addAll(listYookassaMethods);
    // } catch (e) {}
    // _paymentMethods = paymentMethods;
    return _paymentMethods!;
  }

  @override
  Future<void> selectPaymentMethod(int index) async {
    if (_paymentMethods == null) {
      throw Exception(
        'no contains methods pay, pless run init() from load method pay',
      );
    }
    _selectPaymentMethod = _paymentMethods![index];
  }

  @override
  Future<PaymentStatusOperationEntity> pay(
    PayEntity paymentModel, {
    String? organizationsSelect,
  }) async {
    if (_selectPaymentMethod == null) {
      throw Exception('no select payment method');
    }
    if (paymentModel.descriptionPay == null) {
      throw Exception('need add description transaction');
    }
    _paymentModel = paymentModel;
    try {
      //TODO: если ошибка то выдает успещный результат оплаты
      _paymentOperation =
          CancelableOperation.fromFuture(_executePayment(paymentModel));

      final resultSuccess =
          (await _paymentOperation!.valueOrCancellation(false))!;
      if (resultSuccess) {
        await transactionsSumSaveRepository
            .plusSumTransactionPay(paymentModel.amountFull);
      } else {
        return PaymentStatusOperationEntity.error;
      }
      return PaymentStatusOperationEntity.success;
    } catch (e) {
      // TODO: Save Failure operation
      return PaymentStatusOperationEntity.error;
    }
  }

  Future<bool> _executePayment(PayEntity paymentModel) async {
    try {
      if (_selectPaymentMethod == PaymentMethodEntity.termianlSber) {
        final modelTerminalPay = SendPosPaymentModel(
          clientId: paymentModel.clientId,
          idempotenceKeyERN: paymentModel.idempotenceKey,
          amount: paymentModel.amountFull,
        );
        final result =
            await payTerminal.createPay(modelTerminalPay) as GetPosPaymentModel;

        if (_paymentOperation!.isCanceled) {
          return await _handleAbortedPayment();
        }

        return result.success;
      } else {
        final result = await payYookassa.createPayment(
          paymentModel: createPaymentModelServiceToYookassa(
              paymentModel, _selectPaymentMethod),
        );

        if (_paymentOperation!.isCanceled) {
          return await _handleAbortedPayment();
        }

        if (result.paid) {
          final payStatus = await payYookassa.statusPayAfterCapture();
          return payStatus;
        }
      }
      return false;
    } catch (e) {
      // TODO: Save Failure operation
      return false;
    }
  }

  @override
  Future<void> abortPay() async {
    _paymentOperation?.cancel();
    await _handleAbortedPayment();
  }

  Future<bool> _handleAbortedPayment() async {
    bool isPaid = false;

    if (_selectPaymentMethod == PaymentMethodEntity.termianlSber) {
      await payTerminal.abortPay();
    }
    if (_selectPaymentMethod != null &&
        _selectPaymentMethod != PaymentMethodEntity.termianlSber) {
      isPaid = await payYookassa.statusPayAfterCapture();
    } else if (_selectPaymentMethod == PaymentMethodEntity.termianlSber) {
      isPaid = PaymentStatusOperationEntity.convertTerminal_StringToEnum(
              ((await payTerminal.checkStatusCurrentOperation()) ?? '')) ==
          PaymentStatusOperationEntity.success;
    }

    if (isPaid) {
      await refound();
      return false;
    }

    return false;
  }

  @override
  Future<TransactionHistory> getHistoryTransaction() async {
    final terminalTransactionHistory = await payTerminal.getAllTransaction();
    final yookassaTransactionHistory = await payYookassa.historyTransaction();
    final List<Transaction> listTransaction = [];
    //TODO: convert terminal
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

    if (yookassaTransactionHistory.isNotEmpty) {
      final converttt = yookassaTransactionHistory
          .map(
            (e) => Transaction(
              createAtUTC: e.createAtUTC,
              transactionType: e.transactionType,
              sumFull: e.sumFull,
              idTransactionString: e.idTransactionString,
            ),
          )
          .toList();
      listTransaction.addAll(converttt);
    }

    //TODO: convert yookassa
    final transactions = TransactionHistory(transaction: listTransaction);
    return transactions;
  }

  @override
  Future<bool> refound() async {
    if (_selectPaymentMethod == null) {
      throw Exception('no select payment method');
    }
    if (_paymentModel == null) {
      throw Exception('no create pay');
    }
    try {
      if (_selectPaymentMethod == PaymentMethodEntity.termianlSber) {
        await payTerminal.refoundPay();
        return true;
      }
      if (_selectPaymentMethod != PaymentMethodEntity.termianlSber) {
        await payYookassa.refundPayment();
        return true;
      }
      await transactionsSumSaveRepository
          .minusSumTransactionPay(_paymentModel!.amountFull);
      _paymentModel = null;
      return false;
    } catch (e) {
      // TODO: Save Failure operation
      return false;
    }
  }

  @override
  Future<PaymentStatusOperationEntity> statusPay() async {
    bool isPaid = false;

    if (_selectPaymentMethod != null &&
        _selectPaymentMethod != PaymentMethodEntity.termianlSber) {
      isPaid = await payYookassa.statusPayAfterCapture();
    } else if (_selectPaymentMethod == PaymentMethodEntity.termianlSber) {
      isPaid = ((await payTerminal.checkStatusCurrentOperation()) ?? '')
          .contains('оплачено');
    } else {
      isPaid = false;
    }
    if (isPaid) {
      return PaymentStatusOperationEntity.success;
    }
    return PaymentStatusOperationEntity.error;
  }

  @override
  Future<void> closingShift() async {
    if (repositoryTelegram.initChat) {
      final result = await payTerminal.reconciliationOfResults();
      final dateTimeUTC = DateTime.now().toUtc().toIso8601String();
      final dateTime = DateTime.now().toIso8601String();
      final text =
          "\n <Сверка итогов> \n UTC date time: ${dateTimeUTC} \n LOCAL date time: ${dateTime} \n CHAT_reconciliationOfResults \n\n ${result}";
      await repositoryTelegram.sendMessage(text);
    }
  }
}
