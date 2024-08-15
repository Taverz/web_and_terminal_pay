// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yookassa_amount_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

YookassaAmountModel _$YookassaAmountModelFromJson(Map<String, dynamic> json) {
  return _YookassaAmountModel.fromJson(json);
}

/// @nodoc
mixin _$YookassaAmountModel {
  double get value => throw _privateConstructorUsedError;
  YookassaCurrencyEnum get currency => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $YookassaAmountModelCopyWith<YookassaAmountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YookassaAmountModelCopyWith<$Res> {
  factory $YookassaAmountModelCopyWith(
          YookassaAmountModel value, $Res Function(YookassaAmountModel) then) =
      _$YookassaAmountModelCopyWithImpl<$Res, YookassaAmountModel>;
  @useResult
  $Res call({double value, YookassaCurrencyEnum currency});
}

/// @nodoc
class _$YookassaAmountModelCopyWithImpl<$Res, $Val extends YookassaAmountModel>
    implements $YookassaAmountModelCopyWith<$Res> {
  _$YookassaAmountModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? currency = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as YookassaCurrencyEnum,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$YookassaAmountModelImplCopyWith<$Res>
    implements $YookassaAmountModelCopyWith<$Res> {
  factory _$$YookassaAmountModelImplCopyWith(_$YookassaAmountModelImpl value,
          $Res Function(_$YookassaAmountModelImpl) then) =
      __$$YookassaAmountModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double value, YookassaCurrencyEnum currency});
}

/// @nodoc
class __$$YookassaAmountModelImplCopyWithImpl<$Res>
    extends _$YookassaAmountModelCopyWithImpl<$Res, _$YookassaAmountModelImpl>
    implements _$$YookassaAmountModelImplCopyWith<$Res> {
  __$$YookassaAmountModelImplCopyWithImpl(_$YookassaAmountModelImpl _value,
      $Res Function(_$YookassaAmountModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? currency = null,
  }) {
    return _then(_$YookassaAmountModelImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as YookassaCurrencyEnum,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$YookassaAmountModelImpl implements _YookassaAmountModel {
  _$YookassaAmountModelImpl({required this.value, required this.currency});

  factory _$YookassaAmountModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$YookassaAmountModelImplFromJson(json);

  @override
  final double value;
  @override
  final YookassaCurrencyEnum currency;

  @override
  String toString() {
    return 'YookassaAmountModel(value: $value, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YookassaAmountModelImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value, currency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$YookassaAmountModelImplCopyWith<_$YookassaAmountModelImpl> get copyWith =>
      __$$YookassaAmountModelImplCopyWithImpl<_$YookassaAmountModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$YookassaAmountModelImplToJson(
      this,
    );
  }
}

abstract class _YookassaAmountModel implements YookassaAmountModel {
  factory _YookassaAmountModel(
          {required final double value,
          required final YookassaCurrencyEnum currency}) =
      _$YookassaAmountModelImpl;

  factory _YookassaAmountModel.fromJson(Map<String, dynamic> json) =
      _$YookassaAmountModelImpl.fromJson;

  @override
  double get value;
  @override
  YookassaCurrencyEnum get currency;
  @override
  @JsonKey(ignore: true)
  _$$YookassaAmountModelImplCopyWith<_$YookassaAmountModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
