import 'package:freezed_annotation/freezed_annotation.dart';

enum YookassaCurrencyEnum {
  @JsonValue('RUB')
  rub,
}

YookassaCurrencyEnum convertLocationFromEnum(String currencyText) {
  switch (currencyText) {
    case 'RUB':
      return YookassaCurrencyEnum.rub;
    default:
      return YookassaCurrencyEnum.rub;
  }
}
