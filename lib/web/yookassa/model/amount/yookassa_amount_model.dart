import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/enums/yookassa_currency_enum.dart';
part 'yookassa_amount_model.freezed.dart';
part 'yookassa_amount_model.g.dart';

@freezed
class YookassaAmountModel with _$YookassaAmountModel {
  factory YookassaAmountModel(
      {required double value,
      required YookassaCurrencyEnum currency}) = _YookassaAmountModel;

  factory YookassaAmountModel.fromJson(Map<String, dynamic> json) =>
      _$YookassaAmountModelFromJson(json);
}
