// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_pos_service_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetPosServiceModel {
  String get clientId => throw _privateConstructorUsedError;
  String get idempotenceKeyERN => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  String? get receipt => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  PosOpTypes get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetPosServiceModelCopyWith<GetPosServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetPosServiceModelCopyWith<$Res> {
  factory $GetPosServiceModelCopyWith(
          GetPosServiceModel value, $Res Function(GetPosServiceModel) then) =
      _$GetPosServiceModelCopyWithImpl<$Res, GetPosServiceModel>;
  @useResult
  $Res call(
      {String clientId,
      String idempotenceKeyERN,
      bool success,
      String? receipt,
      DateTime dateTime,
      PosOpTypes type});
}

/// @nodoc
class _$GetPosServiceModelCopyWithImpl<$Res, $Val extends GetPosServiceModel>
    implements $GetPosServiceModelCopyWith<$Res> {
  _$GetPosServiceModelCopyWithImpl(this._value, this._then);

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
abstract class _$$GetPosServiceModelImplCopyWith<$Res>
    implements $GetPosServiceModelCopyWith<$Res> {
  factory _$$GetPosServiceModelImplCopyWith(_$GetPosServiceModelImpl value,
          $Res Function(_$GetPosServiceModelImpl) then) =
      __$$GetPosServiceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String clientId,
      String idempotenceKeyERN,
      bool success,
      String? receipt,
      DateTime dateTime,
      PosOpTypes type});
}

/// @nodoc
class __$$GetPosServiceModelImplCopyWithImpl<$Res>
    extends _$GetPosServiceModelCopyWithImpl<$Res, _$GetPosServiceModelImpl>
    implements _$$GetPosServiceModelImplCopyWith<$Res> {
  __$$GetPosServiceModelImplCopyWithImpl(_$GetPosServiceModelImpl _value,
      $Res Function(_$GetPosServiceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientId = null,
    Object? idempotenceKeyERN = null,
    Object? success = null,
    Object? receipt = freezed,
    Object? dateTime = null,
    Object? type = null,
  }) {
    return _then(_$GetPosServiceModelImpl(
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

class _$GetPosServiceModelImpl implements _GetPosServiceModel {
  _$GetPosServiceModelImpl(
      {required this.clientId,
      required this.idempotenceKeyERN,
      required this.success,
      required this.receipt,
      required this.dateTime,
      this.type = PosOpTypes.service});

  @override
  final String clientId;
  @override
  final String idempotenceKeyERN;
  @override
  final bool success;
  @override
  final String? receipt;
  @override
  final DateTime dateTime;
  @override
  @JsonKey()
  final PosOpTypes type;

  @override
  String toString() {
    return 'GetPosServiceModel(clientId: $clientId, idempotenceKeyERN: $idempotenceKeyERN, success: $success, receipt: $receipt, dateTime: $dateTime, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPosServiceModelImpl &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.idempotenceKeyERN, idempotenceKeyERN) ||
                other.idempotenceKeyERN == idempotenceKeyERN) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.receipt, receipt) || other.receipt == receipt) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, clientId, idempotenceKeyERN,
      success, receipt, dateTime, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetPosServiceModelImplCopyWith<_$GetPosServiceModelImpl> get copyWith =>
      __$$GetPosServiceModelImplCopyWithImpl<_$GetPosServiceModelImpl>(
          this, _$identity);
}

abstract class _GetPosServiceModel implements GetPosServiceModel {
  factory _GetPosServiceModel(
      {required final String clientId,
      required final String idempotenceKeyERN,
      required final bool success,
      required final String? receipt,
      required final DateTime dateTime,
      final PosOpTypes type}) = _$GetPosServiceModelImpl;

  @override
  String get clientId;
  @override
  String get idempotenceKeyERN;
  @override
  bool get success;
  @override
  String? get receipt;
  @override
  DateTime get dateTime;
  @override
  PosOpTypes get type;
  @override
  @JsonKey(ignore: true)
  _$$GetPosServiceModelImplCopyWith<_$GetPosServiceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
