// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yookassa_payment_method_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

YookassaPaymentMethodModel _$YookassaPaymentMethodModelFromJson(
    Map<String, dynamic> json) {
  return _YookassaPaymentMethodModel.fromJson(json);
}

/// @nodoc
mixin _$YookassaPaymentMethodModel {
  YookassaPaymentTypeEnum get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $YookassaPaymentMethodModelCopyWith<YookassaPaymentMethodModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YookassaPaymentMethodModelCopyWith<$Res> {
  factory $YookassaPaymentMethodModelCopyWith(YookassaPaymentMethodModel value,
          $Res Function(YookassaPaymentMethodModel) then) =
      _$YookassaPaymentMethodModelCopyWithImpl<$Res,
          YookassaPaymentMethodModel>;
  @useResult
  $Res call({YookassaPaymentTypeEnum type});
}

/// @nodoc
class _$YookassaPaymentMethodModelCopyWithImpl<$Res,
        $Val extends YookassaPaymentMethodModel>
    implements $YookassaPaymentMethodModelCopyWith<$Res> {
  _$YookassaPaymentMethodModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as YookassaPaymentTypeEnum,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$YookassaPaymentMethodModelImplCopyWith<$Res>
    implements $YookassaPaymentMethodModelCopyWith<$Res> {
  factory _$$YookassaPaymentMethodModelImplCopyWith(
          _$YookassaPaymentMethodModelImpl value,
          $Res Function(_$YookassaPaymentMethodModelImpl) then) =
      __$$YookassaPaymentMethodModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({YookassaPaymentTypeEnum type});
}

/// @nodoc
class __$$YookassaPaymentMethodModelImplCopyWithImpl<$Res>
    extends _$YookassaPaymentMethodModelCopyWithImpl<$Res,
        _$YookassaPaymentMethodModelImpl>
    implements _$$YookassaPaymentMethodModelImplCopyWith<$Res> {
  __$$YookassaPaymentMethodModelImplCopyWithImpl(
      _$YookassaPaymentMethodModelImpl _value,
      $Res Function(_$YookassaPaymentMethodModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$YookassaPaymentMethodModelImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as YookassaPaymentTypeEnum,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$YookassaPaymentMethodModelImpl implements _YookassaPaymentMethodModel {
  _$YookassaPaymentMethodModelImpl({required this.type});

  factory _$YookassaPaymentMethodModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$YookassaPaymentMethodModelImplFromJson(json);

  @override
  final YookassaPaymentTypeEnum type;

  @override
  String toString() {
    return 'YookassaPaymentMethodModel(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YookassaPaymentMethodModelImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$YookassaPaymentMethodModelImplCopyWith<_$YookassaPaymentMethodModelImpl>
      get copyWith => __$$YookassaPaymentMethodModelImplCopyWithImpl<
          _$YookassaPaymentMethodModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$YookassaPaymentMethodModelImplToJson(
      this,
    );
  }
}

abstract class _YookassaPaymentMethodModel
    implements YookassaPaymentMethodModel {
  factory _YookassaPaymentMethodModel(
          {required final YookassaPaymentTypeEnum type}) =
      _$YookassaPaymentMethodModelImpl;

  factory _YookassaPaymentMethodModel.fromJson(Map<String, dynamic> json) =
      _$YookassaPaymentMethodModelImpl.fromJson;

  @override
  YookassaPaymentTypeEnum get type;
  @override
  @JsonKey(ignore: true)
  _$$YookassaPaymentMethodModelImplCopyWith<_$YookassaPaymentMethodModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
