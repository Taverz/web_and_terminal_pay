import 'package:freezed_annotation/freezed_annotation.dart';

part 'pos_settings_model.freezed.dart';
part 'pos_settings_model.g.dart';

@freezed
abstract class PosSettingsModel with _$PosSettingsModel {
  factory PosSettingsModel({
    required String terminalIP,
    required int terminalPort,
  }) = _PosSettingsModel;
  factory PosSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$PosSettingsModelFromJson(json);
}
