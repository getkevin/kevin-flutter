// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'payment_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PaymentEventTearOff {
  const _$PaymentEventTearOff();

  PaymentLoadInitiated loadInitiated() {
    return const PaymentLoadInitiated();
  }

  PaymentTypeSelected paymentTypeSelected({required PaymentType paymentType}) {
    return PaymentTypeSelected(
      paymentType: paymentType,
    );
  }

  PaymentCountrySelected countrySelected({required String countryCode}) {
    return PaymentCountrySelected(
      countryCode: countryCode,
    );
  }

  PaymentCreditorSelected creditorSelected({required Creditor creditor}) {
    return PaymentCreditorSelected(
      creditor: creditor,
    );
  }

  EmailUpdated emailUpdated({required String email}) {
    return EmailUpdated(
      email: email,
    );
  }

  AmountUpdated amountUpdated({required double amount}) {
    return AmountUpdated(
      amount: amount,
    );
  }

  PrivacyAgreementUpdated privacyAgreementUpdated({required bool isAccepted}) {
    return PrivacyAgreementUpdated(
      isAccepted: isAccepted,
    );
  }

  InitiateDonation initiateDonation() {
    return const InitiateDonation();
  }

  SuccessPresented successPresented() {
    return const SuccessPresented();
  }
}

/// @nodoc
const $PaymentEvent = _$PaymentEventTearOff();

/// @nodoc
mixin _$PaymentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadInitiated,
    required TResult Function(PaymentType paymentType) paymentTypeSelected,
    required TResult Function(String countryCode) countrySelected,
    required TResult Function(Creditor creditor) creditorSelected,
    required TResult Function(String email) emailUpdated,
    required TResult Function(double amount) amountUpdated,
    required TResult Function(bool isAccepted) privacyAgreementUpdated,
    required TResult Function() initiateDonation,
    required TResult Function() successPresented,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadInitiated,
    TResult Function(PaymentType paymentType)? paymentTypeSelected,
    TResult Function(String countryCode)? countrySelected,
    TResult Function(Creditor creditor)? creditorSelected,
    TResult Function(String email)? emailUpdated,
    TResult Function(double amount)? amountUpdated,
    TResult Function(bool isAccepted)? privacyAgreementUpdated,
    TResult Function()? initiateDonation,
    TResult Function()? successPresented,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadInitiated,
    TResult Function(PaymentType paymentType)? paymentTypeSelected,
    TResult Function(String countryCode)? countrySelected,
    TResult Function(Creditor creditor)? creditorSelected,
    TResult Function(String email)? emailUpdated,
    TResult Function(double amount)? amountUpdated,
    TResult Function(bool isAccepted)? privacyAgreementUpdated,
    TResult Function()? initiateDonation,
    TResult Function()? successPresented,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PaymentLoadInitiated value) loadInitiated,
    required TResult Function(PaymentTypeSelected value) paymentTypeSelected,
    required TResult Function(PaymentCountrySelected value) countrySelected,
    required TResult Function(PaymentCreditorSelected value) creditorSelected,
    required TResult Function(EmailUpdated value) emailUpdated,
    required TResult Function(AmountUpdated value) amountUpdated,
    required TResult Function(PrivacyAgreementUpdated value)
        privacyAgreementUpdated,
    required TResult Function(InitiateDonation value) initiateDonation,
    required TResult Function(SuccessPresented value) successPresented,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PaymentLoadInitiated value)? loadInitiated,
    TResult Function(PaymentTypeSelected value)? paymentTypeSelected,
    TResult Function(PaymentCountrySelected value)? countrySelected,
    TResult Function(PaymentCreditorSelected value)? creditorSelected,
    TResult Function(EmailUpdated value)? emailUpdated,
    TResult Function(AmountUpdated value)? amountUpdated,
    TResult Function(PrivacyAgreementUpdated value)? privacyAgreementUpdated,
    TResult Function(InitiateDonation value)? initiateDonation,
    TResult Function(SuccessPresented value)? successPresented,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PaymentLoadInitiated value)? loadInitiated,
    TResult Function(PaymentTypeSelected value)? paymentTypeSelected,
    TResult Function(PaymentCountrySelected value)? countrySelected,
    TResult Function(PaymentCreditorSelected value)? creditorSelected,
    TResult Function(EmailUpdated value)? emailUpdated,
    TResult Function(AmountUpdated value)? amountUpdated,
    TResult Function(PrivacyAgreementUpdated value)? privacyAgreementUpdated,
    TResult Function(InitiateDonation value)? initiateDonation,
    TResult Function(SuccessPresented value)? successPresented,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentEventCopyWith<$Res> {
  factory $PaymentEventCopyWith(
          PaymentEvent value, $Res Function(PaymentEvent) then) =
      _$PaymentEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PaymentEventCopyWithImpl<$Res> implements $PaymentEventCopyWith<$Res> {
  _$PaymentEventCopyWithImpl(this._value, this._then);

  final PaymentEvent _value;
  // ignore: unused_field
  final $Res Function(PaymentEvent) _then;
}

/// @nodoc
abstract class $PaymentLoadInitiatedCopyWith<$Res> {
  factory $PaymentLoadInitiatedCopyWith(PaymentLoadInitiated value,
          $Res Function(PaymentLoadInitiated) then) =
      _$PaymentLoadInitiatedCopyWithImpl<$Res>;
}

/// @nodoc
class _$PaymentLoadInitiatedCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res>
    implements $PaymentLoadInitiatedCopyWith<$Res> {
  _$PaymentLoadInitiatedCopyWithImpl(
      PaymentLoadInitiated _value, $Res Function(PaymentLoadInitiated) _then)
      : super(_value, (v) => _then(v as PaymentLoadInitiated));

  @override
  PaymentLoadInitiated get _value => super._value as PaymentLoadInitiated;
}

/// @nodoc

class _$PaymentLoadInitiated implements PaymentLoadInitiated {
  const _$PaymentLoadInitiated();

  @override
  String toString() {
    return 'PaymentEvent.loadInitiated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PaymentLoadInitiated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadInitiated,
    required TResult Function(PaymentType paymentType) paymentTypeSelected,
    required TResult Function(String countryCode) countrySelected,
    required TResult Function(Creditor creditor) creditorSelected,
    required TResult Function(String email) emailUpdated,
    required TResult Function(double amount) amountUpdated,
    required TResult Function(bool isAccepted) privacyAgreementUpdated,
    required TResult Function() initiateDonation,
    required TResult Function() successPresented,
  }) {
    return loadInitiated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadInitiated,
    TResult Function(PaymentType paymentType)? paymentTypeSelected,
    TResult Function(String countryCode)? countrySelected,
    TResult Function(Creditor creditor)? creditorSelected,
    TResult Function(String email)? emailUpdated,
    TResult Function(double amount)? amountUpdated,
    TResult Function(bool isAccepted)? privacyAgreementUpdated,
    TResult Function()? initiateDonation,
    TResult Function()? successPresented,
  }) {
    return loadInitiated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadInitiated,
    TResult Function(PaymentType paymentType)? paymentTypeSelected,
    TResult Function(String countryCode)? countrySelected,
    TResult Function(Creditor creditor)? creditorSelected,
    TResult Function(String email)? emailUpdated,
    TResult Function(double amount)? amountUpdated,
    TResult Function(bool isAccepted)? privacyAgreementUpdated,
    TResult Function()? initiateDonation,
    TResult Function()? successPresented,
    required TResult orElse(),
  }) {
    if (loadInitiated != null) {
      return loadInitiated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PaymentLoadInitiated value) loadInitiated,
    required TResult Function(PaymentTypeSelected value) paymentTypeSelected,
    required TResult Function(PaymentCountrySelected value) countrySelected,
    required TResult Function(PaymentCreditorSelected value) creditorSelected,
    required TResult Function(EmailUpdated value) emailUpdated,
    required TResult Function(AmountUpdated value) amountUpdated,
    required TResult Function(PrivacyAgreementUpdated value)
        privacyAgreementUpdated,
    required TResult Function(InitiateDonation value) initiateDonation,
    required TResult Function(SuccessPresented value) successPresented,
  }) {
    return loadInitiated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PaymentLoadInitiated value)? loadInitiated,
    TResult Function(PaymentTypeSelected value)? paymentTypeSelected,
    TResult Function(PaymentCountrySelected value)? countrySelected,
    TResult Function(PaymentCreditorSelected value)? creditorSelected,
    TResult Function(EmailUpdated value)? emailUpdated,
    TResult Function(AmountUpdated value)? amountUpdated,
    TResult Function(PrivacyAgreementUpdated value)? privacyAgreementUpdated,
    TResult Function(InitiateDonation value)? initiateDonation,
    TResult Function(SuccessPresented value)? successPresented,
  }) {
    return loadInitiated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PaymentLoadInitiated value)? loadInitiated,
    TResult Function(PaymentTypeSelected value)? paymentTypeSelected,
    TResult Function(PaymentCountrySelected value)? countrySelected,
    TResult Function(PaymentCreditorSelected value)? creditorSelected,
    TResult Function(EmailUpdated value)? emailUpdated,
    TResult Function(AmountUpdated value)? amountUpdated,
    TResult Function(PrivacyAgreementUpdated value)? privacyAgreementUpdated,
    TResult Function(InitiateDonation value)? initiateDonation,
    TResult Function(SuccessPresented value)? successPresented,
    required TResult orElse(),
  }) {
    if (loadInitiated != null) {
      return loadInitiated(this);
    }
    return orElse();
  }
}

