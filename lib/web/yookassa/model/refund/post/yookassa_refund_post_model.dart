// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/amount/yookassa_amount_model.dart';

part 'yookassa_refund_post_model.freezed.dart';
part 'yookassa_refund_post_model.g.dart';

@freezed
abstract class YookassaRefundPostModel with _$YookassaRefundPostModel {
  factory YookassaRefundPostModel({
    @JsonKey(name: 'payment_id') required String paymentId,
    required YookassaAmountModel amount,
  }) = _YookassaRefundPostModel;
  factory YookassaRefundPostModel.fromJson(Map<String, dynamic> json) =>
      _$YookassaRefundPostModelFromJson(json);
}
