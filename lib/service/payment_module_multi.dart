import 'package:web_and_terminal_pay/service/entity/pay_entity.dart';

abstract class PaymentSystemMulti {
  Future<void> init();
  Future<bool> pay(PayEntity paymentModel);
  Future<bool> statusPay();

  /// Прекрытить оплату / Отменить оплату
  Future<void> abortPay();
  Future<void> getHistoryTransaction();
  Future<void> refound();
  Future<List> getPaymentMethods();

  /// getPaymentMethods() -->  get id
  Future<void> selectPaymentMethod(int index);

  /// Закрытие смены
  // Future<void> closingShift();

  /// Закрыть стримы и порчее ...
  Future<void> close();
}
