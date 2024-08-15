// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_pos_refund_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetPosRefundModel {
  String get clientId => throw _privateConstructorUsedError;
  String get idempotenceKeyERN => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  String? get receipt => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  PosOpTypes get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetPosRefundModelCopyWith<GetPosRefundModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetPosRefundModelCopyWith<$Res> {
  factory $GetPosRefundModelCopyWith(
          GetPosRefundModel value, $Res Function(GetPosRefundModel) then) =
      _$GetPosRefundModelCopyWithImpl<$Res, GetPosRefundModel>;
  @useResult
  $Res call(
      {String clientId,
      String idempotenceKeyERN,
      bool success,
      String? receipt,
      double amount,
      DateTime dateTime,
      PosOpTypes type});
}

/// @nodoc
class _$GetPosRefundModelCopyWithImpl<$Res, $Val extends GetPosRefundModel>
    implements $GetPosRefundModelCopyWith<$Res> {
  _$GetPosRefundModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientId = null,
    Object? idempotenceKeyERN = null,
    Object? success = null,
    Object? receipt = freezed,
    Object? amount = null,
    Object? dateTime = null,
    Object? type = null,
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
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      receipt: freezed == receipt
          ? _value.receipt
          : receipt // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PosOpTypes,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetPosRefundModelImplCopyWith<$Res>
    implements $GetPosRefundModelCopyWith<$Res> {
  factory _$$GetPosRefundModelImplCopyWith(_$GetPosRefundModelImpl value,
          $Res Function(_$GetPosRefundModelImpl) then) =
      __$$GetPosRefundModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String clientId,
      String idempotenceKeyERN,
      bool success,
      String? receipt,
      double amount,
      DateTime dateTime,
      PosOpTypes type});
}

/// @nodoc
class __$$GetPosRefundModelImplCopyWithImpl<$Res>
    extends _$GetPosRefundModelCopyWithImpl<$Res, _$GetPosRefundModelImpl>
    implements _$$GetPosRefundModelImplCopyWith<$Res> {
  __$$GetPosRefundModelImplCopyWithImpl(_$GetPosRefundModelImpl _value,
      $Res Function(_$GetPosRefundModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientId = null,
    Object? idempotenceKeyERN = null,
    Object? success = null,
    Object? receipt = freezed,
    Object? amount = null,
    Object? dateTime = null,
    Object? type = null,
  }) {
    return _then(_$GetPosRefundModelImpl(
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      idempotenceKeyERN: null == idempotenceKeyERN
          ? _value.idempotenceKeyERN
          : idempotenceKeyERN // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      receipt: freezed == receipt
          ? _value.receipt
          : receipt // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PosOpTypes,
    ));
  }
}

/// @nodoc

class _$GetPosRefundModelImpl implements _GetPosRefundModel {
  _$GetPosRefundModelImpl(
      {required this.clientId,
      required this.idempotenceKeyERN,
      required this.success,
      required this.receipt,
      required this.amount,
      required this.dateTime,
      this.type = PosOpTypes.refund});

  @override
  final String clientId;
  @override
  final String idempotenceKeyERN;
  @override
  final bool success;
  @override
  final String? receipt;
  @override
  final double amount;
  @override
  final DateTime dateTime;
  @override
  @JsonKey()
  final PosOpTypes type;

  @override
  String toString() {
    return 'GetPosRefundModel(clientId: $clientId, idempotenceKeyERN: $idempotenceKeyERN, success: $success, receipt: $receipt, amount: $amount, dateTime: $dateTime, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPosRefundModelImpl &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.idempotenceKeyERN, idempotenceKeyERN) ||
                other.idempotenceKeyERN == idempotenceKeyERN) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.receipt, receipt) || other.receipt == receipt) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, clientId, idempotenceKeyERN,
      success, receipt, amount, dateTime, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetPosRefundModelImplCopyWith<_$GetPosRefundModelImpl> get copyWith =>
      __$$GetPosRefundModelImplCopyWithImpl<_$GetPosRefundModelImpl>(
          this, _$identity);
}

abstract class _GetPosRefundModel implements GetPosRefundModel {
  factory _GetPosRefundModel(
      {required final String clientId,
      required final String idempotenceKeyERN,
      required final bool success,
      required final String? receipt,
      required final double amount,
      required final DateTime dateTime,
      final PosOpTypes type}) = _$GetPosRefundModelImpl;

  @override
  String get clientId;
  @override
  String get idempotenceKeyERN;
  @override
  bool get success;
  @override
  String? get receipt;
  @override
  double get amount;
  @override
  DateTime get dateTime;
  @override
  PosOpTypes get type;
  @override
  @JsonKey(ignore: true)
  _$$GetPosRefundModelImplCopyWith<_$GetPosRefundModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