abstract class PaymentLoadInitiated implements PaymentEvent {
  const factory PaymentLoadInitiated() = _$PaymentLoadInitiated;
}

/// @nodoc
abstract class $PaymentTypeSelectedCopyWith<$Res> {
  factory $PaymentTypeSelectedCopyWith(
          PaymentTypeSelected value, $Res Function(PaymentTypeSelected) then) =
      _$PaymentTypeSelectedCopyWithImpl<$Res>;
  $Res call({PaymentType paymentType});
}

/// @nodoc
class _$PaymentTypeSelectedCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res>
    implements $PaymentTypeSelectedCopyWith<$Res> {
  _$PaymentTypeSelectedCopyWithImpl(
      PaymentTypeSelected _value, $Res Function(PaymentTypeSelected) _then)
      : super(_value, (v) => _then(v as PaymentTypeSelected));

  @override
  PaymentTypeSelected get _value => super._value as PaymentTypeSelected;

  @override
  $Res call({
    Object? paymentType = freezed,
  }) {
    return _then(PaymentTypeSelected(
      paymentType: paymentType == freezed
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as PaymentType,
    ));
  }
}

/// @nodoc

class _$PaymentTypeSelected implements PaymentTypeSelected {
  const _$PaymentTypeSelected({required this.paymentType});

  @override
  final PaymentType paymentType;

  @override
  String toString() {
    return 'PaymentEvent.paymentTypeSelected(paymentType: $paymentType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentTypeSelected &&
            const DeepCollectionEquality()
                .equals(other.paymentType, paymentType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(paymentType));

  @JsonKey(ignore: true)
  @override
  $PaymentTypeSelectedCopyWith<PaymentTypeSelected> get copyWith =>
      _$PaymentTypeSelectedCopyWithImpl<PaymentTypeSelected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadInitiated,
    required TResult Function(PaymentType paymentType) paymentTypeSelected,
    required TResult Function(String countryCode) countrySelected,
    required TResult Function(Creditor creditor) creditorSelected,
    required TResult Function(String email) emailUpdated,
    required TResult Function(double amount) amountUpdated,
    required TResult Function(bool isAccepted) privacyAgreementUpdated,
    required TResult Function() initiateDonation,
    required TResult Function() successPresented,
  }) {
    return paymentTypeSelected(paymentType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadInitiated,
    TResult Function(PaymentType paymentType)? paymentTypeSelected,
    TResult Function(String countryCode)? countrySelected,
    TResult Function(Creditor creditor)? creditorSelected,
    TResult Function(String email)? emailUpdated,
    TResult Function(double amount)? amountUpdated,
    TResult Function(bool isAccepted)? privacyAgreementUpdated,
    TResult Function()? initiateDonation,
    TResult Function()? successPresented,
  }) {
    return paymentTypeSelected?.call(paymentType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadInitiated,
    TResult Function(PaymentType paymentType)? paymentTypeSelected,
    TResult Function(String countryCode)? countrySelected,
    TResult Function(Creditor creditor)? creditorSelected,
    TResult Function(String email)? emailUpdated,
    TResult Function(double amount)? amountUpdated,
    TResult Function(bool isAccepted)? privacyAgreementUpdated,
    TResult Function()? initiateDonation,
    TResult Function()? successPresented,
    required TResult orElse(),
  }) {
    if (paymentTypeSelected != null) {
      return paymentTypeSelected(paymentType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PaymentLoadInitiated value) loadInitiated,
    required TResult Function(PaymentTypeSelected value) paymentTypeSelected,
    required TResult Function(PaymentCountrySelected value) countrySelected,
    required TResult Function(PaymentCreditorSelected value) creditorSelected,
    required TResult Function(EmailUpdated value) emailUpdated,
    required TResult Function(AmountUpdated value) amountUpdated,
    required TResult Function(PrivacyAgreementUpdated value)
        privacyAgreementUpdated,
    required TResult Function(InitiateDonation value) initiateDonation,
    required TResult Function(SuccessPresented value) successPresented,
  }) {
    return paymentTypeSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PaymentLoadInitiated value)? loadInitiated,
    TResult Function(PaymentTypeSelected value)? paymentTypeSelected,
    TResult Function(PaymentCountrySelected value)? countrySelected,
    TResult Function(PaymentCreditorSelected value)? creditorSelected,
    TResult Function(EmailUpdated value)? emailUpdated,
    TResult Function(AmountUpdated value)? amountUpdated,
    TResult Function(PrivacyAgreementUpdated value)? privacyAgreementUpdated,
    TResult Function(InitiateDonation value)? initiateDonation,
    TResult Function(SuccessPresented value)? successPresented,
  }) {
    return paymentTypeSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PaymentLoadInitiated value)? loadInitiated,
    TResult Function(PaymentTypeSelected value)? paymentTypeSelected,
    TResult Function(PaymentCountrySelected value)? countrySelected,
    TResult Function(PaymentCreditorSelected value)? creditorSelected,
    TResult Function(EmailUpdated value)? emailUpdated,
    TResult Function(AmountUpdated value)? amountUpdated,
    TResult Function(PrivacyAgreementUpdated value)? privacyAgreementUpdated,
    TResult Function(InitiateDonation value)? initiateDonation,
    TResult Function(SuccessPresented value)? successPresented,
    required TResult orElse(),
  }) {
    if (paymentTypeSelected != null) {
      return paymentTypeSelected(this);
    }
    return orElse();
  }
}

abstract class PaymentTypeSelected implements PaymentEvent {
  const factory PaymentTypeSelected({required PaymentType paymentType}) =
      _$PaymentTypeSelected;

