import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_pos_refund_model.freezed.dart';

@freezed
abstract class SendPosRefundModel with _$SendPosRefundModel {
  factory SendPosRefundModel({
    required String clientId,
    required String idempotenceKeyERN,
    required double amount,
    required String rrn,
  }) = _SendPosRefundModel;
}
