// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yookassa_refund_get_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

YookassaRefundGetModel _$YookassaRefundGetModelFromJson(
    Map<String, dynamic> json) {
  return _YookassaRefundGetModel.fromJson(json);
}

/// @nodoc
mixin _$YookassaRefundGetModel {
  String get id => throw _privateConstructorUsedError;
  YookassaAmountModel get amount =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'created_at') required DateTime createdAt,
  @JsonKey(name: 'payment_id')
  String get paymentId => throw _privateConstructorUsedError;
  YookassaPayStatusEnum get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $YookassaRefundGetModelCopyWith<YookassaRefundGetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YookassaRefundGetModelCopyWith<$Res> {
  factory $YookassaRefundGetModelCopyWith(YookassaRefundGetModel value,
          $Res Function(YookassaRefundGetModel) then) =
      _$YookassaRefundGetModelCopyWithImpl<$Res, YookassaRefundGetModel>;
  @useResult
  $Res call(
      {String id,
      YookassaAmountModel amount,
      @JsonKey(name: 'payment_id') String paymentId,
      YookassaPayStatusEnum status});

  $YookassaAmountModelCopyWith<$Res> get amount;
}

/// @nodoc
class _$YookassaRefundGetModelCopyWithImpl<$Res,
        $Val extends YookassaRefundGetModel>
    implements $YookassaRefundGetModelCopyWith<$Res> {
  _$YookassaRefundGetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? paymentId = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as YookassaAmountModel,
      paymentId: null == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as YookassaPayStatusEnum,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $YookassaAmountModelCopyWith<$Res> get amount {
    return $YookassaAmountModelCopyWith<$Res>(_value.amount, (value) {
      return _then(_value.copyWith(amount: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$YookassaRefundGetModelImplCopyWith<$Res>
    implements $YookassaRefundGetModelCopyWith<$Res> {
  factory _$$YookassaRefundGetModelImplCopyWith(
          _$YookassaRefundGetModelImpl value,
          $Res Function(_$YookassaRefundGetModelImpl) then) =
      __$$YookassaRefundGetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      YookassaAmountModel amount,
      @JsonKey(name: 'payment_id') String paymentId,
      YookassaPayStatusEnum status});

  @override
  $YookassaAmountModelCopyWith<$Res> get amount;
}

/// @nodoc
class __$$YookassaRefundGetModelImplCopyWithImpl<$Res>
    extends _$YookassaRefundGetModelCopyWithImpl<$Res,
        _$YookassaRefundGetModelImpl>
    implements _$$YookassaRefundGetModelImplCopyWith<$Res> {
  __$$YookassaRefundGetModelImplCopyWithImpl(
      _$YookassaRefundGetModelImpl _value,
      $Res Function(_$YookassaRefundGetModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? paymentId = null,
    Object? status = null,
  }) {
    return _then(_$YookassaRefundGetModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as YookassaAmountModel,
      paymentId: null == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as YookassaPayStatusEnum,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$YookassaRefundGetModelImpl implements _YookassaRefundGetModel {
  _$YookassaRefundGetModelImpl(
      {required this.id,
      required this.amount,
      @JsonKey(name: 'payment_id') required this.paymentId,
      required this.status});

  factory _$YookassaRefundGetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$YookassaRefundGetModelImplFromJson(json);

  @override
  final String id;
  @override
  final YookassaAmountModel amount;
// @JsonKey(name: 'created_at') required DateTime createdAt,
  @override
  @JsonKey(name: 'payment_id')
  final String paymentId;
  @override
  final YookassaPayStatusEnum status;

  @override
  String toString() {
    return 'YookassaRefundGetModel(id: $id, amount: $amount, paymentId: $paymentId, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YookassaRefundGetModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, amount, paymentId, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$YookassaRefundGetModelImplCopyWith<_$YookassaRefundGetModelImpl>
      get copyWith => __$$YookassaRefundGetModelImplCopyWithImpl<
          _$YookassaRefundGetModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$YookassaRefundGetModelImplToJson(
      this,
    );
  }
}

abstract class _YookassaRefundGetModel implements YookassaRefundGetModel {
  factory _YookassaRefundGetModel(
          {required final String id,
          required final YookassaAmountModel amount,
          @JsonKey(name: 'payment_id') required final String paymentId,
          required final YookassaPayStatusEnum status}) =
      _$YookassaRefundGetModelImpl;

  factory _YookassaRefundGetModel.fromJson(Map<String, dynamic> json) =
      _$YookassaRefundGetModelImpl.fromJson;

  @override
  String get id;
  @override
  YookassaAmountModel get amount;
  @override // @JsonKey(name: 'created_at') required DateTime createdAt,
  @JsonKey(name: 'payment_id')
  String get paymentId;
  @override
  YookassaPayStatusEnum get status;
  @override
  @JsonKey(ignore: true)
  _$$YookassaRefundGetModelImplCopyWith<_$YookassaRefundGetModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
