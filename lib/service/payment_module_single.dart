import 'package:web_and_terminal_pay/service/entity/pay_entity.dart';
import 'package:web_and_terminal_pay/service/entity/transaction_history.dart';

abstract class PaymentSystemSingle {
  Future<void> init();
  Future<void> pay(PayEntity paymentModel);

  /// Прекрытить оплату / Отменить оплату
  Future<void> abortPay();
  Future<TransactionHistory> getHistoryTransaction();
  Future<void> refound();
  Future<List> getPaymentMethods();

  /// getPaymentMethods() -->  get id
  Future<void> selectPaymentMethod(int index);

  /// Закрытие смены
  Future<void> closingShift();

  /// Закрыть стримы и порчее ...
  Future<void> close();
}
