// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pos_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PosSettingsModel _$PosSettingsModelFromJson(Map<String, dynamic> json) {
  return _PosSettingsModel.fromJson(json);
}

/// @nodoc
mixin _$PosSettingsModel {
  String get terminalIP => throw _privateConstructorUsedError;
  int get terminalPort => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PosSettingsModelCopyWith<PosSettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PosSettingsModelCopyWith<$Res> {
  factory $PosSettingsModelCopyWith(
          PosSettingsModel value, $Res Function(PosSettingsModel) then) =
      _$PosSettingsModelCopyWithImpl<$Res, PosSettingsModel>;
  @useResult
  $Res call({String terminalIP, int terminalPort});
}

/// @nodoc
class _$PosSettingsModelCopyWithImpl<$Res, $Val extends PosSettingsModel>
    implements $PosSettingsModelCopyWith<$Res> {
  _$PosSettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? terminalIP = null,
    Object? terminalPort = null,
  }) {
    return _then(_value.copyWith(
      terminalIP: null == terminalIP
          ? _value.terminalIP
          : terminalIP // ignore: cast_nullable_to_non_nullable
              as String,
      terminalPort: null == terminalPort
          ? _value.terminalPort
          : terminalPort // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PosSettingsModelImplCopyWith<$Res>
    implements $PosSettingsModelCopyWith<$Res> {
  factory _$$PosSettingsModelImplCopyWith(_$PosSettingsModelImpl value,
          $Res Function(_$PosSettingsModelImpl) then) =
      __$$PosSettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String terminalIP, int terminalPort});
}

/// @nodoc
class __$$PosSettingsModelImplCopyWithImpl<$Res>
    extends _$PosSettingsModelCopyWithImpl<$Res, _$PosSettingsModelImpl>
    implements _$$PosSettingsModelImplCopyWith<$Res> {
  __$$PosSettingsModelImplCopyWithImpl(_$PosSettingsModelImpl _value,
      $Res Function(_$PosSettingsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? terminalIP = null,
    Object? terminalPort = null,
  }) {
    return _then(_$PosSettingsModelImpl(
      terminalIP: null == terminalIP
          ? _value.terminalIP
          : terminalIP // ignore: cast_nullable_to_non_nullable
              as String,
      terminalPort: null == terminalPort
          ? _value.terminalPort
          : terminalPort // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PosSettingsModelImpl implements _PosSettingsModel {
  _$PosSettingsModelImpl(
      {required this.terminalIP, required this.terminalPort});

  factory _$PosSettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PosSettingsModelImplFromJson(json);

  @override
  final String terminalIP;
  @override
  final int terminalPort;

  @override
  String toString() {
    return 'PosSettingsModel(terminalIP: $terminalIP, terminalPort: $terminalPort)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PosSettingsModelImpl &&
            (identical(other.terminalIP, terminalIP) ||
                other.terminalIP == terminalIP) &&
            (identical(other.terminalPort, terminalPort) ||
                other.terminalPort == terminalPort));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, terminalIP, terminalPort);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PosSettingsModelImplCopyWith<_$PosSettingsModelImpl> get copyWith =>
      __$$PosSettingsModelImplCopyWithImpl<_$PosSettingsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PosSettingsModelImplToJson(
      this,
    );
  }
}

abstract class _PosSettingsModel implements PosSettingsModel {
  factory _PosSettingsModel(
      {required final String terminalIP,
      required final int terminalPort}) = _$PosSettingsModelImpl;

  factory _PosSettingsModel.fromJson(Map<String, dynamic> json) =
      _$PosSettingsModelImpl.fromJson;

  @override
  String get terminalIP;
  @override
  int get terminalPort;
  @override
  @JsonKey(ignore: true)
  _$$PosSettingsModelImplCopyWith<_$PosSettingsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
