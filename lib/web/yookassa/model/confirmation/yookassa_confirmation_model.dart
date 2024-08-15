import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/enums/yookassa_confirmation_type_enum.dart';
part 'yookassa_confirmation_model.freezed.dart';
part 'yookassa_confirmation_model.g.dart';

@freezed
class YookassaConfirmationModel with _$YookassaConfirmationModel {
  factory YookassaConfirmationModel(
          {required YookassaConfirmationTypeEnum type,
          // ignore: invalid_annotation_target
          @JsonKey(name: 'confirmation_url') required String? confirmationUrl,
          // ignore: invalid_annotation_target
          @JsonKey(name: 'return_url') required String? returnUrl}) =
      _YookassaConfirmationModel;
  factory YookassaConfirmationModel.fromJson(Map<String, dynamic> json) =>
      _$YookassaConfirmationModelFromJson(json);
}
