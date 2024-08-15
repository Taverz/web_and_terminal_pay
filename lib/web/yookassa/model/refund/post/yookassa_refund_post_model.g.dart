// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yookassa_refund_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YookassaRefundPostModelImpl _$$YookassaRefundPostModelImplFromJson(
        Map<String, dynamic> json) =>
    _$YookassaRefundPostModelImpl(
      paymentId: json['payment_id'] as String,
      amount:
          YookassaAmountModel.fromJson(json['amount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$YookassaRefundPostModelImplToJson(
        _$YookassaRefundPostModelImpl instance) =>
    <String, dynamic>{
      'payment_id': instance.paymentId,
      'amount': instance.amount,
    };
