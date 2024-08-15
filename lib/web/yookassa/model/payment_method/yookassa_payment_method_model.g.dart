// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yookassa_payment_method_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YookassaPaymentMethodModelImpl _$$YookassaPaymentMethodModelImplFromJson(
        Map<String, dynamic> json) =>
    _$YookassaPaymentMethodModelImpl(
      type: $enumDecode(_$YookassaPaymentTypeEnumEnumMap, json['type']),
    );

Map<String, dynamic> _$$YookassaPaymentMethodModelImplToJson(
        _$YookassaPaymentMethodModelImpl instance) =>
    <String, dynamic>{
      'type': _$YookassaPaymentTypeEnumEnumMap[instance.type]!,
    };

const _$YookassaPaymentTypeEnumEnumMap = {
  YookassaPaymentTypeEnum.bankCard: 'bank_card',
  YookassaPaymentTypeEnum.youMoney: 'yoo_money',
  YookassaPaymentTypeEnum.qiwi: 'qiwi',
  YookassaPaymentTypeEnum.sberbank: 'sberbank',
  YookassaPaymentTypeEnum.tinkoffBank: 'tinkoff_bank',
  YookassaPaymentTypeEnum.sbp: 'sbp',
};
