// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'payment_initialization_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PaymentInitializationStateTearOff {
  const _$PaymentInitializationStateTearOff();

  _PaymentInitializationState call(
      {required String id,
      String? bankStatus,
      String? cardStatus,
      required String statusGroup,
      required String confirmLink}) {
    return _PaymentInitializationState(
      id: id,
      bankStatus: bankStatus,
      cardStatus: cardStatus,
      statusGroup: statusGroup,
      confirmLink: confirmLink,
    );
  }
}

/// @nodoc
const $PaymentInitializationState = _$PaymentInitializationStateTearOff();

/// @nodoc
mixin _$PaymentInitializationState {
  String get id => throw _privateConstructorUsedError;
  String? get bankStatus => throw _privateConstructorUsedError;
  String? get cardStatus => throw _privateConstructorUsedError;
  String get statusGroup => throw _privateConstructorUsedError;
  String get confirmLink => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentInitializationStateCopyWith<PaymentInitializationState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentInitializationStateCopyWith<$Res> {
  factory $PaymentInitializationStateCopyWith(PaymentInitializationState value,
          $Res Function(PaymentInitializationState) then) =
      _$PaymentInitializationStateCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String? bankStatus,
      String? cardStatus,
      String statusGroup,
      String confirmLink});
}

/// @nodoc
class _$PaymentInitializationStateCopyWithImpl<$Res>
    implements $PaymentInitializationStateCopyWith<$Res> {
  _$PaymentInitializationStateCopyWithImpl(this._value, this._then);

  final PaymentInitializationState _value;
  // ignore: unused_field
  final $Res Function(PaymentInitializationState) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? bankStatus = freezed,
    Object? cardStatus = freezed,
    Object? statusGroup = freezed,
    Object? confirmLink = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bankStatus: bankStatus == freezed
          ? _value.bankStatus
          : bankStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      cardStatus: cardStatus == freezed
          ? _value.cardStatus
          : cardStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      statusGroup: statusGroup == freezed
          ? _value.statusGroup
          : statusGroup // ignore: cast_nullable_to_non_nullable
              as String,
      confirmLink: confirmLink == freezed
          ? _value.confirmLink
          : confirmLink // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$PaymentInitializationStateCopyWith<$Res>
    implements $PaymentInitializationStateCopyWith<$Res> {
  factory _$PaymentInitializationStateCopyWith(
          _PaymentInitializationState value,
          $Res Function(_PaymentInitializationState) then) =
      __$PaymentInitializationStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String? bankStatus,
      String? cardStatus,
      String statusGroup,
      String confirmLink});
}

/// @nodoc
class __$PaymentInitializationStateCopyWithImpl<$Res>
    extends _$PaymentInitializationStateCopyWithImpl<$Res>
    implements _$PaymentInitializationStateCopyWith<$Res> {
  __$PaymentInitializationStateCopyWithImpl(_PaymentInitializationState _value,
      $Res Function(_PaymentInitializationState) _then)
      : super(_value, (v) => _then(v as _PaymentInitializationState));

  @override
  _PaymentInitializationState get _value =>
      super._value as _PaymentInitializationState;

  @override
  $Res call({
    Object? id = freezed,
    Object? bankStatus = freezed,
    Object? cardStatus = freezed,
    Object? statusGroup = freezed,
    Object? confirmLink = freezed,
  }) {
    return _then(_PaymentInitializationState(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bankStatus: bankStatus == freezed
          ? _value.bankStatus
          : bankStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      cardStatus: cardStatus == freezed
          ? _value.cardStatus
          : cardStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      statusGroup: statusGroup == freezed
          ? _value.statusGroup
          : statusGroup // ignore: cast_nullable_to_non_nullable
              as String,
      confirmLink: confirmLink == freezed
          ? _value.confirmLink
          : confirmLink // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PaymentInitializationState extends _PaymentInitializationState {
  const _$_PaymentInitializationState(
      {required this.id,
      this.bankStatus,
      this.cardStatus,
      required this.statusGroup,
      required this.confirmLink})
      : super._();

  @override
  final String id;
  @override
  final String? bankStatus;
  @override
  final String? cardStatus;
  @override
  final String statusGroup;
  @override
  final String confirmLink;

  @override
  String toString() {
    return 'PaymentInitializationState(id: $id, bankStatus: $bankStatus, cardStatus: $cardStatus, statusGroup: $statusGroup, confirmLink: $confirmLink)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaymentInitializationState &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.bankStatus, bankStatus) &&
            const DeepCollectionEquality()
                .equals(other.cardStatus, cardStatus) &&
            const DeepCollectionEquality()
                .equals(other.statusGroup, statusGroup) &&
            const DeepCollectionEquality()
                .equals(other.confirmLink, confirmLink));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(bankStatus),
      const DeepCollectionEquality().hash(cardStatus),
      const DeepCollectionEquality().hash(statusGroup),
      const DeepCollectionEquality().hash(confirmLink));

  @JsonKey(ignore: true)
  @override
  _$PaymentInitializationStateCopyWith<_PaymentInitializationState>
      get copyWith => __$PaymentInitializationStateCopyWithImpl<
          _PaymentInitializationState>(this, _$identity);
}

abstract class _PaymentInitializationState extends PaymentInitializationState {
  const factory _PaymentInitializationState(
      {required String id,
      String? bankStatus,
      String? cardStatus,
      required String statusGroup,
      required String confirmLink}) = _$_PaymentInitializationState;
  const _PaymentInitializationState._() : super._();

  @override
  String get id;
  @override
  String? get bankStatus;
  @override
  String? get cardStatus;
  @override
  String get statusGroup;
  @override
  String get confirmLink;
  @override
  @JsonKey(ignore: true)
  _$PaymentInitializationStateCopyWith<_PaymentInitializationState>
      get copyWith => throw _privateConstructorUsedError;
}
