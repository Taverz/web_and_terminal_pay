// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yookassa_confirmation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YookassaConfirmationModelImpl _$$YookassaConfirmationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$YookassaConfirmationModelImpl(
      type: $enumDecode(_$YookassaConfirmationTypeEnumEnumMap, json['type']),
      confirmationUrl: json['confirmation_url'] as String?,
      returnUrl: json['return_url'] as String?,
    );

Map<String, dynamic> _$$YookassaConfirmationModelImplToJson(
        _$YookassaConfirmationModelImpl instance) =>
    <String, dynamic>{
      'type': _$YookassaConfirmationTypeEnumEnumMap[instance.type]!,
      'confirmation_url': instance.confirmationUrl,
      'return_url': instance.returnUrl,
    };

const _$YookassaConfirmationTypeEnumEnumMap = {
  YookassaConfirmationTypeEnum.redirect: 'redirect',
};
