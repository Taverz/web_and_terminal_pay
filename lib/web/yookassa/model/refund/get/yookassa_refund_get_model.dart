// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/enums/yookassa_status_enum.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/amount/yookassa_amount_model.dart';

part 'yookassa_refund_get_model.freezed.dart';
part 'yookassa_refund_get_model.g.dart';

@freezed
abstract class YookassaRefundGetModel with _$YookassaRefundGetModel {
  factory YookassaRefundGetModel({
    required String id,
    required YookassaAmountModel amount,
    @JsonKey(name: 'payment_id') required String paymentId,
    required YookassaPayStatusEnum status,
  }) = _YookassaRefundGetModel;
  factory YookassaRefundGetModel.fromJson(Map<String, dynamic> json) =>
      _$YookassaRefundGetModelFromJson(json);
}
