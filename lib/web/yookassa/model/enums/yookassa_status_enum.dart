import 'package:freezed_annotation/freezed_annotation.dart';

enum YookassaPayStatusEnum {
  @JsonValue('pending')
  pending,
  @JsonValue('succeeded')
  succeeded,
  @JsonValue('canceled')
  canceled,
}
