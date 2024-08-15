// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PosSettingsModelImpl _$$PosSettingsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PosSettingsModelImpl(
      terminalIP: json['terminalIP'] as String,
      terminalPort: (json['terminalPort'] as num).toInt(),
    );

Map<String, dynamic> _$$PosSettingsModelImplToJson(
        _$PosSettingsModelImpl instance) =>
    <String, dynamic>{
      'terminalIP': instance.terminalIP,
      'terminalPort': instance.terminalPort,
    };
