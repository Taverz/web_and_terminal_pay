import 'package:freezed_annotation/freezed_annotation.dart';

enum YookassaPaymentTypeEnum {
  @JsonValue('bank_card')
  bankCard,
  @JsonValue('yoo_money')
  youMoney,
  @JsonValue('qiwi')
  qiwi,
  @JsonValue('sberbank')
  sberbank,
  @JsonValue('tinkoff_bank')
  tinkoffBank,
  @JsonValue('sbp')
  sbp,
}
