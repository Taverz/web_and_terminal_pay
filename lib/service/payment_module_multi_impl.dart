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
  CancelableOperation<PaymentStatusOperationEntity>? _paymentOperation;

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

    /// Закоментировано поттому что выполняется при иницализации
    ///
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

  ///  ## Привер обработки этого метода
  ///
  ///   * ------
  ///
  ///   ```
  ///   final paymentStatusEntity = await paymentSystem.pay(
  ///     paymentModel,
  ///     organizationsSelect: organizationsSelect,
  ///   );
  ///   state = const PaymentState.loadingAfterPay();
  ///   if (paymentStatusEntity == PaymentStatusOperationEntity.success) {
  ///     state = const PaymentState.success();
  ///     return;
  ///   }
  ///   if ((paymentStatusEntity == PaymentStatusOperationEntity.start)) {
  ///     return;
  ///   }
  ///   if ((paymentStatusEntity == PaymentStatusOperationEntity.noMoney)) {
  ///     state = const PaymentState.unsuccess(
  ///       'Ошибка службы и кассы! Обратитесь к менеджеру для возврата средств.',
  ///     );
  ///     return;
  ///   }
  ///   if ((paymentStatusEntity == PaymentStatusOperationEntity.cancel)) {
  ///     state = const PaymentState.unsuccess(
  ///       'Ошибка службы и кассы! Обратитесь к менеджеру для возврата средств.',
  ///     );
  ///     return;
  ///   }
  ///   if (!(paymentStatusEntity == PaymentStatusOperationEntity.success)) {
  ///     for (final _ in [0, 1, 2]) {
  ///       await Future.delayed(const Duration(seconds: 15));
  ///       final paymentStatusEntity = await paymentSystem.statusPay();
  ///       if (paymentStatusEntity == PaymentStatusOperationEntity.success) {
  ///         state = const PaymentState.success();
  ///         return;
  ///       }
  ///     }
  ///     state = const PaymentState.unsuccess(
  ///       'Ошибка службы и кассы! Обратитесь к менеджеру для возврата средств.',
  ///     );
  ///     return;
  ///   }
  /// ```
  /// * -------
  ///
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

      final resultSuccess = (await _paymentOperation!
          .valueOrCancellation(PaymentStatusOperationEntity.cancel))!;
      if (resultSuccess == PaymentStatusOperationEntity.success) {
        try {
          await transactionsSumSaveRepository
              .plusSumTransactionPay(paymentModel.amountFull);
        } catch (e) {}

        return resultSuccess;
      } else {
        return resultSuccess;
      }
    } catch (e) {
      // TODO: Save Failure operation
      return PaymentStatusOperationEntity.error;
    }
  }

  Future<PaymentStatusOperationEntity> _executePayment(
    PayEntity paymentModel,
  ) async {
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
        final status =
            PaymentStatusOperationEntity.convertTerminal_StringToEnum(
          result.success ? 'оплачено' : result.statusText,
        );
        if (status == PaymentStatusOperationEntity.error) {
          await _errorPayNotification(status);
        }
        return status;
      } else {
        final result = await payYookassa.createPayment(
          paymentModel: createPaymentModelServiceToYookassa(
            paymentModel,
            _selectPaymentMethod,
          ),
        );

        if (_paymentOperation!.isCanceled) {
          return await _handleAbortedPayment();
        }

        if (result.paid) {
          final payStatus = await payYookassa.statusPayAfterCapture();
          return payStatus
              ? PaymentStatusOperationEntity.success
              : PaymentStatusOperationEntity.error;
        }
      }
      return PaymentStatusOperationEntity.error;
    } catch (e) {
      // TODO: Save Failure operation
      return PaymentStatusOperationEntity.error;
    }
  }

  @override
  Future<void> abortPay() async {
    _paymentOperation?.cancel();
    await _handleAbortedPayment();
  }

  Future<PaymentStatusOperationEntity> _handleAbortedPayment() async {
    PaymentStatusOperationEntity isPaid = PaymentStatusOperationEntity.cancel;

    if (_selectPaymentMethod == PaymentMethodEntity.termianlSber) {
      await payTerminal.abortPay();
    }
    if (_selectPaymentMethod != null &&
        _selectPaymentMethod != PaymentMethodEntity.termianlSber) {
      isPaid = await payYookassa.statusPayAfterCapture()
          ? PaymentStatusOperationEntity.success
          : PaymentStatusOperationEntity.error;
    } else if (_selectPaymentMethod == PaymentMethodEntity.termianlSber) {
      isPaid = PaymentStatusOperationEntity.convertTerminal_StringToEnum(
        (await payTerminal.checkStatusCurrentOperation()) ?? '',
      );
    }

    // if (isPaid == PaymentStatusOperationEntity.error) {
    //   await refound();
    //   return PaymentStatusOperationEntity.refundSuccess;
    // }
    if (isPaid == PaymentStatusOperationEntity.error) {
      await _errorPayNotification(PaymentStatusOperationEntity.error);
    }

    return PaymentStatusOperationEntity.error;
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

  Future<void> _errorPayNotification(
    PaymentStatusOperationEntity status,
  ) async {
    try {
      if (repositoryTelegram.initChat) {
        final dateTimeUTC = DateTime.now().toUtc().toIso8601String();
        final dateTime =
            DateTime.now().toIso8601String().replaceFirst('T', ' ');
        final titleStatus = status == PaymentStatusOperationEntity.error
            ? "🆘 <Ошибка оплаты> 🆘"
            : "❔ <Проверка статуса оплаты> ❔";
        final textMessage =
            " Сумма оплаты: ${_paymentModel?.amountFull}  \n Предметы оплаты: \n${_paymentModel?.items.map((e) => " \n " + e.name + " Количество: " + e.quantity.toString() + " Цена за штю.: " + e.price.toString() + '\n')}  \n ";
        final text =
            "\n $titleStatus \n Статус: ${status.toString()} \n---------------------\n LOCAL date time: $dateTime  \n\n UTC date time: $dateTimeUTC \n\n CHAT_payError \n\n--------------------\n $textMessage";
        await repositoryTelegram.sendMessage(text);
      }
    } catch (e) {}
  }

  @override
  Future<PaymentStatusOperationEntity> statusPay() async {
    if (_paymentModel == null) {
      return PaymentStatusOperationEntity.noStartPay;
    }
    if (_selectPaymentMethod != null &&
        _selectPaymentMethod != PaymentMethodEntity.termianlSber) {
      final isPaid = await payYookassa.statusPayAfterCapture();
      if (isPaid) {
        await _errorPayNotification(PaymentStatusOperationEntity.success);
        return PaymentStatusOperationEntity.success;
      } else {
        await _errorPayNotification(PaymentStatusOperationEntity.error);
      }
      return PaymentStatusOperationEntity.error;
    } else if (_selectPaymentMethod == PaymentMethodEntity.termianlSber) {
      final status = PaymentStatusOperationEntity.convertTerminal_StringToEnum(
        (await payTerminal.checkStatusCurrentOperation()) ?? '',
      );

      await _errorPayNotification(status);

      return status;
    }

    return PaymentStatusOperationEntity.error;
  }

  @override
  Future<String?> closingShift() async {
    String? resultCloseShit;
    try {
      final result = await payTerminal
          .reconciliationOfResults()
          .timeout(const Duration(seconds: 8));
      resultCloseShit = result;
    } catch (e) {
      resultCloseShit = 'Ошибка получения сверки итогов';
    }
    if (repositoryTelegram.initChat) {
      final dateTimeUTC = DateTime.now().toUtc().toIso8601String();
      final dateTime = DateTime.now().toIso8601String().replaceFirst('T', ' ');
      final text =
          "\n 🧮 <Сверка итогов> 📖 \n---------------------\n LOCAL date time: ${dateTime}  \n\n UTC date time: ${dateTimeUTC} \n\n CHAT_reconciliationOfResults \n\n--------------------\n ${resultCloseShit}";
      await repositoryTelegram.sendMessage(text);
    }
    return resultCloseShit;
  }
}

