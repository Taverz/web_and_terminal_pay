enum PaymentMethodEntity {
  bankCard,
  youMoney,
  qiwi,
  sberbank,
  tinkoffBank,
  sbp,

  termianlSber;

  static PaymentMethodEntity? from(String value) {
    switch (value) {
      case 'bankCard':
        return PaymentMethodEntity.bankCard;
      case 'youMoney':
        return PaymentMethodEntity.youMoney;
      case 'qiwi':
        return PaymentMethodEntity.qiwi;
      case 'sberbank':
        return PaymentMethodEntity.sberbank;
      case 'tinkoffBank':
        return PaymentMethodEntity.tinkoffBank;
      case 'sbp':
        return PaymentMethodEntity.sbp;
      case 'termianlSber':
        return PaymentMethodEntity.termianlSber;
      default:
        return null;
    }
  }
}

extension PaymentMethodExtension on PaymentMethodEntity {
  String get totext {
    switch (this) {
      case PaymentMethodEntity.bankCard:
        return 'bankCard';
      case PaymentMethodEntity.youMoney:
        return 'youMoney';
      case PaymentMethodEntity.qiwi:
        return 'qiwi';
      case PaymentMethodEntity.sberbank:
        return 'sberbank';
      case PaymentMethodEntity.tinkoffBank:
        return 'tinkoffBank';
      case PaymentMethodEntity.sbp:
        return 'sbp';
      case PaymentMethodEntity.termianlSber:
        return 'termianlSber';
    }
  }
}
