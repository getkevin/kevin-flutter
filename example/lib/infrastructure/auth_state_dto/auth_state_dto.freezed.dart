// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_state_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthStateDTO _$AuthStateDTOFromJson(Map<String, dynamic> json) {
  return _AuthStateDTO.fromJson(json);
}

/// @nodoc
class _$AuthStateDTOTearOff {
  const _$AuthStateDTOTearOff();

  _AuthStateDTO call(
      {required String authorizationLink, required String state}) {
    return _AuthStateDTO(
      authorizationLink: authorizationLink,
      state: state,
    );
  }

  AuthStateDTO fromJson(Map<String, Object?> json) {
    return AuthStateDTO.fromJson(json);
  }
}

/// @nodoc
const $AuthStateDTO = _$AuthStateDTOTearOff();

/// @nodoc
mixin _$AuthStateDTO {
  String get authorizationLink => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthStateDTOCopyWith<AuthStateDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateDTOCopyWith<$Res> {
  factory $AuthStateDTOCopyWith(
          AuthStateDTO value, $Res Function(AuthStateDTO) then) =
      _$AuthStateDTOCopyWithImpl<$Res>;
  $Res call({String authorizationLink, String state});
}

/// @nodoc
class _$AuthStateDTOCopyWithImpl<$Res> implements $AuthStateDTOCopyWith<$Res> {
  _$AuthStateDTOCopyWithImpl(this._value, this._then);

  final AuthStateDTO _value;
  // ignore: unused_field
  final $Res Function(AuthStateDTO) _then;

  @override
  $Res call({
    Object? authorizationLink = freezed,
    Object? state = freezed,
  }) {
    return _then(_value.copyWith(
      authorizationLink: authorizationLink == freezed
          ? _value.authorizationLink
          : authorizationLink // ignore: cast_nullable_to_non_nullable
              as String,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AuthStateDTOCopyWith<$Res>
    implements $AuthStateDTOCopyWith<$Res> {
  factory _$AuthStateDTOCopyWith(
          _AuthStateDTO value, $Res Function(_AuthStateDTO) then) =
      __$AuthStateDTOCopyWithImpl<$Res>;
  @override
  $Res call({String authorizationLink, String state});
}

/// @nodoc
class __$AuthStateDTOCopyWithImpl<$Res> extends _$AuthStateDTOCopyWithImpl<$Res>
    implements _$AuthStateDTOCopyWith<$Res> {
  __$AuthStateDTOCopyWithImpl(
      _AuthStateDTO _value, $Res Function(_AuthStateDTO) _then)
      : super(_value, (v) => _then(v as _AuthStateDTO));

  @override
  _AuthStateDTO get _value => super._value as _AuthStateDTO;

  @override
  $Res call({
    Object? authorizationLink = freezed,
    Object? state = freezed,
  }) {
    return _then(_AuthStateDTO(
      authorizationLink: authorizationLink == freezed
          ? _value.authorizationLink
          : authorizationLink // ignore: cast_nullable_to_non_nullable
              as String,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthStateDTO extends _AuthStateDTO {
  const _$_AuthStateDTO({required this.authorizationLink, required this.state})
      : super._();

  factory _$_AuthStateDTO.fromJson(Map<String, dynamic> json) =>
      _$$_AuthStateDTOFromJson(json);

  @override
  final String authorizationLink;
  @override
  final String state;

  @override
  String toString() {
    return 'AuthStateDTO(authorizationLink: $authorizationLink, state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthStateDTO &&
            const DeepCollectionEquality()
                .equals(other.authorizationLink, authorizationLink) &&
            const DeepCollectionEquality().equals(other.state, state));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(authorizationLink),
      const DeepCollectionEquality().hash(state));

  @JsonKey(ignore: true)
  @override
  _$AuthStateDTOCopyWith<_AuthStateDTO> get copyWith =>
      __$AuthStateDTOCopyWithImpl<_AuthStateDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthStateDTOToJson(this);
  }
}

abstract class _AuthStateDTO extends AuthStateDTO {
  const factory _AuthStateDTO(
      {required String authorizationLink,
      required String state}) = _$_AuthStateDTO;
  const _AuthStateDTO._() : super._();

  factory _AuthStateDTO.fromJson(Map<String, dynamic> json) =
      _$_AuthStateDTO.fromJson;

  @override
  String get authorizationLink;
  @override
  String get state;
  @override
  @JsonKey(ignore: true)
  _$AuthStateDTOCopyWith<_AuthStateDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
