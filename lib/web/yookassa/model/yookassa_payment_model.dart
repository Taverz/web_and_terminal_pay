// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/amount/yookassa_amount_model.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/confirmation/yookassa_confirmation_model.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/payment_method/yookassa_payment_method_model.dart';
part 'yookassa_payment_model.freezed.dart';
part 'yookassa_payment_model.g.dart';

@freezed
class YookassaPaymentModel with _$YookassaPaymentModel {
  factory YookassaPaymentModel({
    required String id,
    required bool paid,
    required YookassaAmountModel amount,
    required YookassaConfirmationModel confirmation,
    @JsonKey(name: 'payment_method_data')
    required YookassaPaymentMethodModel paymentMethodModel,
    required bool capture,
    required String description,
  }) = _YookassaPaymentModel;
  factory YookassaPaymentModel.fromJson(Map<String, dynamic> json) =>
      _$YookassaPaymentModelFromJson(json);
}
