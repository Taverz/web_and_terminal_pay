import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/enums/yookassa_payment_type_enum.dart';
part 'yookassa_payment_method_model.freezed.dart';
part 'yookassa_payment_method_model.g.dart';

@freezed
class YookassaPaymentMethodModel with _$YookassaPaymentMethodModel {
  factory YookassaPaymentMethodModel({required YookassaPaymentTypeEnum type}) =
      _YookassaPaymentMethodModel;
  factory YookassaPaymentMethodModel.fromJson(Map<String, dynamic> json) =>
      _$YookassaPaymentMethodModelFromJson(json);
}
