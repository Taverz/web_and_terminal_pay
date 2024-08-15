import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_and_terminal_pay/service/model/enums/payment_type_enum.dart';
import 'package:web_and_terminal_pay/service/model/enums/recipe_type_enum.dart';
import 'package:web_and_terminal_pay/service/model/item_type/item_type.dart';

part 'payment_model.freezed.dart';

@freezed
abstract class PaymentModel with _$PaymentModel {
  factory PaymentModel({
    required String id,
    required String description,
    required List<ItemType> items,
    required PaymentType paymentType,
    required RecipeType recipeType,
    required String idSettings,
  }) = _PaymentModel;
}
