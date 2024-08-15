// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yookassa_payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YookassaPaymentModelImpl _$$YookassaPaymentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$YookassaPaymentModelImpl(
      id: json['id'] as String,
      paid: json['paid'] as bool,
      amount:
          YookassaAmountModel.fromJson(json['amount'] as Map<String, dynamic>),
      confirmation: YookassaConfirmationModel.fromJson(
          json['confirmation'] as Map<String, dynamic>),
      paymentMethodModel: YookassaPaymentMethodModel.fromJson(
          json['payment_method_data'] as Map<String, dynamic>),
      capture: json['capture'] as bool,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$YookassaPaymentModelImplToJson(
        _$YookassaPaymentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'paid': instance.paid,
      'amount': instance.amount,
      'confirmation': instance.confirmation,
      'payment_method_data': instance.paymentMethodModel,
      'capture': instance.capture,
      'description': instance.description,
    };
