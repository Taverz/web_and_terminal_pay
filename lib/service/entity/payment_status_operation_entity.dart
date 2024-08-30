enum PaymentStatusOperationEntity {
  inProcessing,
  start,
  success,
  cancel,
  noStartPay,
  error,
  refundSuccess,
  refundError,
  noMoney,
  awaited;

  static PaymentStatusOperationEntity convertTerminal_StringToEnum(
    String? termianlCheckStatus,
  ) {
    final statusString = ((termianlCheckStatus) ?? '').toLowerCase();
    if (statusString.contains('оплачено')) {
      return PaymentStatusOperationEntity.success;
    }
    if (statusString.contains('одобрено')) {//
      return PaymentStatusOperationEntity.success;
    }
    if (statusString.contains('успешно')) {//
      return PaymentStatusOperationEntity.success;
    }
    if (statusString.contains('ошибка')) {
      return PaymentStatusOperationEntity.error;
    }
    if (statusString.contains('операция была отменена')) {//
      return PaymentStatusOperationEntity.cancel;
    }
    if (statusString.contains('отмена')) {
      return PaymentStatusOperationEntity.cancel;
    }
    if (statusString.contains('авторизация в банке')) {//
      return PaymentStatusOperationEntity.start;
    }
    if (statusString.contains('в обработке')) {
      return PaymentStatusOperationEntity.inProcessing;
    }
    if (statusString.contains('ожидание')) {// 
      return PaymentStatusOperationEntity.awaited;
    }
    if (statusString.contains('время на оплату истекло')) {// время на оплату истекло, поробуйте ещё р
      return PaymentStatusOperationEntity.error;
    }
    if (statusString.contains('недостаточно средств')) {
      return PaymentStatusOperationEntity.noMoney;
    }
    if (statusString.contains('нет денег')) {
      return PaymentStatusOperationEntity.noMoney;
    }

    return PaymentStatusOperationEntity.error;
  }

  static PaymentStatusOperationEntity convertYookassa_StringToEnum(
    String? termianlCheckStatus,
  ) {
    final statusString = ((termianlCheckStatus) ?? '').toUpperCase();
    if (statusString.contains('оплачено')) {
      return PaymentStatusOperationEntity.success;
    }
    if (statusString.contains('ОДОБРЕНО')) {
      return PaymentStatusOperationEntity.success;
    }
    if (statusString.contains('Операция была отменена')) {
      return PaymentStatusOperationEntity.cancel;
    }
    if (statusString.contains('успешно')) {
      return PaymentStatusOperationEntity.success;
    }
    if (statusString.contains('ошибка')) {
      return PaymentStatusOperationEntity.error;
    }
    if (statusString.contains('отмена')) {
      return PaymentStatusOperationEntity.cancel;
    }
    if (statusString.contains('в обработке')) {
      return PaymentStatusOperationEntity.inProcessing;
    }
    if (statusString.contains('ожидание')) {
      return PaymentStatusOperationEntity.awaited;
    }
    if (statusString.contains('недостаточно средств')) {
      return PaymentStatusOperationEntity.noMoney;
    }
    if (statusString.contains('нет денег')) {
      return PaymentStatusOperationEntity.noMoney;
    }

    return PaymentStatusOperationEntity.error;
  }
}
