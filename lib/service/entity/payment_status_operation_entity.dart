enum PaymentStatusOperationEntity {
  inProcessing,
  success,
  cancel,
  error,
  noMoney,
  await;

  static PaymentStatusOperationEntity convertTerminal_StringToEnum(
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
      return PaymentStatusOperationEntity.await;
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
      return PaymentStatusOperationEntity.await;
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