  PaymentType get paymentType;
  @JsonKey(ignore: true)
  $PaymentTypeSelectedCopyWith<PaymentTypeSelected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCountrySelectedCopyWith<$Res> {
  factory $PaymentCountrySelectedCopyWith(PaymentCountrySelected value,
          $Res Function(PaymentCountrySelected) then) =
      _$PaymentCountrySelectedCopyWithImpl<$Res>;
  $Res call({String countryCode});
}

/// @nodoc
class _$PaymentCountrySelectedCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res>
    implements $PaymentCountrySelectedCopyWith<$Res> {
  _$PaymentCountrySelectedCopyWithImpl(PaymentCountrySelected _value,
      $Res Function(PaymentCountrySelected) _then)
      : super(_value, (v) => _then(v as PaymentCountrySelected));

  @override
  PaymentCountrySelected get _value => super._value as PaymentCountrySelected;

  @override
  $Res call({
    Object? countryCode = freezed,
  }) {
    return _then(PaymentCountrySelected(
      countryCode: countryCode == freezed
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PaymentCountrySelected implements PaymentCountrySelected {
  const _$PaymentCountrySelected({required this.countryCode});

  @override
  final String countryCode;

  @override
  String toString() {
    return 'PaymentEvent.countrySelected(countryCode: $countryCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentCountrySelected &&
            const DeepCollectionEquality()
                .equals(other.countryCode, countryCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(countryCode));

  @JsonKey(ignore: true)
  @override
  $PaymentCountrySelectedCopyWith<PaymentCountrySelected> get copyWith =>
      _$PaymentCountrySelectedCopyWithImpl<PaymentCountrySelected>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadInitiated,
    required TResult Function(PaymentType paymentType) paymentTypeSelected,
    required TResult Function(String countryCode) countrySelected,
    required TResult Function(Creditor creditor) creditorSelected,
    required TResult Function(String email) emailUpdated,
    required TResult Function(double amount) amountUpdated,
    required TResult Function(bool isAccepted) privacyAgreementUpdated,
    required TResult Function() initiateDonation,
    required TResult Function() successPresented,
  }) {
    return countrySelected(countryCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadInitiated,
    TResult Function(PaymentType paymentType)? paymentTypeSelected,
    TResult Function(String countryCode)? countrySelected,
    TResult Function(Creditor creditor)? creditorSelected,
    TResult Function(String email)? emailUpdated,
    TResult Function(double amount)? amountUpdated,
    TResult Function(bool isAccepted)? privacyAgreementUpdated,
    TResult Function()? initiateDonation,
    TResult Function()? successPresented,
  }) {
    return countrySelected?.call(countryCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadInitiated,
    TResult Function(PaymentType paymentType)? paymentTypeSelected,
    TResult Function(String countryCode)? countrySelected,
    TResult Function(Creditor creditor)? creditorSelected,
    TResult Function(String email)? emailUpdated,
    TResult Function(double amount)? amountUpdated,
    TResult Function(bool isAccepted)? privacyAgreementUpdated,
    TResult Function()? initiateDonation,
    TResult Function()? successPresented,
    required TResult orElse(),
  }) {
    if (countrySelected != null) {
      return countrySelected(countryCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PaymentLoadInitiated value) loadInitiated,
    required TResult Function(PaymentTypeSelected value) paymentTypeSelected,
    required TResult Function(PaymentCountrySelected value) countrySelected,
    required TResult Function(PaymentCreditorSelected value) creditorSelected,
    required TResult Function(EmailUpdated value) emailUpdated,
    required TResult Function(AmountUpdated value) amountUpdated,
    required TResult Function(PrivacyAgreementUpdated value)
        privacyAgreementUpdated,
    required TResult Function(InitiateDonation value) initiateDonation,
    required TResult Function(SuccessPresented value) successPresented,
  }) {
    return countrySelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PaymentLoadInitiated value)? loadInitiated,
    TResult Function(PaymentTypeSelected value)? paymentTypeSelected,
    TResult Function(PaymentCountrySelected value)? countrySelected,
    TResult Function(PaymentCreditorSelected value)? creditorSelected,
    TResult Function(EmailUpdated value)? emailUpdated,
    TResult Function(AmountUpdated value)? amountUpdated,
    TResult Function(PrivacyAgreementUpdated value)? privacyAgreementUpdated,
    TResult Function(InitiateDonation value)? initiateDonation,
    TResult Function(SuccessPresented value)? successPresented,
  }) {
    return countrySelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PaymentLoadInitiated value)? loadInitiated,
    TResult Function(PaymentTypeSelected value)? paymentTypeSelected,
    TResult Function(PaymentCountrySelected value)? countrySelected,
    TResult Function(PaymentCreditorSelected value)? creditorSelected,
    TResult Function(EmailUpdated value)? emailUpdated,
    TResult Function(AmountUpdated value)? amountUpdated,
    TResult Function(PrivacyAgreementUpdated value)? privacyAgreementUpdated,
    TResult Function(InitiateDonation value)? initiateDonation,
    TResult Function(SuccessPresented value)? successPresented,
    required TResult orElse(),
  }) {
    if (countrySelected != null) {
      return countrySelected(this);
    }
    return orElse();
  }
}

abstract class PaymentCountrySelected implements PaymentEvent {
  const factory PaymentCountrySelected({required String countryCode}) =
      _$PaymentCountrySelected;

  String get countryCode;
  @JsonKey(ignore: true)
  $PaymentCountrySelectedCopyWith<PaymentCountrySelected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCreditorSelectedCopyWith<$Res> {
  factory $PaymentCreditorSelectedCopyWith(PaymentCreditorSelected value,
          $Res Function(PaymentCreditorSelected) then) =
      _$PaymentCreditorSelectedCopyWithImpl<$Res>;
  $Res call({Creditor creditor});

  $CreditorCopyWith<$Res> get creditor;
}

/// @nodoc
class _$PaymentCreditorSelectedCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res>
    implements $PaymentCreditorSelectedCopyWith<$Res> {
  _$PaymentCreditorSelectedCopyWithImpl(PaymentCreditorSelected _value,
      $Res Function(PaymentCreditorSelected) _then)
      : super(_value, (v) => _then(v as PaymentCreditorSelected));

  @override
  PaymentCreditorSelected get _value => super._value as PaymentCreditorSelected;

  @override
  $Res call({
    Object? creditor = freezed,
  }) {
    return _then(PaymentCreditorSelected(
      creditor: creditor == freezed
          ? _value.creditor
          : creditor // ignore: cast_nullable_to_non_nullable
              as Creditor,
    ));
  }

  @override
  $CreditorCopyWith<$Res> get creditor {
    return $CreditorCopyWith<$Res>(_value.creditor, (value) {
      return _then(_value.copyWith(creditor: value));
    });
  }
}

/// @nodoc

class _$PaymentCreditorSelected implements PaymentCreditorSelected {
  const _$PaymentCreditorSelected({required this.creditor});

  @override
  final Creditor creditor;

  @override
  String toString() {
    return 'PaymentEvent.creditorSelected(creditor: $creditor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentCreditorSelected &&
            const DeepCollectionEquality().equals(other.creditor, creditor));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(creditor));

  @JsonKey(ignore: true)
  @override
  $PaymentCreditorSelectedCopyWith<PaymentCreditorSelected> get copyWith =>
      _$PaymentCreditorSelectedCopyWithImpl<PaymentCreditorSelected>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadInitiated,
    required TResult Function(PaymentType paymentType) paymentTypeSelected,
    required TResult Function(String countryCode) countrySelected,
    required TResult Function(Creditor creditor) creditorSelected,
    required TResult Function(String email) emailUpdated,
    required TResult Function(double amount) amountUpdated,
    required TResult Function(bool isAccepted) privacyAgreementUpdated,
    required TResult Function() initiateDonation,
    required TResult Function() successPresented,
  }) {
    return creditorSelected(creditor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadInitiated,
    TResult Function(PaymentType paymentType)? paymentTypeSelected,
    TResult Function(String countryCode)? countrySelected,
    TResult Function(Creditor creditor)? creditorSelected,
    TResult Function(String email)? emailUpdated,
    TResult Function(double amount)? amountUpdated,
    TResult Function(bool isAccepted)? privacyAgreementUpdated,
    TResult Function()? initiateDonation,
    TResult Function()? successPresented,
  }) {
    return creditorSelected?.call(creditor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadInitiated,
    TResult Function(PaymentType paymentType)? paymentTypeSelected,
    TResult Function(String countryCode)? countrySelected,
    TResult Function(Creditor creditor)? creditorSelected,
    TResult Function(String email)? emailUpdated,
    TResult Function(double amount)? amountUpdated,
    TResult Function(bool isAccepted)? privacyAgreementUpdated,
    TResult Function()? initiateDonation,
    TResult Function()? successPresented,
    required TResult orElse(),
  }) {
    if (creditorSelected != null) {
      return creditorSelected(creditor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PaymentLoadInitiated value) loadInitiated,
    required TResult Function(PaymentTypeSelected value) paymentTypeSelected,
    required TResult Function(PaymentCountrySelected value) countrySelected,
    required TResult Function(PaymentCreditorSelected value) creditorSelected,
    required TResult Function(EmailUpdated value) emailUpdated,
    required TResult Function(AmountUpdated value) amountUpdated,
    required TResult Function(PrivacyAgreementUpdated value)
        privacyAgreementUpdated,
    required TResult Function(InitiateDonation value) initiateDonation,
    required TResult Function(SuccessPresented value) successPresented,
  }) {
    return creditorSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PaymentLoadInitiated value)? loadInitiated,
    TResult Function(PaymentTypeSelected value)? paymentTypeSelected,
    TResult Function(PaymentCountrySelected value)? countrySelected,
    TResult Function(PaymentCreditorSelected value)? creditorSelected,
    TResult Function(EmailUpdated value)? emailUpdated,
    TResult Function(AmountUpdated value)? amountUpdated,
    TResult Function(PrivacyAgreementUpdated value)? privacyAgreementUpdated,
    TResult Function(InitiateDonation value)? initiateDonation,
    TResult Function(SuccessPresented value)? successPresented,
  }) {
    return creditorSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PaymentLoadInitiated value)? loadInitiated,
    TResult Function(PaymentTypeSelected value)? paymentTypeSelected,
    TResult Function(PaymentCountrySelected value)? countrySelected,
    TResult Function(PaymentCreditorSelected value)? creditorSelected,
    TResult Function(EmailUpdated value)? emailUpdated,
    TResult Function(AmountUpdated value)? amountUpdated,
    TResult Function(PrivacyAgreementUpdated value)? privacyAgreementUpdated,
    TResult Function(InitiateDonation value)? initiateDonation,
    TResult Function(SuccessPresented value)? successPresented,
    required TResult orElse(),
  }) {
    if (creditorSelected != null) {
      return creditorSelected(this);
    }
    return orElse();
  }
}

