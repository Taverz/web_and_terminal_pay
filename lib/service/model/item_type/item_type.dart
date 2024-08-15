import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_type.freezed.dart';

@freezed
abstract class ItemType with _$ItemType {
  factory ItemType(
      {required String name,
      required double price,
      required double quantity,
      required String measurementUnit}) = _ItemType;
}
