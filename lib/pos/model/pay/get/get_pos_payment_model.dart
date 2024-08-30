import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_and_terminal_pay/pos/model/enums/pos_op_types.dart';

part 'get_pos_payment_model.freezed.dart';

@freezed
abstract class GetPosPaymentModel with _$GetPosPaymentModel {
  factory GetPosPaymentModel({
    required String clientId,
    required String idempotenceKeyERN,
    required bool success,
    required String? receipt,
    required String? statusText,
    required double amount,
    required DateTime dateTime,
    required String? rrn,
    @Default(PosOpTypes.pay) PosOpTypes type,
  }) = _GetPosPaymentModel;
}
