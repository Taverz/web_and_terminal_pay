import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_and_terminal_pay/pos/model/enums/pos_op_types.dart';

part 'get_pos_refund_model.freezed.dart';

@freezed
abstract class GetPosRefundModel with _$GetPosRefundModel {
  factory GetPosRefundModel({
    required String clientId,
    required String idempotenceKeyERN,
    required bool success,
    required String? receipt,
    required double amount,
    required DateTime dateTime,
    @Default(PosOpTypes.refund) PosOpTypes type,
  }) = _GetPosRefundModel;
}
