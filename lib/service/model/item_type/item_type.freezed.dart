// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ItemType {
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  String get measurementUnit => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ItemTypeCopyWith<ItemType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemTypeCopyWith<$Res> {
  factory $ItemTypeCopyWith(ItemType value, $Res Function(ItemType) then) =
      _$ItemTypeCopyWithImpl<$Res, ItemType>;
  @useResult
  $Res call(
      {String name, double price, double quantity, String measurementUnit});
}

/// @nodoc
class _$ItemTypeCopyWithImpl<$Res, $Val extends ItemType>
    implements $ItemTypeCopyWith<$Res> {
  _$ItemTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? price = null,
    Object? quantity = null,
    Object? measurementUnit = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      measurementUnit: null == measurementUnit
          ? _value.measurementUnit
          : measurementUnit // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemTypeImplCopyWith<$Res>
    implements $ItemTypeCopyWith<$Res> {
  factory _$$ItemTypeImplCopyWith(
          _$ItemTypeImpl value, $Res Function(_$ItemTypeImpl) then) =
      __$$ItemTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, double price, double quantity, String measurementUnit});
}

/// @nodoc
class __$$ItemTypeImplCopyWithImpl<$Res>
    extends _$ItemTypeCopyWithImpl<$Res, _$ItemTypeImpl>
    implements _$$ItemTypeImplCopyWith<$Res> {
  __$$ItemTypeImplCopyWithImpl(
      _$ItemTypeImpl _value, $Res Function(_$ItemTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? price = null,
    Object? quantity = null,
    Object? measurementUnit = null,
  }) {
    return _then(_$ItemTypeImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      measurementUnit: null == measurementUnit
          ? _value.measurementUnit
          : measurementUnit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ItemTypeImpl implements _ItemType {
  _$ItemTypeImpl(
      {required this.name,
      required this.price,
      required this.quantity,
      required this.measurementUnit});

  @override
  final String name;
  @override
  final double price;
  @override
  final double quantity;
  @override
  final String measurementUnit;

  @override
  String toString() {
    return 'ItemType(name: $name, price: $price, quantity: $quantity, measurementUnit: $measurementUnit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemTypeImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.measurementUnit, measurementUnit) ||
                other.measurementUnit == measurementUnit));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, price, quantity, measurementUnit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemTypeImplCopyWith<_$ItemTypeImpl> get copyWith =>
      __$$ItemTypeImplCopyWithImpl<_$ItemTypeImpl>(this, _$identity);
}

abstract class _ItemType implements ItemType {
  factory _ItemType(
      {required final String name,
      required final double price,
      required final double quantity,
      required final String measurementUnit}) = _$ItemTypeImpl;

  @override
  String get name;
  @override
  double get price;
  @override
  double get quantity;
  @override
  String get measurementUnit;
  @override
  @JsonKey(ignore: true)
  _$$ItemTypeImplCopyWith<_$ItemTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
