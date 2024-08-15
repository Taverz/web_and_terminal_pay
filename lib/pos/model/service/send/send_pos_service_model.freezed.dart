// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_pos_service_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SendPosServiceModel {
  String get clientId => throw _privateConstructorUsedError;
  String get idempotenceKeyERN => throw _privateConstructorUsedError;
  PosServiceOpType get serviceType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SendPosServiceModelCopyWith<SendPosServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendPosServiceModelCopyWith<$Res> {
  factory $SendPosServiceModelCopyWith(
          SendPosServiceModel value, $Res Function(SendPosServiceModel) then) =
      _$SendPosServiceModelCopyWithImpl<$Res, SendPosServiceModel>;
  @useResult
  $Res call(
      {String clientId,
      String idempotenceKeyERN,
      PosServiceOpType serviceType});
}

/// @nodoc
class _$SendPosServiceModelCopyWithImpl<$Res, $Val extends SendPosServiceModel>
    implements $SendPosServiceModelCopyWith<$Res> {
  _$SendPosServiceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientId = null,
    Object? idempotenceKeyERN = null,
    Object? serviceType = null,
  }) {
    return _then(_value.copyWith(
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      idempotenceKeyERN: null == idempotenceKeyERN
          ? _value.idempotenceKeyERN
          : idempotenceKeyERN // ignore: cast_nullable_to_non_nullable
              as String,
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as PosServiceOpType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendPosServiceModelImplCopyWith<$Res>
    implements $SendPosServiceModelCopyWith<$Res> {
  factory _$$SendPosServiceModelImplCopyWith(_$SendPosServiceModelImpl value,
          $Res Function(_$SendPosServiceModelImpl) then) =
      __$$SendPosServiceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String clientId,
      String idempotenceKeyERN,
      PosServiceOpType serviceType});
}

/// @nodoc
class __$$SendPosServiceModelImplCopyWithImpl<$Res>
    extends _$SendPosServiceModelCopyWithImpl<$Res, _$SendPosServiceModelImpl>
    implements _$$SendPosServiceModelImplCopyWith<$Res> {
  __$$SendPosServiceModelImplCopyWithImpl(_$SendPosServiceModelImpl _value,
      $Res Function(_$SendPosServiceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientId = null,
    Object? idempotenceKeyERN = null,
    Object? serviceType = null,
  }) {
    return _then(_$SendPosServiceModelImpl(
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      idempotenceKeyERN: null == idempotenceKeyERN
          ? _value.idempotenceKeyERN
          : idempotenceKeyERN // ignore: cast_nullable_to_non_nullable
              as String,
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as PosServiceOpType,
    ));
  }
}

/// @nodoc

class _$SendPosServiceModelImpl implements _SendPosServiceModel {
  _$SendPosServiceModelImpl(
      {required this.clientId,
      required this.idempotenceKeyERN,
      required this.serviceType});

  @override
  final String clientId;
  @override
  final String idempotenceKeyERN;
  @override
  final PosServiceOpType serviceType;

  @override
  String toString() {
    return 'SendPosServiceModel(clientId: $clientId, idempotenceKeyERN: $idempotenceKeyERN, serviceType: $serviceType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendPosServiceModelImpl &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.idempotenceKeyERN, idempotenceKeyERN) ||
                other.idempotenceKeyERN == idempotenceKeyERN) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, clientId, idempotenceKeyERN, serviceType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendPosServiceModelImplCopyWith<_$SendPosServiceModelImpl> get copyWith =>
      __$$SendPosServiceModelImplCopyWithImpl<_$SendPosServiceModelImpl>(
          this, _$identity);
}

abstract class _SendPosServiceModel implements SendPosServiceModel {
  factory _SendPosServiceModel(
      {required final String clientId,
      required final String idempotenceKeyERN,
      required final PosServiceOpType serviceType}) = _$SendPosServiceModelImpl;

  @override
  String get clientId;
  @override
  String get idempotenceKeyERN;
  @override
  PosServiceOpType get serviceType;
  @override
  @JsonKey(ignore: true)
  _$$SendPosServiceModelImplCopyWith<_$SendPosServiceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