// final resultExampleCloseShit = """
//       IT услуги
//       Ростов-на-Дону, Ростовская облас
//       ул. Металлургическая, зд 102/2
//               т. 79044478621
//       20.08.24     16:17    ЧЕК   0002
//       ПАО СБЕРБАНК              Оплата
//       Т: 32149782       М:211000230975
//       Mastercard        A0000000041010
//       Карта:(E1)      ****8666
//       Сумма (Руб):                6.00
//       Комиссия за операцию - 0 Руб.
//                   ОДОБРЕНО
//       К/А: 247317  RRN:   423312040409
//       Подпись клиента не требуется
//       EC3CCAE1066D400B7A3A350C69F28167
//       ================================
//       ~S           IT услуги
//       Ростов-на-Дону, Ростовская облас
//       ул. Металлургическая, зд 102/2
//               т. 79044478621
//       20.08.24     16:17    ЧЕК   0002
//       ПАО СБЕРБАНК              Оплата
//       Т: 32149782       М:211000230975
//       Mastercard        A0000000041010
//       Карта:(E1)      ****8666
//       Сумма (Руб):                6.00
//       Комиссия за операцию - 0 Руб.
//                   ОДОБРЕНО
//       К/А: 247317  RRN:   423312040409
//       Подпись клиента не требуется
//       EC3CCAE1066D400B7A3A350C69F28167
//       ================================
//       ~S
//       """;
