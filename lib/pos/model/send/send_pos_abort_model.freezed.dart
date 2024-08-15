// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_pos_abort_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SendPosAbortModel {
  String get clientId => throw _privateConstructorUsedError;
  String get idempotenceKeyERN => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SendPosAbortModelCopyWith<SendPosAbortModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendPosAbortModelCopyWith<$Res> {
  factory $SendPosAbortModelCopyWith(
          SendPosAbortModel value, $Res Function(SendPosAbortModel) then) =
      _$SendPosAbortModelCopyWithImpl<$Res, SendPosAbortModel>;
  @useResult
  $Res call({String clientId, String idempotenceKeyERN});
}

/// @nodoc
class _$SendPosAbortModelCopyWithImpl<$Res, $Val extends SendPosAbortModel>
    implements $SendPosAbortModelCopyWith<$Res> {
  _$SendPosAbortModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientId = null,
    Object? idempotenceKeyERN = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendPosAbortModelImplCopyWith<$Res>
    implements $SendPosAbortModelCopyWith<$Res> {
  factory _$$SendPosAbortModelImplCopyWith(_$SendPosAbortModelImpl value,
          $Res Function(_$SendPosAbortModelImpl) then) =
      __$$SendPosAbortModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String clientId, String idempotenceKeyERN});
}

/// @nodoc
class __$$SendPosAbortModelImplCopyWithImpl<$Res>
    extends _$SendPosAbortModelCopyWithImpl<$Res, _$SendPosAbortModelImpl>
    implements _$$SendPosAbortModelImplCopyWith<$Res> {
  __$$SendPosAbortModelImplCopyWithImpl(_$SendPosAbortModelImpl _value,
      $Res Function(_$SendPosAbortModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientId = null,
    Object? idempotenceKeyERN = null,
  }) {
    return _then(_$SendPosAbortModelImpl(
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      idempotenceKeyERN: null == idempotenceKeyERN
          ? _value.idempotenceKeyERN
          : idempotenceKeyERN // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendPosAbortModelImpl implements _SendPosAbortModel {
  _$SendPosAbortModelImpl(
      {required this.clientId, required this.idempotenceKeyERN});

  @override
  final String clientId;
  @override
  final String idempotenceKeyERN;

  @override
  String toString() {
    return 'SendPosAbortModel(clientId: $clientId, idempotenceKeyERN: $idempotenceKeyERN)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendPosAbortModelImpl &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.idempotenceKeyERN, idempotenceKeyERN) ||
                other.idempotenceKeyERN == idempotenceKeyERN));
  }

  @override
  int get hashCode => Object.hash(runtimeType, clientId, idempotenceKeyERN);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendPosAbortModelImplCopyWith<_$SendPosAbortModelImpl> get copyWith =>
      __$$SendPosAbortModelImplCopyWithImpl<_$SendPosAbortModelImpl>(
          this, _$identity);
}

abstract class _SendPosAbortModel implements SendPosAbortModel {
  factory _SendPosAbortModel(
      {required final String clientId,
      required final String idempotenceKeyERN}) = _$SendPosAbortModelImpl;

  @override
  String get clientId;
  @override
  String get idempotenceKeyERN;
  @override
  @JsonKey(ignore: true)
  _$$SendPosAbortModelImplCopyWith<_$SendPosAbortModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
