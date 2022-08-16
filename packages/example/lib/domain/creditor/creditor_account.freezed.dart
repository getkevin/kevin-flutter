// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'creditor_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CreditorAccountTearOff {
  const _$CreditorAccountTearOff();

  _CreditorAccount call({required String currencyCode, required String iban}) {
    return _CreditorAccount(
      currencyCode: currencyCode,
      iban: iban,
    );
  }
}

/// @nodoc
const $CreditorAccount = _$CreditorAccountTearOff();

/// @nodoc
mixin _$CreditorAccount {
  String get currencyCode => throw _privateConstructorUsedError;
  String get iban => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreditorAccountCopyWith<CreditorAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditorAccountCopyWith<$Res> {
  factory $CreditorAccountCopyWith(
          CreditorAccount value, $Res Function(CreditorAccount) then) =
      _$CreditorAccountCopyWithImpl<$Res>;
  $Res call({String currencyCode, String iban});
}

/// @nodoc
class _$CreditorAccountCopyWithImpl<$Res>
    implements $CreditorAccountCopyWith<$Res> {
  _$CreditorAccountCopyWithImpl(this._value, this._then);

  final CreditorAccount _value;
  // ignore: unused_field
  final $Res Function(CreditorAccount) _then;

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
abstract class _$CreditorAccountCopyWith<$Res>
    implements $CreditorAccountCopyWith<$Res> {
  factory _$CreditorAccountCopyWith(
          _CreditorAccount value, $Res Function(_CreditorAccount) then) =
      __$CreditorAccountCopyWithImpl<$Res>;
  @override
  $Res call({String currencyCode, String iban});
}

/// @nodoc
class __$CreditorAccountCopyWithImpl<$Res>
    extends _$CreditorAccountCopyWithImpl<$Res>
    implements _$CreditorAccountCopyWith<$Res> {
  __$CreditorAccountCopyWithImpl(
      _CreditorAccount _value, $Res Function(_CreditorAccount) _then)
      : super(_value, (v) => _then(v as _CreditorAccount));

  @override
  _CreditorAccount get _value => super._value as _CreditorAccount;

  @override
  $Res call({
    Object? currencyCode = freezed,
    Object? iban = freezed,
  }) {
    return _then(_CreditorAccount(
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

class _$_CreditorAccount extends _CreditorAccount {
  const _$_CreditorAccount({required this.currencyCode, required this.iban})
      : super._();

  @override
  final String currencyCode;
  @override
  final String iban;

  @override
  String toString() {
    return 'CreditorAccount(currencyCode: $currencyCode, iban: $iban)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreditorAccount &&
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
  _$CreditorAccountCopyWith<_CreditorAccount> get copyWith =>
      __$CreditorAccountCopyWithImpl<_CreditorAccount>(this, _$identity);
}

abstract class _CreditorAccount extends CreditorAccount {
  const factory _CreditorAccount(
      {required String currencyCode,
      required String iban}) = _$_CreditorAccount;
  const _CreditorAccount._() : super._();

  @override
  String get currencyCode;
  @override
  String get iban;
  @override
  @JsonKey(ignore: true)
  _$CreditorAccountCopyWith<_CreditorAccount> get copyWith =>
      throw _privateConstructorUsedError;
}
