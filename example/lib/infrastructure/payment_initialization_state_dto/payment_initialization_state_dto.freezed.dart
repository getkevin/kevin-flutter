// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'payment_initialization_state_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentInitializationStateDTO _$PaymentInitializationStateDTOFromJson(
    Map<String, dynamic> json) {
  return _PaymentInitializationStateDTO.fromJson(json);
}

/// @nodoc
class _$PaymentInitializationStateDTOTearOff {
  const _$PaymentInitializationStateDTOTearOff();

  _PaymentInitializationStateDTO call(
      {required String id,
      String? bankStatus,
      String? cardStatus,
      required String statusGroup,
      required String confirmLink}) {
    return _PaymentInitializationStateDTO(
      id: id,
      bankStatus: bankStatus,
      cardStatus: cardStatus,
      statusGroup: statusGroup,
      confirmLink: confirmLink,
    );
  }

  PaymentInitializationStateDTO fromJson(Map<String, Object?> json) {
    return PaymentInitializationStateDTO.fromJson(json);
  }
}

/// @nodoc
const $PaymentInitializationStateDTO = _$PaymentInitializationStateDTOTearOff();

/// @nodoc
mixin _$PaymentInitializationStateDTO {
  String get id => throw _privateConstructorUsedError;
  String? get bankStatus => throw _privateConstructorUsedError;
  String? get cardStatus => throw _privateConstructorUsedError;
  String get statusGroup => throw _privateConstructorUsedError;
  String get confirmLink => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentInitializationStateDTOCopyWith<PaymentInitializationStateDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentInitializationStateDTOCopyWith<$Res> {
  factory $PaymentInitializationStateDTOCopyWith(
          PaymentInitializationStateDTO value,
          $Res Function(PaymentInitializationStateDTO) then) =
      _$PaymentInitializationStateDTOCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String? bankStatus,
      String? cardStatus,
      String statusGroup,
      String confirmLink});
}

/// @nodoc
class _$PaymentInitializationStateDTOCopyWithImpl<$Res>
    implements $PaymentInitializationStateDTOCopyWith<$Res> {
  _$PaymentInitializationStateDTOCopyWithImpl(this._value, this._then);

  final PaymentInitializationStateDTO _value;
  // ignore: unused_field
  final $Res Function(PaymentInitializationStateDTO) _then;

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
abstract class _$PaymentInitializationStateDTOCopyWith<$Res>
    implements $PaymentInitializationStateDTOCopyWith<$Res> {
  factory _$PaymentInitializationStateDTOCopyWith(
          _PaymentInitializationStateDTO value,
          $Res Function(_PaymentInitializationStateDTO) then) =
      __$PaymentInitializationStateDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String? bankStatus,
      String? cardStatus,
      String statusGroup,
      String confirmLink});
}

/// @nodoc
class __$PaymentInitializationStateDTOCopyWithImpl<$Res>
    extends _$PaymentInitializationStateDTOCopyWithImpl<$Res>
    implements _$PaymentInitializationStateDTOCopyWith<$Res> {
  __$PaymentInitializationStateDTOCopyWithImpl(
      _PaymentInitializationStateDTO _value,
      $Res Function(_PaymentInitializationStateDTO) _then)
      : super(_value, (v) => _then(v as _PaymentInitializationStateDTO));

  @override
  _PaymentInitializationStateDTO get _value =>
      super._value as _PaymentInitializationStateDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? bankStatus = freezed,
    Object? cardStatus = freezed,
    Object? statusGroup = freezed,
    Object? confirmLink = freezed,
  }) {
    return _then(_PaymentInitializationStateDTO(
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
@JsonSerializable()
class _$_PaymentInitializationStateDTO extends _PaymentInitializationStateDTO {
  const _$_PaymentInitializationStateDTO(
      {required this.id,
      this.bankStatus,
      this.cardStatus,
      required this.statusGroup,
      required this.confirmLink})
      : super._();

  factory _$_PaymentInitializationStateDTO.fromJson(
          Map<String, dynamic> json) =>
      _$$_PaymentInitializationStateDTOFromJson(json);

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
    return 'PaymentInitializationStateDTO(id: $id, bankStatus: $bankStatus, cardStatus: $cardStatus, statusGroup: $statusGroup, confirmLink: $confirmLink)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaymentInitializationStateDTO &&
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
  _$PaymentInitializationStateDTOCopyWith<_PaymentInitializationStateDTO>
      get copyWith => __$PaymentInitializationStateDTOCopyWithImpl<
          _PaymentInitializationStateDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentInitializationStateDTOToJson(this);
  }
}

abstract class _PaymentInitializationStateDTO
    extends PaymentInitializationStateDTO {
  const factory _PaymentInitializationStateDTO(
      {required String id,
      String? bankStatus,
      String? cardStatus,
      required String statusGroup,
      required String confirmLink}) = _$_PaymentInitializationStateDTO;
  const _PaymentInitializationStateDTO._() : super._();

  factory _PaymentInitializationStateDTO.fromJson(Map<String, dynamic> json) =
      _$_PaymentInitializationStateDTO.fromJson;

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
  _$PaymentInitializationStateDTOCopyWith<_PaymentInitializationStateDTO>
      get copyWith => throw _privateConstructorUsedError;
}
