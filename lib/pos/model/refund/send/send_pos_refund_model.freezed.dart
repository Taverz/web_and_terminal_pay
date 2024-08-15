// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_pos_refund_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SendPosRefundModel {
  String get clientId => throw _privateConstructorUsedError;
  String get idempotenceKeyERN => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get rrn => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SendPosRefundModelCopyWith<SendPosRefundModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendPosRefundModelCopyWith<$Res> {
  factory $SendPosRefundModelCopyWith(
          SendPosRefundModel value, $Res Function(SendPosRefundModel) then) =
      _$SendPosRefundModelCopyWithImpl<$Res, SendPosRefundModel>;
  @useResult
  $Res call(
      {String clientId, String idempotenceKeyERN, double amount, String rrn});
}

/// @nodoc
class _$SendPosRefundModelCopyWithImpl<$Res, $Val extends SendPosRefundModel>
    implements $SendPosRefundModelCopyWith<$Res> {
  _$SendPosRefundModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientId = null,
    Object? idempotenceKeyERN = null,
    Object? amount = null,
    Object? rrn = null,
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
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      rrn: null == rrn
          ? _value.rrn
          : rrn // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendPosRefundModelImplCopyWith<$Res>
    implements $SendPosRefundModelCopyWith<$Res> {
  factory _$$SendPosRefundModelImplCopyWith(_$SendPosRefundModelImpl value,
          $Res Function(_$SendPosRefundModelImpl) then) =
      __$$SendPosRefundModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String clientId, String idempotenceKeyERN, double amount, String rrn});
}

/// @nodoc
class __$$SendPosRefundModelImplCopyWithImpl<$Res>
    extends _$SendPosRefundModelCopyWithImpl<$Res, _$SendPosRefundModelImpl>
    implements _$$SendPosRefundModelImplCopyWith<$Res> {
  __$$SendPosRefundModelImplCopyWithImpl(_$SendPosRefundModelImpl _value,
      $Res Function(_$SendPosRefundModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientId = null,
    Object? idempotenceKeyERN = null,
    Object? amount = null,
    Object? rrn = null,
  }) {
    return _then(_$SendPosRefundModelImpl(
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      idempotenceKeyERN: null == idempotenceKeyERN
          ? _value.idempotenceKeyERN
          : idempotenceKeyERN // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      rrn: null == rrn
          ? _value.rrn
          : rrn // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendPosRefundModelImpl implements _SendPosRefundModel {
  _$SendPosRefundModelImpl(
      {required this.clientId,
      required this.idempotenceKeyERN,
      required this.amount,
      required this.rrn});

  @override
  final String clientId;
  @override
  final String idempotenceKeyERN;
  @override
  final double amount;
  @override
  final String rrn;

  @override
  String toString() {
    return 'SendPosRefundModel(clientId: $clientId, idempotenceKeyERN: $idempotenceKeyERN, amount: $amount, rrn: $rrn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendPosRefundModelImpl &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.idempotenceKeyERN, idempotenceKeyERN) ||
                other.idempotenceKeyERN == idempotenceKeyERN) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.rrn, rrn) || other.rrn == rrn));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, clientId, idempotenceKeyERN, amount, rrn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendPosRefundModelImplCopyWith<_$SendPosRefundModelImpl> get copyWith =>
      __$$SendPosRefundModelImplCopyWithImpl<_$SendPosRefundModelImpl>(
          this, _$identity);
}

abstract class _SendPosRefundModel implements SendPosRefundModel {
  factory _SendPosRefundModel(
      {required final String clientId,
      required final String idempotenceKeyERN,
      required final double amount,
      required final String rrn}) = _$SendPosRefundModelImpl;

  @override
  String get clientId;
  @override
  String get idempotenceKeyERN;
  @override
  double get amount;
  @override
  String get rrn;
  @override
  @JsonKey(ignore: true)
  _$$SendPosRefundModelImplCopyWith<_$SendPosRefundModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