abstract class PaymentCreditorSelected implements PaymentEvent {
  const factory PaymentCreditorSelected({required Creditor creditor}) =
      _$PaymentCreditorSelected;

  Creditor get creditor;
  @JsonKey(ignore: true)
  $PaymentCreditorSelectedCopyWith<PaymentCreditorSelected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailUpdatedCopyWith<$Res> {
  factory $EmailUpdatedCopyWith(
          EmailUpdated value, $Res Function(EmailUpdated) then) =
      _$EmailUpdatedCopyWithImpl<$Res>;
  $Res call({String email});
}

/// @nodoc
class _$EmailUpdatedCopyWithImpl<$Res> extends _$PaymentEventCopyWithImpl<$Res>
    implements $EmailUpdatedCopyWith<$Res> {
  _$EmailUpdatedCopyWithImpl(
      EmailUpdated _value, $Res Function(EmailUpdated) _then)
      : super(_value, (v) => _then(v as EmailUpdated));

  @override
  EmailUpdated get _value => super._value as EmailUpdated;

  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(EmailUpdated(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmailUpdated implements EmailUpdated {
  const _$EmailUpdated({required this.email});

  @override
  final String email;

  @override
  String toString() {
    return 'PaymentEvent.emailUpdated(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EmailUpdated &&
            const DeepCollectionEquality().equals(other.email, email));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(email));

  @JsonKey(ignore: true)
  @override
  $EmailUpdatedCopyWith<EmailUpdated> get copyWith =>
      _$EmailUpdatedCopyWithImpl<EmailUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadInitiated,
    required TResult Function(PaymentType paymentType) paymentTypeSelected,
    required TResult Function(String countryCode) countrySelected,
    required TResult Function(Creditor creditor) creditorSelected,
    required TResult Function(String email) emailUpdated,
    required TResult Function(double amount) amountUpdated,
    required TResult Function(bool isAccepted) privacyAgreementUpdated,
    required TResult Function() initiateDonation,
    required TResult Function() successPresented,
  }) {
    return emailUpdated(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadInitiated,
    TResult Function(PaymentType paymentType)? paymentTypeSelected,
    TResult Function(String countryCode)? countrySelected,
    TResult Function(Creditor creditor)? creditorSelected,
    TResult Function(String email)? emailUpdated,
    TResult Function(double amount)? amountUpdated,
    TResult Function(bool isAccepted)? privacyAgreementUpdated,
    TResult Function()? initiateDonation,
    TResult Function()? successPresented,
  }) {
    return emailUpdated?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadInitiated,
    TResult Function(PaymentType paymentType)? paymentTypeSelected,
    TResult Function(String countryCode)? countrySelected,
    TResult Function(Creditor creditor)? creditorSelected,
    TResult Function(String email)? emailUpdated,
    TResult Function(double amount)? amountUpdated,
    TResult Function(bool isAccepted)? privacyAgreementUpdated,
    TResult Function()? initiateDonation,
    TResult Function()? successPresented,
    required TResult orElse(),
  }) {
    if (emailUpdated != null) {
      return emailUpdated(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PaymentLoadInitiated value) loadInitiated,
    required TResult Function(PaymentTypeSelected value) paymentTypeSelected,
    required TResult Function(PaymentCountrySelected value) countrySelected,
    required TResult Function(PaymentCreditorSelected value) creditorSelected,
    required TResult Function(EmailUpdated value) emailUpdated,
    required TResult Function(AmountUpdated value) amountUpdated,
    required TResult Function(PrivacyAgreementUpdated value)
        privacyAgreementUpdated,
    required TResult Function(InitiateDonation value) initiateDonation,
    required TResult Function(SuccessPresented value) successPresented,
  }) {
    return emailUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PaymentLoadInitiated value)? loadInitiated,
    TResult Function(PaymentTypeSelected value)? paymentTypeSelected,
    TResult Function(PaymentCountrySelected value)? countrySelected,
    TResult Function(PaymentCreditorSelected value)? creditorSelected,
    TResult Function(EmailUpdated value)? emailUpdated,
    TResult Function(AmountUpdated value)? amountUpdated,
    TResult Function(PrivacyAgreementUpdated value)? privacyAgreementUpdated,
    TResult Function(InitiateDonation value)? initiateDonation,
    TResult Function(SuccessPresented value)? successPresented,
  }) {
    return emailUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PaymentLoadInitiated value)? loadInitiated,
    TResult Function(PaymentTypeSelected value)? paymentTypeSelected,
    TResult Function(PaymentCountrySelected value)? countrySelected,
    TResult Function(PaymentCreditorSelected value)? creditorSelected,
    TResult Function(EmailUpdated value)? emailUpdated,
    TResult Function(AmountUpdated value)? amountUpdated,
    TResult Function(PrivacyAgreementUpdated value)? privacyAgreementUpdated,
    TResult Function(InitiateDonation value)? initiateDonation,
    TResult Function(SuccessPresented value)? successPresented,
    required TResult orElse(),
  }) {
    if (emailUpdated != null) {
      return emailUpdated(this);
    }
    return orElse();
  }
}

abstract class EmailUpdated implements PaymentEvent {
  const factory EmailUpdated({required String email}) = _$EmailUpdated;

  String get email;
  @JsonKey(ignore: true)
  $EmailUpdatedCopyWith<EmailUpdated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AmountUpdatedCopyWith<$Res> {
  factory $AmountUpdatedCopyWith(
          AmountUpdated value, $Res Function(AmountUpdated) then) =
      _$AmountUpdatedCopyWithImpl<$Res>;
  $Res call({double amount});
}

/// @nodoc
class _$AmountUpdatedCopyWithImpl<$Res> extends _$PaymentEventCopyWithImpl<$Res>
    implements $AmountUpdatedCopyWith<$Res> {
  _$AmountUpdatedCopyWithImpl(
      AmountUpdated _value, $Res Function(AmountUpdated) _then)
      : super(_value, (v) => _then(v as AmountUpdated));

  @override
  AmountUpdated get _value => super._value as AmountUpdated;

  @override
  $Res call({
    Object? amount = freezed,
  }) {
    return _then(AmountUpdated(
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$AmountUpdated implements AmountUpdated {
  const _$AmountUpdated({required this.amount});

  @override
  final double amount;

  @override
  String toString() {
    return 'PaymentEvent.amountUpdated(amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AmountUpdated &&
            const DeepCollectionEquality().equals(other.amount, amount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(amount));

  @JsonKey(ignore: true)
  @override
  $AmountUpdatedCopyWith<AmountUpdated> get copyWith =>
      _$AmountUpdatedCopyWithImpl<AmountUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadInitiated,
    required TResult Function(PaymentType paymentType) paymentTypeSelected,
    required TResult Function(String countryCode) countrySelected,
    required TResult Function(Creditor creditor) creditorSelected,
    required TResult Function(String email) emailUpdated,
    required TResult Function(double amount) amountUpdated,
    required TResult Function(bool isAccepted) privacyAgreementUpdated,
    required TResult Function() initiateDonation,
    required TResult Function() successPresented,
  }) {
    return amountUpdated(amount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadInitiated,
    TResult Function(PaymentType paymentType)? paymentTypeSelected,
    TResult Function(String countryCode)? countrySelected,
    TResult Function(Creditor creditor)? creditorSelected,
    TResult Function(String email)? emailUpdated,
    TResult Function(double amount)? amountUpdated,
    TResult Function(bool isAccepted)? privacyAgreementUpdated,
    TResult Function()? initiateDonation,
    TResult Function()? successPresented,
  }) {
    return amountUpdated?.call(amount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadInitiated,
    TResult Function(PaymentType paymentType)? paymentTypeSelected,
    TResult Function(String countryCode)? countrySelected,
    TResult Function(Creditor creditor)? creditorSelected,
    TResult Function(String email)? emailUpdated,
    TResult Function(double amount)? amountUpdated,
    TResult Function(bool isAccepted)? privacyAgreementUpdated,
    TResult Function()? initiateDonation,
    TResult Function()? successPresented,
    required TResult orElse(),
  }) {
    if (amountUpdated != null) {
      return amountUpdated(amount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PaymentLoadInitiated value) loadInitiated,
    required TResult Function(PaymentTypeSelected value) paymentTypeSelected,
    required TResult Function(PaymentCountrySelected value) countrySelected,
    required TResult Function(PaymentCreditorSelected value) creditorSelected,
    required TResult Function(EmailUpdated value) emailUpdated,
    required TResult Function(AmountUpdated value) amountUpdated,
    required TResult Function(PrivacyAgreementUpdated value)
        privacyAgreementUpdated,
    required TResult Function(InitiateDonation value) initiateDonation,
    required TResult Function(SuccessPresented value) successPresented,
  }) {
    return amountUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PaymentLoadInitiated value)? loadInitiated,
    TResult Function(PaymentTypeSelected value)? paymentTypeSelected,
    TResult Function(PaymentCountrySelected value)? countrySelected,
    TResult Function(PaymentCreditorSelected value)? creditorSelected,
    TResult Function(EmailUpdated value)? emailUpdated,
    TResult Function(AmountUpdated value)? amountUpdated,
    TResult Function(PrivacyAgreementUpdated value)? privacyAgreementUpdated,
    TResult Function(InitiateDonation value)? initiateDonation,
    TResult Function(SuccessPresented value)? successPresented,
  }) {
    return amountUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PaymentLoadInitiated value)? loadInitiated,
    TResult Function(PaymentTypeSelected value)? paymentTypeSelected,
    TResult Function(PaymentCountrySelected value)? countrySelected,
    TResult Function(PaymentCreditorSelected value)? creditorSelected,
    TResult Function(EmailUpdated value)? emailUpdated,
    TResult Function(AmountUpdated value)? amountUpdated,
    TResult Function(PrivacyAgreementUpdated value)? privacyAgreementUpdated,
    TResult Function(InitiateDonation value)? initiateDonation,
    TResult Function(SuccessPresented value)? successPresented,
    required TResult orElse(),
  }) {
    if (amountUpdated != null) {
      return amountUpdated(this);
    }
    return orElse();
  }
}

