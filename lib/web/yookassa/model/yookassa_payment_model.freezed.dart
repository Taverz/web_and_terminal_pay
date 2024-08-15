// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yookassa_payment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

YookassaPaymentModel _$YookassaPaymentModelFromJson(Map<String, dynamic> json) {
  return _YookassaPaymentModel.fromJson(json);
}

/// @nodoc
mixin _$YookassaPaymentModel {
  String get id => throw _privateConstructorUsedError;
  bool get paid => throw _privateConstructorUsedError;
  YookassaAmountModel get amount => throw _privateConstructorUsedError;
  YookassaConfirmationModel get confirmation =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method_data')
  YookassaPaymentMethodModel get paymentMethodModel =>
      throw _privateConstructorUsedError;
  bool get capture => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $YookassaPaymentModelCopyWith<YookassaPaymentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YookassaPaymentModelCopyWith<$Res> {
  factory $YookassaPaymentModelCopyWith(YookassaPaymentModel value,
          $Res Function(YookassaPaymentModel) then) =
      _$YookassaPaymentModelCopyWithImpl<$Res, YookassaPaymentModel>;
  @useResult
  $Res call(
      {String id,
      bool paid,
      YookassaAmountModel amount,
      YookassaConfirmationModel confirmation,
      @JsonKey(name: 'payment_method_data')
      YookassaPaymentMethodModel paymentMethodModel,
      bool capture,
      String description});

  $YookassaAmountModelCopyWith<$Res> get amount;
  $YookassaConfirmationModelCopyWith<$Res> get confirmation;
  $YookassaPaymentMethodModelCopyWith<$Res> get paymentMethodModel;
}

/// @nodoc
class _$YookassaPaymentModelCopyWithImpl<$Res,
        $Val extends YookassaPaymentModel>
    implements $YookassaPaymentModelCopyWith<$Res> {
  _$YookassaPaymentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? paid = null,
    Object? amount = null,
    Object? confirmation = null,
    Object? paymentMethodModel = null,
    Object? capture = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      paid: null == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as bool,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as YookassaAmountModel,
      confirmation: null == confirmation
          ? _value.confirmation
          : confirmation // ignore: cast_nullable_to_non_nullable
              as YookassaConfirmationModel,
      paymentMethodModel: null == paymentMethodModel
          ? _value.paymentMethodModel
          : paymentMethodModel // ignore: cast_nullable_to_non_nullable
              as YookassaPaymentMethodModel,
      capture: null == capture
          ? _value.capture
          : capture // ignore: cast_nullable_to_non_nullable
              as bool,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $YookassaAmountModelCopyWith<$Res> get amount {
    return $YookassaAmountModelCopyWith<$Res>(_value.amount, (value) {
      return _then(_value.copyWith(amount: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $YookassaConfirmationModelCopyWith<$Res> get confirmation {
    return $YookassaConfirmationModelCopyWith<$Res>(_value.confirmation,
        (value) {
      return _then(_value.copyWith(confirmation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $YookassaPaymentMethodModelCopyWith<$Res> get paymentMethodModel {
    return $YookassaPaymentMethodModelCopyWith<$Res>(_value.paymentMethodModel,
        (value) {
      return _then(_value.copyWith(paymentMethodModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$YookassaPaymentModelImplCopyWith<$Res>
    implements $YookassaPaymentModelCopyWith<$Res> {
  factory _$$YookassaPaymentModelImplCopyWith(_$YookassaPaymentModelImpl value,
          $Res Function(_$YookassaPaymentModelImpl) then) =
      __$$YookassaPaymentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      bool paid,
      YookassaAmountModel amount,
      YookassaConfirmationModel confirmation,
      @JsonKey(name: 'payment_method_data')
      YookassaPaymentMethodModel paymentMethodModel,
      bool capture,
      String description});

  @override
  $YookassaAmountModelCopyWith<$Res> get amount;
  @override
  $YookassaConfirmationModelCopyWith<$Res> get confirmation;
  @override
  $YookassaPaymentMethodModelCopyWith<$Res> get paymentMethodModel;
}

/// @nodoc
class __$$YookassaPaymentModelImplCopyWithImpl<$Res>
    extends _$YookassaPaymentModelCopyWithImpl<$Res, _$YookassaPaymentModelImpl>
    implements _$$YookassaPaymentModelImplCopyWith<$Res> {
  __$$YookassaPaymentModelImplCopyWithImpl(_$YookassaPaymentModelImpl _value,
      $Res Function(_$YookassaPaymentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? paid = null,
    Object? amount = null,
    Object? confirmation = null,
    Object? paymentMethodModel = null,
    Object? capture = null,
    Object? description = null,
  }) {
    return _then(_$YookassaPaymentModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      paid: null == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as bool,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as YookassaAmountModel,
      confirmation: null == confirmation
          ? _value.confirmation
          : confirmation // ignore: cast_nullable_to_non_nullable
              as YookassaConfirmationModel,
      paymentMethodModel: null == paymentMethodModel
          ? _value.paymentMethodModel
          : paymentMethodModel // ignore: cast_nullable_to_non_nullable
              as YookassaPaymentMethodModel,
      capture: null == capture
          ? _value.capture
          : capture // ignore: cast_nullable_to_non_nullable
              as bool,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$YookassaPaymentModelImpl implements _YookassaPaymentModel {
  _$YookassaPaymentModelImpl(
      {required this.id,
      required this.paid,
      required this.amount,
      required this.confirmation,
      @JsonKey(name: 'payment_method_data') required this.paymentMethodModel,
      required this.capture,
      required this.description});

  factory _$YookassaPaymentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$YookassaPaymentModelImplFromJson(json);

  @override
  final String id;
  @override
  final bool paid;
  @override
  final YookassaAmountModel amount;
  @override
  final YookassaConfirmationModel confirmation;
  @override
  @JsonKey(name: 'payment_method_data')
  final YookassaPaymentMethodModel paymentMethodModel;
  @override
  final bool capture;
  @override
  final String description;

  @override
  String toString() {
    return 'YookassaPaymentModel(id: $id, paid: $paid, amount: $amount, confirmation: $confirmation, paymentMethodModel: $paymentMethodModel, capture: $capture, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YookassaPaymentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.paid, paid) || other.paid == paid) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.confirmation, confirmation) ||
                other.confirmation == confirmation) &&
            (identical(other.paymentMethodModel, paymentMethodModel) ||
                other.paymentMethodModel == paymentMethodModel) &&
            (identical(other.capture, capture) || other.capture == capture) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, paid, amount, confirmation,
      paymentMethodModel, capture, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$YookassaPaymentModelImplCopyWith<_$YookassaPaymentModelImpl>
      get copyWith =>
          __$$YookassaPaymentModelImplCopyWithImpl<_$YookassaPaymentModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$YookassaPaymentModelImplToJson(
      this,
    );
  }
}

abstract class _YookassaPaymentModel implements YookassaPaymentModel {
  factory _YookassaPaymentModel(
      {required final String id,
      required final bool paid,
      required final YookassaAmountModel amount,
      required final YookassaConfirmationModel confirmation,
      @JsonKey(name: 'payment_method_data')
      required final YookassaPaymentMethodModel paymentMethodModel,
      required final bool capture,
      required final String description}) = _$YookassaPaymentModelImpl;

  factory _YookassaPaymentModel.fromJson(Map<String, dynamic> json) =
      _$YookassaPaymentModelImpl.fromJson;

  @override
  String get id;
  @override
  bool get paid;
  @override
  YookassaAmountModel get amount;
  @override
  YookassaConfirmationModel get confirmation;
  @override
  @JsonKey(name: 'payment_method_data')
  YookassaPaymentMethodModel get paymentMethodModel;
  @override
  bool get capture;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$YookassaPaymentModelImplCopyWith<_$YookassaPaymentModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
