// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yookassa_confirmation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

YookassaConfirmationModel _$YookassaConfirmationModelFromJson(
    Map<String, dynamic> json) {
  return _YookassaConfirmationModel.fromJson(json);
}

/// @nodoc
mixin _$YookassaConfirmationModel {
  YookassaConfirmationTypeEnum get type =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'confirmation_url')
  String? get confirmationUrl =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'return_url')
  String? get returnUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $YookassaConfirmationModelCopyWith<YookassaConfirmationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YookassaConfirmationModelCopyWith<$Res> {
  factory $YookassaConfirmationModelCopyWith(YookassaConfirmationModel value,
          $Res Function(YookassaConfirmationModel) then) =
      _$YookassaConfirmationModelCopyWithImpl<$Res, YookassaConfirmationModel>;
  @useResult
  $Res call(
      {YookassaConfirmationTypeEnum type,
      @JsonKey(name: 'confirmation_url') String? confirmationUrl,
      @JsonKey(name: 'return_url') String? returnUrl});
}

/// @nodoc
class _$YookassaConfirmationModelCopyWithImpl<$Res,
        $Val extends YookassaConfirmationModel>
    implements $YookassaConfirmationModelCopyWith<$Res> {
  _$YookassaConfirmationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? confirmationUrl = freezed,
    Object? returnUrl = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as YookassaConfirmationTypeEnum,
      confirmationUrl: freezed == confirmationUrl
          ? _value.confirmationUrl
          : confirmationUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      returnUrl: freezed == returnUrl
          ? _value.returnUrl
          : returnUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$YookassaConfirmationModelImplCopyWith<$Res>
    implements $YookassaConfirmationModelCopyWith<$Res> {
  factory _$$YookassaConfirmationModelImplCopyWith(
          _$YookassaConfirmationModelImpl value,
          $Res Function(_$YookassaConfirmationModelImpl) then) =
      __$$YookassaConfirmationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {YookassaConfirmationTypeEnum type,
      @JsonKey(name: 'confirmation_url') String? confirmationUrl,
      @JsonKey(name: 'return_url') String? returnUrl});
}

/// @nodoc
class __$$YookassaConfirmationModelImplCopyWithImpl<$Res>
    extends _$YookassaConfirmationModelCopyWithImpl<$Res,
        _$YookassaConfirmationModelImpl>
    implements _$$YookassaConfirmationModelImplCopyWith<$Res> {
  __$$YookassaConfirmationModelImplCopyWithImpl(
      _$YookassaConfirmationModelImpl _value,
      $Res Function(_$YookassaConfirmationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? confirmationUrl = freezed,
    Object? returnUrl = freezed,
  }) {
    return _then(_$YookassaConfirmationModelImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as YookassaConfirmationTypeEnum,
      confirmationUrl: freezed == confirmationUrl
          ? _value.confirmationUrl
          : confirmationUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      returnUrl: freezed == returnUrl
          ? _value.returnUrl
          : returnUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$YookassaConfirmationModelImpl implements _YookassaConfirmationModel {
  _$YookassaConfirmationModelImpl(
      {required this.type,
      @JsonKey(name: 'confirmation_url') required this.confirmationUrl,
      @JsonKey(name: 'return_url') required this.returnUrl});

  factory _$YookassaConfirmationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$YookassaConfirmationModelImplFromJson(json);

  @override
  final YookassaConfirmationTypeEnum type;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'confirmation_url')
  final String? confirmationUrl;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'return_url')
  final String? returnUrl;

  @override
  String toString() {
    return 'YookassaConfirmationModel(type: $type, confirmationUrl: $confirmationUrl, returnUrl: $returnUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YookassaConfirmationModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.confirmationUrl, confirmationUrl) ||
                other.confirmationUrl == confirmationUrl) &&
            (identical(other.returnUrl, returnUrl) ||
                other.returnUrl == returnUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, confirmationUrl, returnUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$YookassaConfirmationModelImplCopyWith<_$YookassaConfirmationModelImpl>
      get copyWith => __$$YookassaConfirmationModelImplCopyWithImpl<
          _$YookassaConfirmationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$YookassaConfirmationModelImplToJson(
      this,
    );
  }
}

abstract class _YookassaConfirmationModel implements YookassaConfirmationModel {
  factory _YookassaConfirmationModel(
      {required final YookassaConfirmationTypeEnum type,
      @JsonKey(name: 'confirmation_url') required final String? confirmationUrl,
      @JsonKey(name: 'return_url')
      required final String? returnUrl}) = _$YookassaConfirmationModelImpl;

  factory _YookassaConfirmationModel.fromJson(Map<String, dynamic> json) =
      _$YookassaConfirmationModelImpl.fromJson;

  @override
  YookassaConfirmationTypeEnum get type;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'confirmation_url')
  String? get confirmationUrl;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'return_url')
  String? get returnUrl;
  @override
  @JsonKey(ignore: true)
  _$$YookassaConfirmationModelImplCopyWith<_$YookassaConfirmationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
