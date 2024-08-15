// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yookassa_amount_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YookassaAmountModelImpl _$$YookassaAmountModelImplFromJson(
        Map<String, dynamic> json) =>
    _$YookassaAmountModelImpl(
      value: (json['value'] as num).toDouble(),
      currency: $enumDecode(_$YookassaCurrencyEnumEnumMap, json['currency']),
    );

Map<String, dynamic> _$$YookassaAmountModelImplToJson(
        _$YookassaAmountModelImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'currency': _$YookassaCurrencyEnumEnumMap[instance.currency]!,
    };

const _$YookassaCurrencyEnumEnumMap = {
  YookassaCurrencyEnum.rub: 'RUB',
};
