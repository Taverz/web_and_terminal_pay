// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentModel {
  String get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<ItemType> get items => throw _privateConstructorUsedError;
  PaymentType get paymentType => throw _privateConstructorUsedError;
  RecipeType get recipeType => throw _privateConstructorUsedError;
  String get idSettings => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentModelCopyWith<PaymentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentModelCopyWith<$Res> {
  factory $PaymentModelCopyWith(
          PaymentModel value, $Res Function(PaymentModel) then) =
      _$PaymentModelCopyWithImpl<$Res, PaymentModel>;
  @useResult
  $Res call(
      {String id,
      String description,
      List<ItemType> items,
      PaymentType paymentType,
      RecipeType recipeType,
      String idSettings});
}

/// @nodoc
class _$PaymentModelCopyWithImpl<$Res, $Val extends PaymentModel>
    implements $PaymentModelCopyWith<$Res> {
  _$PaymentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? items = null,
    Object? paymentType = null,
    Object? recipeType = null,
    Object? idSettings = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemType>,
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as PaymentType,
      recipeType: null == recipeType
          ? _value.recipeType
          : recipeType // ignore: cast_nullable_to_non_nullable
              as RecipeType,
      idSettings: null == idSettings
          ? _value.idSettings
          : idSettings // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentModelImplCopyWith<$Res>
    implements $PaymentModelCopyWith<$Res> {
  factory _$$PaymentModelImplCopyWith(
          _$PaymentModelImpl value, $Res Function(_$PaymentModelImpl) then) =
      __$$PaymentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String description,
      List<ItemType> items,
      PaymentType paymentType,
      RecipeType recipeType,
      String idSettings});
}

/// @nodoc
class __$$PaymentModelImplCopyWithImpl<$Res>
    extends _$PaymentModelCopyWithImpl<$Res, _$PaymentModelImpl>
    implements _$$PaymentModelImplCopyWith<$Res> {
  __$$PaymentModelImplCopyWithImpl(
      _$PaymentModelImpl _value, $Res Function(_$PaymentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? items = null,
    Object? paymentType = null,
    Object? recipeType = null,
    Object? idSettings = null,
  }) {
    return _then(_$PaymentModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemType>,
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as PaymentType,
      recipeType: null == recipeType
          ? _value.recipeType
          : recipeType // ignore: cast_nullable_to_non_nullable
              as RecipeType,
      idSettings: null == idSettings
          ? _value.idSettings
          : idSettings // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PaymentModelImpl implements _PaymentModel {
  _$PaymentModelImpl(
      {required this.id,
      required this.description,
      required final List<ItemType> items,
      required this.paymentType,
      required this.recipeType,
      required this.idSettings})
      : _items = items;

  @override
  final String id;
  @override
  final String description;
  final List<ItemType> _items;
  @override
  List<ItemType> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final PaymentType paymentType;
  @override
  final RecipeType recipeType;
  @override
  final String idSettings;

  @override
  String toString() {
    return 'PaymentModel(id: $id, description: $description, items: $items, paymentType: $paymentType, recipeType: $recipeType, idSettings: $idSettings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType) &&
            (identical(other.recipeType, recipeType) ||
                other.recipeType == recipeType) &&
            (identical(other.idSettings, idSettings) ||
                other.idSettings == idSettings));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      description,
      const DeepCollectionEquality().hash(_items),
      paymentType,
      recipeType,
      idSettings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentModelImplCopyWith<_$PaymentModelImpl> get copyWith =>
      __$$PaymentModelImplCopyWithImpl<_$PaymentModelImpl>(this, _$identity);
}

abstract class _PaymentModel implements PaymentModel {
  factory _PaymentModel(
      {required final String id,
      required final String description,
      required final List<ItemType> items,
      required final PaymentType paymentType,
      required final RecipeType recipeType,
      required final String idSettings}) = _$PaymentModelImpl;

  @override
  String get id;
  @override
  String get description;
  @override
  List<ItemType> get items;
  @override
  PaymentType get paymentType;
  @override
  RecipeType get recipeType;
  @override
  String get idSettings;
  @override
  @JsonKey(ignore: true)
  _$$PaymentModelImplCopyWith<_$PaymentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
