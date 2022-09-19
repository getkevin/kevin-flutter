// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'creditor_account_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreditorAccountDTO _$CreditorAccountDTOFromJson(Map<String, dynamic> json) {
  return _CreditorAccountDTO.fromJson(json);
}

/// @nodoc
class _$CreditorAccountDTOTearOff {
  const _$CreditorAccountDTOTearOff();

  _CreditorAccountDTO call(
      {required String currencyCode, required String iban}) {
    return _CreditorAccountDTO(
      currencyCode: currencyCode,
      iban: iban,
    );
  }

  CreditorAccountDTO fromJson(Map<String, Object?> json) {
    return CreditorAccountDTO.fromJson(json);
  }
}

/// @nodoc
const $CreditorAccountDTO = _$CreditorAccountDTOTearOff();

/// @nodoc
mixin _$CreditorAccountDTO {
  String get currencyCode => throw _privateConstructorUsedError;
  String get iban => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreditorAccountDTOCopyWith<CreditorAccountDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditorAccountDTOCopyWith<$Res> {
  factory $CreditorAccountDTOCopyWith(
          CreditorAccountDTO value, $Res Function(CreditorAccountDTO) then) =
      _$CreditorAccountDTOCopyWithImpl<$Res>;
  $Res call({String currencyCode, String iban});
}

/// @nodoc
class _$CreditorAccountDTOCopyWithImpl<$Res>
    implements $CreditorAccountDTOCopyWith<$Res> {
  _$CreditorAccountDTOCopyWithImpl(this._value, this._then);

  final CreditorAccountDTO _value;
  // ignore: unused_field
  final $Res Function(CreditorAccountDTO) _then;

  @override
  $Res call({
    Object? currencyCode = freezed,
    Object? iban = freezed,
  }) {
    return _then(_value.copyWith(
      currencyCode: currencyCode == freezed
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      iban: iban == freezed
          ? _value.iban
          : iban // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CreditorAccountDTOCopyWith<$Res>
    implements $CreditorAccountDTOCopyWith<$Res> {
  factory _$CreditorAccountDTOCopyWith(
          _CreditorAccountDTO value, $Res Function(_CreditorAccountDTO) then) =
      __$CreditorAccountDTOCopyWithImpl<$Res>;
  @override
  $Res call({String currencyCode, String iban});
}

/// @nodoc
class __$CreditorAccountDTOCopyWithImpl<$Res>
    extends _$CreditorAccountDTOCopyWithImpl<$Res>
    implements _$CreditorAccountDTOCopyWith<$Res> {
  __$CreditorAccountDTOCopyWithImpl(
      _CreditorAccountDTO _value, $Res Function(_CreditorAccountDTO) _then)
      : super(_value, (v) => _then(v as _CreditorAccountDTO));

  @override
  _CreditorAccountDTO get _value => super._value as _CreditorAccountDTO;

  @override
  $Res call({
    Object? currencyCode = freezed,
    Object? iban = freezed,
  }) {
    return _then(_CreditorAccountDTO(
      currencyCode: currencyCode == freezed
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      iban: iban == freezed
          ? _value.iban
          : iban // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreditorAccountDTO extends _CreditorAccountDTO {
  const _$_CreditorAccountDTO({required this.currencyCode, required this.iban})
      : super._();

  factory _$_CreditorAccountDTO.fromJson(Map<String, dynamic> json) =>
      _$$_CreditorAccountDTOFromJson(json);

  @override
  final String currencyCode;
  @override
  final String iban;

  @override
  String toString() {
    return 'CreditorAccountDTO(currencyCode: $currencyCode, iban: $iban)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreditorAccountDTO &&
            const DeepCollectionEquality()
                .equals(other.currencyCode, currencyCode) &&
            const DeepCollectionEquality().equals(other.iban, iban));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currencyCode),
      const DeepCollectionEquality().hash(iban));

  @JsonKey(ignore: true)
  @override
  _$CreditorAccountDTOCopyWith<_CreditorAccountDTO> get copyWith =>
      __$CreditorAccountDTOCopyWithImpl<_CreditorAccountDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreditorAccountDTOToJson(this);
  }
}

abstract class _CreditorAccountDTO extends CreditorAccountDTO {
  const factory _CreditorAccountDTO(
      {required String currencyCode,
      required String iban}) = _$_CreditorAccountDTO;
  const _CreditorAccountDTO._() : super._();

  factory _CreditorAccountDTO.fromJson(Map<String, dynamic> json) =
      _$_CreditorAccountDTO.fromJson;

  @override
  String get currencyCode;
  @override
  String get iban;
  @override
  @JsonKey(ignore: true)
  _$CreditorAccountDTOCopyWith<_CreditorAccountDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