abstract class AmountUpdated implements PaymentEvent {
  const factory AmountUpdated({required double amount}) = _$AmountUpdated;

  double get amount;
  @JsonKey(ignore: true)
  $AmountUpdatedCopyWith<AmountUpdated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivacyAgreementUpdatedCopyWith<$Res> {
  factory $PrivacyAgreementUpdatedCopyWith(PrivacyAgreementUpdated value,
          $Res Function(PrivacyAgreementUpdated) then) =
      _$PrivacyAgreementUpdatedCopyWithImpl<$Res>;
  $Res call({bool isAccepted});
}

/// @nodoc
class _$PrivacyAgreementUpdatedCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res>
    implements $PrivacyAgreementUpdatedCopyWith<$Res> {
  _$PrivacyAgreementUpdatedCopyWithImpl(PrivacyAgreementUpdated _value,
      $Res Function(PrivacyAgreementUpdated) _then)
      : super(_value, (v) => _then(v as PrivacyAgreementUpdated));

  @override
  PrivacyAgreementUpdated get _value => super._value as PrivacyAgreementUpdated;

  @override
  $Res call({
    Object? isAccepted = freezed,
  }) {
    return _then(PrivacyAgreementUpdated(
      isAccepted: isAccepted == freezed
          ? _value.isAccepted
          : isAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PrivacyAgreementUpdated implements PrivacyAgreementUpdated {
  const _$PrivacyAgreementUpdated({required this.isAccepted});

  @override
  final bool isAccepted;

  @override
  String toString() {
    return 'PaymentEvent.privacyAgreementUpdated(isAccepted: $isAccepted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PrivacyAgreementUpdated &&
            const DeepCollectionEquality()
                .equals(other.isAccepted, isAccepted));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(isAccepted));

  @JsonKey(ignore: true)
  @override
  $PrivacyAgreementUpdatedCopyWith<PrivacyAgreementUpdated> get copyWith =>
      _$PrivacyAgreementUpdatedCopyWithImpl<PrivacyAgreementUpdated>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadInitiated,
    required TResult Function(PaymentType paymentType) paymentTypeSelected,
    required TResult Function(String countryCode) countrySelected,
    required TResult Function(Creditor creditor) creditorSelected,
    required TResult Function(String email) emailUpdated,
    required TResult Function(double amount) amountUpdated,
    required TResult Function(bool isAccepted) privacyAgreementUpdated,
    required TResult Function() initiateDonation,
    required TResult Function() successPresented,
  }) {
    return privacyAgreementUpdated(isAccepted);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadInitiated,
    TResult Function(PaymentType paymentType)? paymentTypeSelected,
    TResult Function(String countryCode)? countrySelected,
    TResult Function(Creditor creditor)? creditorSelected,
    TResult Function(String email)? emailUpdated,
    TResult Function(double amount)? amountUpdated,
    TResult Function(bool isAccepted)? privacyAgreementUpdated,
    TResult Function()? initiateDonation,
    TResult Function()? successPresented,
  }) {
    return privacyAgreementUpdated?.call(isAccepted);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadInitiated,
    TResult Function(PaymentType paymentType)? paymentTypeSelected,
    TResult Function(String countryCode)? countrySelected,
    TResult Function(Creditor creditor)? creditorSelected,
    TResult Function(String email)? emailUpdated,
    TResult Function(double amount)? amountUpdated,
    TResult Function(bool isAccepted)? privacyAgreementUpdated,
    TResult Function()? initiateDonation,
    TResult Function()? successPresented,
    required TResult orElse(),
  }) {
    if (privacyAgreementUpdated != null) {
      return privacyAgreementUpdated(isAccepted);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PaymentLoadInitiated value) loadInitiated,
    required TResult Function(PaymentTypeSelected value) paymentTypeSelected,
    required TResult Function(PaymentCountrySelected value) countrySelected,
    required TResult Function(PaymentCreditorSelected value) creditorSelected,
    required TResult Function(EmailUpdated value) emailUpdated,
    required TResult Function(AmountUpdated value) amountUpdated,
    required TResult Function(PrivacyAgreementUpdated value)
        privacyAgreementUpdated,
    required TResult Function(InitiateDonation value) initiateDonation,
    required TResult Function(SuccessPresented value) successPresented,
  }) {
    return privacyAgreementUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PaymentLoadInitiated value)? loadInitiated,
    TResult Function(PaymentTypeSelected value)? paymentTypeSelected,
    TResult Function(PaymentCountrySelected value)? countrySelected,
    TResult Function(PaymentCreditorSelected value)? creditorSelected,
    TResult Function(EmailUpdated value)? emailUpdated,
    TResult Function(AmountUpdated value)? amountUpdated,
    TResult Function(PrivacyAgreementUpdated value)? privacyAgreementUpdated,
    TResult Function(InitiateDonation value)? initiateDonation,
    TResult Function(SuccessPresented value)? successPresented,
  }) {
    return privacyAgreementUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PaymentLoadInitiated value)? loadInitiated,
    TResult Function(PaymentTypeSelected value)? paymentTypeSelected,
    TResult Function(PaymentCountrySelected value)? countrySelected,
    TResult Function(PaymentCreditorSelected value)? creditorSelected,
    TResult Function(EmailUpdated value)? emailUpdated,
    TResult Function(AmountUpdated value)? amountUpdated,
    TResult Function(PrivacyAgreementUpdated value)? privacyAgreementUpdated,
    TResult Function(InitiateDonation value)? initiateDonation,
    TResult Function(SuccessPresented value)? successPresented,
    required TResult orElse(),
  }) {
    if (privacyAgreementUpdated != null) {
      return privacyAgreementUpdated(this);
    }
    return orElse();
  }
}

abstract class PrivacyAgreementUpdated implements PaymentEvent {
  const factory PrivacyAgreementUpdated({required bool isAccepted}) =
      _$PrivacyAgreementUpdated;

