import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_and_terminal_pay/pos/model/enums/pos_op_types.dart';

part 'get_pos_service_model.freezed.dart';

@freezed
abstract class GetPosServiceModel with _$GetPosServiceModel {
  factory GetPosServiceModel({
    required String clientId,
    required String idempotenceKeyERN,
    required bool success,
    required String? receipt,
    required DateTime dateTime,
    @Default(PosOpTypes.service) PosOpTypes type,
  }) = _GetPosServiceModel;
}
