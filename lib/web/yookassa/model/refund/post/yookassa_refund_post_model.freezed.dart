// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yookassa_refund_post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

YookassaRefundPostModel _$YookassaRefundPostModelFromJson(
    Map<String, dynamic> json) {
  return _YookassaRefundPostModel.fromJson(json);
}

/// @nodoc
mixin _$YookassaRefundPostModel {
  @JsonKey(name: 'payment_id')
  String get paymentId => throw _privateConstructorUsedError;
  YookassaAmountModel get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $YookassaRefundPostModelCopyWith<YookassaRefundPostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YookassaRefundPostModelCopyWith<$Res> {
  factory $YookassaRefundPostModelCopyWith(YookassaRefundPostModel value,
          $Res Function(YookassaRefundPostModel) then) =
      _$YookassaRefundPostModelCopyWithImpl<$Res, YookassaRefundPostModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'payment_id') String paymentId,
      YookassaAmountModel amount});

  $YookassaAmountModelCopyWith<$Res> get amount;
}

/// @nodoc
class _$YookassaRefundPostModelCopyWithImpl<$Res,
        $Val extends YookassaRefundPostModel>
    implements $YookassaRefundPostModelCopyWith<$Res> {
  _$YookassaRefundPostModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentId = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      paymentId: null == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as YookassaAmountModel,
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
abstract class _$$YookassaRefundPostModelImplCopyWith<$Res>
    implements $YookassaRefundPostModelCopyWith<$Res> {
  factory _$$YookassaRefundPostModelImplCopyWith(
          _$YookassaRefundPostModelImpl value,
          $Res Function(_$YookassaRefundPostModelImpl) then) =
      __$$YookassaRefundPostModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'payment_id') String paymentId,
      YookassaAmountModel amount});

  @override
  $YookassaAmountModelCopyWith<$Res> get amount;
}

/// @nodoc
class __$$YookassaRefundPostModelImplCopyWithImpl<$Res>
    extends _$YookassaRefundPostModelCopyWithImpl<$Res,
        _$YookassaRefundPostModelImpl>
    implements _$$YookassaRefundPostModelImplCopyWith<$Res> {
  __$$YookassaRefundPostModelImplCopyWithImpl(
      _$YookassaRefundPostModelImpl _value,
      $Res Function(_$YookassaRefundPostModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentId = null,
    Object? amount = null,
  }) {
    return _then(_$YookassaRefundPostModelImpl(
      paymentId: null == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as YookassaAmountModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$YookassaRefundPostModelImpl implements _YookassaRefundPostModel {
  _$YookassaRefundPostModelImpl(
      {@JsonKey(name: 'payment_id') required this.paymentId,
      required this.amount});

  factory _$YookassaRefundPostModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$YookassaRefundPostModelImplFromJson(json);

  @override
  @JsonKey(name: 'payment_id')
  final String paymentId;
  @override
  final YookassaAmountModel amount;

  @override
  String toString() {
    return 'YookassaRefundPostModel(paymentId: $paymentId, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YookassaRefundPostModelImpl &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, paymentId, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$YookassaRefundPostModelImplCopyWith<_$YookassaRefundPostModelImpl>
      get copyWith => __$$YookassaRefundPostModelImplCopyWithImpl<
          _$YookassaRefundPostModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$YookassaRefundPostModelImplToJson(
      this,
    );
  }
}

abstract class _YookassaRefundPostModel implements YookassaRefundPostModel {
  factory _YookassaRefundPostModel(
          {@JsonKey(name: 'payment_id') required final String paymentId,
          required final YookassaAmountModel amount}) =
      _$YookassaRefundPostModelImpl;

  factory _YookassaRefundPostModel.fromJson(Map<String, dynamic> json) =
      _$YookassaRefundPostModelImpl.fromJson;

  @override
  @JsonKey(name: 'payment_id')
  String get paymentId;
  @override
  YookassaAmountModel get amount;
  @override
  @JsonKey(ignore: true)
  _$$YookassaRefundPostModelImplCopyWith<_$YookassaRefundPostModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