  bool get isAccepted;
  @JsonKey(ignore: true)
  $PrivacyAgreementUpdatedCopyWith<PrivacyAgreementUpdated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitiateDonationCopyWith<$Res> {
  factory $InitiateDonationCopyWith(
          InitiateDonation value, $Res Function(InitiateDonation) then) =
      _$InitiateDonationCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitiateDonationCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res>
    implements $InitiateDonationCopyWith<$Res> {
  _$InitiateDonationCopyWithImpl(
      InitiateDonation _value, $Res Function(InitiateDonation) _then)
      : super(_value, (v) => _then(v as InitiateDonation));

  @override
  InitiateDonation get _value => super._value as InitiateDonation;
}

/// @nodoc

class _$InitiateDonation implements InitiateDonation {
  const _$InitiateDonation();

  @override
  String toString() {
    return 'PaymentEvent.initiateDonation()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InitiateDonation);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadInitiated,
    required TResult Function(PaymentType paymentType) paymentTypeSelected,
    required TResult Function(String countryCode) countrySelected,
    required TResult Function(Creditor creditor) creditorSelected,
    required TResult Function(String email) emailUpdated,
    required TResult Function(double amount) amountUpdated,
    required TResult Function(bool isAccepted) privacyAgreementUpdated,
    required TResult Function() initiateDonation,
    required TResult Function() successPresented,
  }) {
    return initiateDonation();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadInitiated,
    TResult Function(PaymentType paymentType)? paymentTypeSelected,
    TResult Function(String countryCode)? countrySelected,
    TResult Function(Creditor creditor)? creditorSelected,
    TResult Function(String email)? emailUpdated,
    TResult Function(double amount)? amountUpdated,
    TResult Function(bool isAccepted)? privacyAgreementUpdated,
    TResult Function()? initiateDonation,
    TResult Function()? successPresented,
  }) {
    return initiateDonation?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadInitiated,
    TResult Function(PaymentType paymentType)? paymentTypeSelected,
    TResult Function(String countryCode)? countrySelected,
    TResult Function(Creditor creditor)? creditorSelected,
    TResult Function(String email)? emailUpdated,
    TResult Function(double amount)? amountUpdated,
    TResult Function(bool isAccepted)? privacyAgreementUpdated,
    TResult Function()? initiateDonation,
    TResult Function()? successPresented,
    required TResult orElse(),
  }) {
    if (initiateDonation != null) {
      return initiateDonation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PaymentLoadInitiated value) loadInitiated,
    required TResult Function(PaymentTypeSelected value) paymentTypeSelected,
    required TResult Function(PaymentCountrySelected value) countrySelected,
    required TResult Function(PaymentCreditorSelected value) creditorSelected,
    required TResult Function(EmailUpdated value) emailUpdated,
    required TResult Function(AmountUpdated value) amountUpdated,
    required TResult Function(PrivacyAgreementUpdated value)
        privacyAgreementUpdated,
    required TResult Function(InitiateDonation value) initiateDonation,
    required TResult Function(SuccessPresented value) successPresented,
  }) {
    return initiateDonation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PaymentLoadInitiated value)? loadInitiated,
    TResult Function(PaymentTypeSelected value)? paymentTypeSelected,
    TResult Function(PaymentCountrySelected value)? countrySelected,
    TResult Function(PaymentCreditorSelected value)? creditorSelected,
    TResult Function(EmailUpdated value)? emailUpdated,
    TResult Function(AmountUpdated value)? amountUpdated,
    TResult Function(PrivacyAgreementUpdated value)? privacyAgreementUpdated,
    TResult Function(InitiateDonation value)? initiateDonation,
    TResult Function(SuccessPresented value)? successPresented,
  }) {
    return initiateDonation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PaymentLoadInitiated value)? loadInitiated,
    TResult Function(PaymentTypeSelected value)? paymentTypeSelected,
    TResult Function(PaymentCountrySelected value)? countrySelected,
    TResult Function(PaymentCreditorSelected value)? creditorSelected,
    TResult Function(EmailUpdated value)? emailUpdated,
    TResult Function(AmountUpdated value)? amountUpdated,
    TResult Function(PrivacyAgreementUpdated value)? privacyAgreementUpdated,
    TResult Function(InitiateDonation value)? initiateDonation,
    TResult Function(SuccessPresented value)? successPresented,
    required TResult orElse(),
  }) {
    if (initiateDonation != null) {
      return initiateDonation(this);
    }
    return orElse();
  }
}

abstract class InitiateDonation implements PaymentEvent {
  const factory InitiateDonation() = _$InitiateDonation;
}

/// @nodoc
abstract class $SuccessPresentedCopyWith<$Res> {
  factory $SuccessPresentedCopyWith(
          SuccessPresented value, $Res Function(SuccessPresented) then) =
      _$SuccessPresentedCopyWithImpl<$Res>;
}

/// @nodoc
class _$SuccessPresentedCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res>
    implements $SuccessPresentedCopyWith<$Res> {
  _$SuccessPresentedCopyWithImpl(
      SuccessPresented _value, $Res Function(SuccessPresented) _then)
      : super(_value, (v) => _then(v as SuccessPresented));

  @override
  SuccessPresented get _value => super._value as SuccessPresented;
}

/// @nodoc

class _$SuccessPresented implements SuccessPresented {
  const _$SuccessPresented();

  @override
  String toString() {
    return 'PaymentEvent.successPresented()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SuccessPresented);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadInitiated,
    required TResult Function(PaymentType paymentType) paymentTypeSelected,
    required TResult Function(String countryCode) countrySelected,
    required TResult Function(Creditor creditor) creditorSelected,
    required TResult Function(String email) emailUpdated,
    required TResult Function(double amount) amountUpdated,
    required TResult Function(bool isAccepted) privacyAgreementUpdated,
    required TResult Function() initiateDonation,
    required TResult Function() successPresented,
  }) {
    return successPresented();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadInitiated,
    TResult Function(PaymentType paymentType)? paymentTypeSelected,
    TResult Function(String countryCode)? countrySelected,
    TResult Function(Creditor creditor)? creditorSelected,
    TResult Function(String email)? emailUpdated,
    TResult Function(double amount)? amountUpdated,
    TResult Function(bool isAccepted)? privacyAgreementUpdated,
    TResult Function()? initiateDonation,
    TResult Function()? successPresented,
  }) {
    return successPresented?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadInitiated,
    TResult Function(PaymentType paymentType)? paymentTypeSelected,
    TResult Function(String countryCode)? countrySelected,
    TResult Function(Creditor creditor)? creditorSelected,
    TResult Function(String email)? emailUpdated,
    TResult Function(double amount)? amountUpdated,
    TResult Function(bool isAccepted)? privacyAgreementUpdated,
    TResult Function()? initiateDonation,
    TResult Function()? successPresented,
    required TResult orElse(),
  }) {
    if (successPresented != null) {
      return successPresented();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PaymentLoadInitiated value) loadInitiated,
    required TResult Function(PaymentTypeSelected value) paymentTypeSelected,
    required TResult Function(PaymentCountrySelected value) countrySelected,
    required TResult Function(PaymentCreditorSelected value) creditorSelected,
    required TResult Function(EmailUpdated value) emailUpdated,
    required TResult Function(AmountUpdated value) amountUpdated,
    required TResult Function(PrivacyAgreementUpdated value)
        privacyAgreementUpdated,
    required TResult Function(InitiateDonation value) initiateDonation,
    required TResult Function(SuccessPresented value) successPresented,
  }) {
    return successPresented(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PaymentLoadInitiated value)? loadInitiated,
    TResult Function(PaymentTypeSelected value)? paymentTypeSelected,
    TResult Function(PaymentCountrySelected value)? countrySelected,
    TResult Function(PaymentCreditorSelected value)? creditorSelected,
    TResult Function(EmailUpdated value)? emailUpdated,
    TResult Function(AmountUpdated value)? amountUpdated,
    TResult Function(PrivacyAgreementUpdated value)? privacyAgreementUpdated,
    TResult Function(InitiateDonation value)? initiateDonation,
    TResult Function(SuccessPresented value)? successPresented,
  }) {
    return successPresented?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PaymentLoadInitiated value)? loadInitiated,
    TResult Function(PaymentTypeSelected value)? paymentTypeSelected,
    TResult Function(PaymentCountrySelected value)? countrySelected,
    TResult Function(PaymentCreditorSelected value)? creditorSelected,
    TResult Function(EmailUpdated value)? emailUpdated,
    TResult Function(AmountUpdated value)? amountUpdated,
    TResult Function(PrivacyAgreementUpdated value)? privacyAgreementUpdated,
    TResult Function(InitiateDonation value)? initiateDonation,
    TResult Function(SuccessPresented value)? successPresented,
    required TResult orElse(),
  }) {
    if (successPresented != null) {
      return successPresented(this);
    }
    return orElse();
  }
}

abstract class SuccessPresented implements PaymentEvent {
  const factory SuccessPresented() = _$SuccessPresented;
}

/// @nodoc
class _$PaymentStateTearOff {
  const _$PaymentStateTearOff();

