import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_and_terminal_pay/pos/model/enums/pos_service_op_type.dart';

part 'send_pos_service_model.freezed.dart';

@freezed
abstract class SendPosServiceModel with _$SendPosServiceModel {
  factory SendPosServiceModel(
      {required String clientId,
      required String idempotenceKeyERN,
      required PosServiceOpType serviceType}) = _SendPosServiceModel;
}
