import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_pos_abort_model.freezed.dart';

@freezed
abstract class SendPosAbortModel with _$SendPosAbortModel {
  factory SendPosAbortModel({
    required String clientId,
    required String idempotenceKeyERN,
  }) = _SendPosAbortModel;
}