  _PaymentState call(
      {required TextEditingController emailController,
      required TextEditingController amountController,
      required FocusNode emailFocusNode,
      required FocusNode amountFocusNode,
      PaymentType selectedPaymentType = PaymentType.bank,
      List<String> countryList = const [],
      String? selectedCountryCode,
      List<Creditor> creditors = const [],
      Creditor? selectedCreditor,
      String email = "",
      double amount = 0.0,
      bool isPrivacyPolicyAccepted = false,
      bool isCountryRequestInProgress = false,
      bool isCharityRequestInProgress = false,
      bool isPaymentRequestInProgress = false,
      bool showError = false,
      bool sdkSuccess = false,
      String? errorMessage}) {
    return _PaymentState(
      emailController: emailController,
      amountController: amountController,
      emailFocusNode: emailFocusNode,
      amountFocusNode: amountFocusNode,
      selectedPaymentType: selectedPaymentType,
      countryList: countryList,
      selectedCountryCode: selectedCountryCode,
      creditors: creditors,
      selectedCreditor: selectedCreditor,
      email: email,
      amount: amount,
      isPrivacyPolicyAccepted: isPrivacyPolicyAccepted,
      isCountryRequestInProgress: isCountryRequestInProgress,
      isCharityRequestInProgress: isCharityRequestInProgress,
      isPaymentRequestInProgress: isPaymentRequestInProgress,
      showError: showError,
      sdkSuccess: sdkSuccess,
      errorMessage: errorMessage,
    );
  }
}

/// @nodoc
const $PaymentState = _$PaymentStateTearOff();

