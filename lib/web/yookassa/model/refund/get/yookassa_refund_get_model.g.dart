// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yookassa_refund_get_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YookassaRefundGetModelImpl _$$YookassaRefundGetModelImplFromJson(
        Map<String, dynamic> json) =>
    _$YookassaRefundGetModelImpl(
      id: json['id'] as String,
      amount:
          YookassaAmountModel.fromJson(json['amount'] as Map<String, dynamic>),
      paymentId: json['payment_id'] as String,
      status: $enumDecode(_$YookassaPayStatusEnumEnumMap, json['status']),
    );

Map<String, dynamic> _$$YookassaRefundGetModelImplToJson(
        _$YookassaRefundGetModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'payment_id': instance.paymentId,
      'status': _$YookassaPayStatusEnumEnumMap[instance.status]!,
    };

const _$YookassaPayStatusEnumEnumMap = {
  YookassaPayStatusEnum.pending: 'pending',
  YookassaPayStatusEnum.succeeded: 'succeeded',
  YookassaPayStatusEnum.canceled: 'canceled',
};
