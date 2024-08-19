import 'package:web_and_terminal_pay/service/entity/pay_entity.dart';
import 'package:web_and_terminal_pay/service/entity/payment_methods.dart';
import 'package:web_and_terminal_pay/service/entity/payment_status_operation_entity.dart';
import 'package:web_and_terminal_pay/service/entity/transaction_history.dart';
import 'package:web_and_terminal_pay/service/payment_module.dart';

abstract class PaymentSystemMulti implements PaymentSystem {
  Future<void> init({String? Chat_ID});
  Future<PaymentStatusOperationEntity> pay(
    PayEntity paymentModel, {
    String? organizationsSelect,
  });
  Future<PaymentStatusOperationEntity> statusPay();

  /// Прекрытить оплату / Отменить оплату
  Future<void> abortPay();
  Future<TransactionHistory> getHistoryTransaction();
  Future<void> refound();
  Future<List<PaymentMethodEntity>> getPaymentMethods();

  /// getPaymentMethods() -->  get id
  Future<void> selectPaymentMethod(int index);

  /// Закрытие смены
  Future<void> closingShift();

  /// Закрыть стримы и порчее ...
  Future<void> close();
}