/// @nodoc
mixin _$PaymentState {
  TextEditingController get emailController =>
      throw _privateConstructorUsedError;
  TextEditingController get amountController =>
      throw _privateConstructorUsedError;
  FocusNode get emailFocusNode => throw _privateConstructorUsedError;
  FocusNode get amountFocusNode => throw _privateConstructorUsedError;
  PaymentType get selectedPaymentType => throw _privateConstructorUsedError;
  List<String> get countryList => throw _privateConstructorUsedError;
  String? get selectedCountryCode => throw _privateConstructorUsedError;
  List<Creditor> get creditors => throw _privateConstructorUsedError;
  Creditor? get selectedCreditor => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  bool get isPrivacyPolicyAccepted => throw _privateConstructorUsedError;
  bool get isCountryRequestInProgress => throw _privateConstructorUsedError;
  bool get isCharityRequestInProgress => throw _privateConstructorUsedError;
  bool get isPaymentRequestInProgress => throw _privateConstructorUsedError;
  bool get showError => throw _privateConstructorUsedError;
  bool get sdkSuccess => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentStateCopyWith<PaymentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentStateCopyWith<$Res> {
  factory $PaymentStateCopyWith(
          PaymentState value, $Res Function(PaymentState) then) =
      _$PaymentStateCopyWithImpl<$Res>;
  $Res call(
      {TextEditingController emailController,
      TextEditingController amountController,
      FocusNode emailFocusNode,
      FocusNode amountFocusNode,
      PaymentType selectedPaymentType,
      List<String> countryList,
      String? selectedCountryCode,
      List<Creditor> creditors,
      Creditor? selectedCreditor,
      String email,
      double amount,
      bool isPrivacyPolicyAccepted,
      bool isCountryRequestInProgress,
      bool isCharityRequestInProgress,
      bool isPaymentRequestInProgress,
      bool showError,
      bool sdkSuccess,
      String? errorMessage});

  $CreditorCopyWith<$Res>? get selectedCreditor;
}

/// @nodoc
class _$PaymentStateCopyWithImpl<$Res> implements $PaymentStateCopyWith<$Res> {
  _$PaymentStateCopyWithImpl(this._value, this._then);

  final PaymentState _value;
  // ignore: unused_field
  final $Res Function(PaymentState) _then;

  @override
  $Res call({
    Object? emailController = freezed,
    Object? amountController = freezed,
    Object? emailFocusNode = freezed,
    Object? amountFocusNode = freezed,
    Object? selectedPaymentType = freezed,
    Object? countryList = freezed,
    Object? selectedCountryCode = freezed,
    Object? creditors = freezed,
    Object? selectedCreditor = freezed,
    Object? email = freezed,
    Object? amount = freezed,
    Object? isPrivacyPolicyAccepted = freezed,
    Object? isCountryRequestInProgress = freezed,
    Object? isCharityRequestInProgress = freezed,
    Object? isPaymentRequestInProgress = freezed,
    Object? showError = freezed,
    Object? sdkSuccess = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      emailController: emailController == freezed
          ? _value.emailController
          : emailController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      amountController: amountController == freezed
          ? _value.amountController
          : amountController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      emailFocusNode: emailFocusNode == freezed
          ? _value.emailFocusNode
          : emailFocusNode // ignore: cast_nullable_to_non_nullable
              as FocusNode,
      amountFocusNode: amountFocusNode == freezed
          ? _value.amountFocusNode
          : amountFocusNode // ignore: cast_nullable_to_non_nullable
              as FocusNode,
      selectedPaymentType: selectedPaymentType == freezed
          ? _value.selectedPaymentType
          : selectedPaymentType // ignore: cast_nullable_to_non_nullable
              as PaymentType,
      countryList: countryList == freezed
          ? _value.countryList
          : countryList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedCountryCode: selectedCountryCode == freezed
          ? _value.selectedCountryCode
          : selectedCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      creditors: creditors == freezed
          ? _value.creditors
          : creditors // ignore: cast_nullable_to_non_nullable
              as List<Creditor>,
      selectedCreditor: selectedCreditor == freezed
          ? _value.selectedCreditor
          : selectedCreditor // ignore: cast_nullable_to_non_nullable
              as Creditor?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      isPrivacyPolicyAccepted: isPrivacyPolicyAccepted == freezed
          ? _value.isPrivacyPolicyAccepted
          : isPrivacyPolicyAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      isCountryRequestInProgress: isCountryRequestInProgress == freezed
          ? _value.isCountryRequestInProgress
          : isCountryRequestInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      isCharityRequestInProgress: isCharityRequestInProgress == freezed
          ? _value.isCharityRequestInProgress
          : isCharityRequestInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaymentRequestInProgress: isPaymentRequestInProgress == freezed
          ? _value.isPaymentRequestInProgress
          : isPaymentRequestInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      showError: showError == freezed
          ? _value.showError
          : showError // ignore: cast_nullable_to_non_nullable
              as bool,
      sdkSuccess: sdkSuccess == freezed
          ? _value.sdkSuccess
          : sdkSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $CreditorCopyWith<$Res>? get selectedCreditor {
    if (_value.selectedCreditor == null) {
      return null;
    }

    return $CreditorCopyWith<$Res>(_value.selectedCreditor!, (value) {
      return _then(_value.copyWith(selectedCreditor: value));
    });
  }
}

/// @nodoc
abstract class _$PaymentStateCopyWith<$Res>
    implements $PaymentStateCopyWith<$Res> {
  factory _$PaymentStateCopyWith(
          _PaymentState value, $Res Function(_PaymentState) then) =
      __$PaymentStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {TextEditingController emailController,
      TextEditingController amountController,
      FocusNode emailFocusNode,
      FocusNode amountFocusNode,
      PaymentType selectedPaymentType,
      List<String> countryList,
      String? selectedCountryCode,
      List<Creditor> creditors,
      Creditor? selectedCreditor,
      String email,
      double amount,
      bool isPrivacyPolicyAccepted,
      bool isCountryRequestInProgress,
      bool isCharityRequestInProgress,
      bool isPaymentRequestInProgress,
      bool showError,
      bool sdkSuccess,
      String? errorMessage});

  @override
  $CreditorCopyWith<$Res>? get selectedCreditor;
}

/// @nodoc
class __$PaymentStateCopyWithImpl<$Res> extends _$PaymentStateCopyWithImpl<$Res>
    implements _$PaymentStateCopyWith<$Res> {
  __$PaymentStateCopyWithImpl(
      _PaymentState _value, $Res Function(_PaymentState) _then)
      : super(_value, (v) => _then(v as _PaymentState));

  @override
  _PaymentState get _value => super._value as _PaymentState;

  @override
  $Res call({
    Object? emailController = freezed,
    Object? amountController = freezed,
    Object? emailFocusNode = freezed,
    Object? amountFocusNode = freezed,
    Object? selectedPaymentType = freezed,
    Object? countryList = freezed,
    Object? selectedCountryCode = freezed,
    Object? creditors = freezed,
    Object? selectedCreditor = freezed,
    Object? email = freezed,
    Object? amount = freezed,
    Object? isPrivacyPolicyAccepted = freezed,
    Object? isCountryRequestInProgress = freezed,
    Object? isCharityRequestInProgress = freezed,
    Object? isPaymentRequestInProgress = freezed,
    Object? showError = freezed,
    Object? sdkSuccess = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_PaymentState(
      emailController: emailController == freezed
          ? _value.emailController
          : emailController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      amountController: amountController == freezed
          ? _value.amountController
          : amountController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      emailFocusNode: emailFocusNode == freezed
          ? _value.emailFocusNode
          : emailFocusNode // ignore: cast_nullable_to_non_nullable
              as FocusNode,
      amountFocusNode: amountFocusNode == freezed
          ? _value.amountFocusNode
          : amountFocusNode // ignore: cast_nullable_to_non_nullable
              as FocusNode,
      selectedPaymentType: selectedPaymentType == freezed
          ? _value.selectedPaymentType
          : selectedPaymentType // ignore: cast_nullable_to_non_nullable
              as PaymentType,
      countryList: countryList == freezed
          ? _value.countryList
          : countryList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedCountryCode: selectedCountryCode == freezed
          ? _value.selectedCountryCode
          : selectedCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      creditors: creditors == freezed
          ? _value.creditors
          : creditors // ignore: cast_nullable_to_non_nullable
              as List<Creditor>,
      selectedCreditor: selectedCreditor == freezed
          ? _value.selectedCreditor
          : selectedCreditor // ignore: cast_nullable_to_non_nullable
              as Creditor?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      isPrivacyPolicyAccepted: isPrivacyPolicyAccepted == freezed
          ? _value.isPrivacyPolicyAccepted
          : isPrivacyPolicyAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      isCountryRequestInProgress: isCountryRequestInProgress == freezed
          ? _value.isCountryRequestInProgress
          : isCountryRequestInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      isCharityRequestInProgress: isCharityRequestInProgress == freezed
          ? _value.isCharityRequestInProgress
          : isCharityRequestInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaymentRequestInProgress: isPaymentRequestInProgress == freezed
          ? _value.isPaymentRequestInProgress
          : isPaymentRequestInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      showError: showError == freezed
          ? _value.showError
          : showError // ignore: cast_nullable_to_non_nullable
              as bool,
      sdkSuccess: sdkSuccess == freezed
          ? _value.sdkSuccess
          : sdkSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_PaymentState implements _PaymentState {
  const _$_PaymentState(
      {required this.emailController,
      required this.amountController,
      required this.emailFocusNode,
      required this.amountFocusNode,
      this.selectedPaymentType = PaymentType.bank,
      this.countryList = const [],
      this.selectedCountryCode,
      this.creditors = const [],
      this.selectedCreditor,
      this.email = "",
      this.amount = 0.0,
      this.isPrivacyPolicyAccepted = false,
      this.isCountryRequestInProgress = false,
      this.isCharityRequestInProgress = false,
      this.isPaymentRequestInProgress = false,
      this.showError = false,
      this.sdkSuccess = false,
      this.errorMessage});

  @override
  final TextEditingController emailController;
  @override
  final TextEditingController amountController;
  @override
  final FocusNode emailFocusNode;
  @override
  final FocusNode amountFocusNode;
  @JsonKey()
  @override
  final PaymentType selectedPaymentType;
  @JsonKey()
  @override
  final List<String> countryList;
  @override
  final String? selectedCountryCode;
  @JsonKey()
  @override
  final List<Creditor> creditors;
  @override
  final Creditor? selectedCreditor;
  @JsonKey()
  @override
  final String email;
  @JsonKey()
  @override
  final double amount;
  @JsonKey()
  @override
  final bool isPrivacyPolicyAccepted;
  @JsonKey()
  @override
  final bool isCountryRequestInProgress;
  @JsonKey()
  @override
  final bool isCharityRequestInProgress;
  @JsonKey()
  @override
  final bool isPaymentRequestInProgress;
  @JsonKey()
  @override
  final bool showError;
  @JsonKey()
  @override
  final bool sdkSuccess;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'PaymentState(emailController: $emailController, amountController: $amountController, emailFocusNode: $emailFocusNode, amountFocusNode: $amountFocusNode, selectedPaymentType: $selectedPaymentType, countryList: $countryList, selectedCountryCode: $selectedCountryCode, creditors: $creditors, selectedCreditor: $selectedCreditor, email: $email, amount: $amount, isPrivacyPolicyAccepted: $isPrivacyPolicyAccepted, isCountryRequestInProgress: $isCountryRequestInProgress, isCharityRequestInProgress: $isCharityRequestInProgress, isPaymentRequestInProgress: $isPaymentRequestInProgress, showError: $showError, sdkSuccess: $sdkSuccess, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaymentState &&
            const DeepCollectionEquality()
                .equals(other.emailController, emailController) &&
            const DeepCollectionEquality()
                .equals(other.amountController, amountController) &&
            const DeepCollectionEquality()
                .equals(other.emailFocusNode, emailFocusNode) &&
            const DeepCollectionEquality()
                .equals(other.amountFocusNode, amountFocusNode) &&
            const DeepCollectionEquality()
                .equals(other.selectedPaymentType, selectedPaymentType) &&
            const DeepCollectionEquality()
                .equals(other.countryList, countryList) &&
            const DeepCollectionEquality()
                .equals(other.selectedCountryCode, selectedCountryCode) &&
            const DeepCollectionEquality().equals(other.creditors, creditors) &&
            const DeepCollectionEquality()
                .equals(other.selectedCreditor, selectedCreditor) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(
                other.isPrivacyPolicyAccepted, isPrivacyPolicyAccepted) &&
            const DeepCollectionEquality().equals(
                other.isCountryRequestInProgress, isCountryRequestInProgress) &&
            const DeepCollectionEquality().equals(
                other.isCharityRequestInProgress, isCharityRequestInProgress) &&
            const DeepCollectionEquality().equals(
                other.isPaymentRequestInProgress, isPaymentRequestInProgress) &&
            const DeepCollectionEquality().equals(other.showError, showError) &&
            const DeepCollectionEquality()
                .equals(other.sdkSuccess, sdkSuccess) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(emailController),
      const DeepCollectionEquality().hash(amountController),
      const DeepCollectionEquality().hash(emailFocusNode),
      const DeepCollectionEquality().hash(amountFocusNode),
      const DeepCollectionEquality().hash(selectedPaymentType),
      const DeepCollectionEquality().hash(countryList),
      const DeepCollectionEquality().hash(selectedCountryCode),
      const DeepCollectionEquality().hash(creditors),
      const DeepCollectionEquality().hash(selectedCreditor),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(isPrivacyPolicyAccepted),
      const DeepCollectionEquality().hash(isCountryRequestInProgress),
      const DeepCollectionEquality().hash(isCharityRequestInProgress),
      const DeepCollectionEquality().hash(isPaymentRequestInProgress),
      const DeepCollectionEquality().hash(showError),
      const DeepCollectionEquality().hash(sdkSuccess),
      const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  _$PaymentStateCopyWith<_PaymentState> get copyWith =>
      __$PaymentStateCopyWithImpl<_PaymentState>(this, _$identity);
}

abstract class _PaymentState implements PaymentState {
  const factory _PaymentState(
      {required TextEditingController emailController,
      required TextEditingController amountController,
      required FocusNode emailFocusNode,
      required FocusNode amountFocusNode,
      PaymentType selectedPaymentType,
      List<String> countryList,
      String? selectedCountryCode,
      List<Creditor> creditors,
      Creditor? selectedCreditor,
      String email,
      double amount,
      bool isPrivacyPolicyAccepted,
      bool isCountryRequestInProgress,
      bool isCharityRequestInProgress,
      bool isPaymentRequestInProgress,
      bool showError,
      bool sdkSuccess,
      String? errorMessage}) = _$_PaymentState;

  @override
  TextEditingController get emailController;
  @override
  TextEditingController get amountController;
  @override
  FocusNode get emailFocusNode;
  @override
  FocusNode get amountFocusNode;
  @override
  PaymentType get selectedPaymentType;
  @override
  List<String> get countryList;
  @override
  String? get selectedCountryCode;
  @override
  List<Creditor> get creditors;
  @override
  Creditor? get selectedCreditor;
  @override
  String get email;
  @override
  double get amount;
  @override
  bool get isPrivacyPolicyAccepted;
  @override
  bool get isCountryRequestInProgress;
  @override
  bool get isCharityRequestInProgress;
  @override
  bool get isPaymentRequestInProgress;
  @override
  bool get showError;
  @override
  bool get sdkSuccess;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$PaymentStateCopyWith<_PaymentState> get copyWith =>
      throw _privateConstructorUsedError;
}
