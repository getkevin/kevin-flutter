// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'repository_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RepositoryFailureTearOff {
  const _$RepositoryFailureTearOff();

  ApiError apiError(String errorCode) {
    return ApiError(
      errorCode,
    );
  }

  SdkError sdkError(String errorMessage) {
    return SdkError(
      errorMessage,
    );
  }

  EmptyResponse emptyResponse() {
    return const EmptyResponse();
  }

  Unexpected unexpected() {
    return const Unexpected();
  }
}

/// @nodoc
const $RepositoryFailure = _$RepositoryFailureTearOff();

/// @nodoc
mixin _$RepositoryFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String errorCode) apiError,
    required TResult Function(String errorMessage) sdkError,
    required TResult Function() emptyResponse,
    required TResult Function() unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String errorCode)? apiError,
    TResult Function(String errorMessage)? sdkError,
    TResult Function()? emptyResponse,
    TResult Function()? unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String errorCode)? apiError,
    TResult Function(String errorMessage)? sdkError,
    TResult Function()? emptyResponse,
    TResult Function()? unexpected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiError value) apiError,
    required TResult Function(SdkError value) sdkError,
    required TResult Function(EmptyResponse value) emptyResponse,
    required TResult Function(Unexpected value) unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ApiError value)? apiError,
    TResult Function(SdkError value)? sdkError,
    TResult Function(EmptyResponse value)? emptyResponse,
    TResult Function(Unexpected value)? unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiError value)? apiError,
    TResult Function(SdkError value)? sdkError,
    TResult Function(EmptyResponse value)? emptyResponse,
    TResult Function(Unexpected value)? unexpected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepositoryFailureCopyWith<$Res> {
  factory $RepositoryFailureCopyWith(
          RepositoryFailure value, $Res Function(RepositoryFailure) then) =
      _$RepositoryFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$RepositoryFailureCopyWithImpl<$Res>
    implements $RepositoryFailureCopyWith<$Res> {
  _$RepositoryFailureCopyWithImpl(this._value, this._then);

  final RepositoryFailure _value;
  // ignore: unused_field
  final $Res Function(RepositoryFailure) _then;
}

/// @nodoc
abstract class $ApiErrorCopyWith<$Res> {
  factory $ApiErrorCopyWith(ApiError value, $Res Function(ApiError) then) =
      _$ApiErrorCopyWithImpl<$Res>;
  $Res call({String errorCode});
}

/// @nodoc
class _$ApiErrorCopyWithImpl<$Res> extends _$RepositoryFailureCopyWithImpl<$Res>
    implements $ApiErrorCopyWith<$Res> {
  _$ApiErrorCopyWithImpl(ApiError _value, $Res Function(ApiError) _then)
      : super(_value, (v) => _then(v as ApiError));

  @override
  ApiError get _value => super._value as ApiError;

  @override
  $Res call({
    Object? errorCode = freezed,
  }) {
    return _then(ApiError(
      errorCode == freezed
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ApiError extends ApiError {
  const _$ApiError(this.errorCode) : super._();

  @override
  final String errorCode;

  @override
  String toString() {
    return 'RepositoryFailure.apiError(errorCode: $errorCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ApiError &&
            const DeepCollectionEquality().equals(other.errorCode, errorCode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(errorCode));

  @JsonKey(ignore: true)
  @override
  $ApiErrorCopyWith<ApiError> get copyWith =>
      _$ApiErrorCopyWithImpl<ApiError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String errorCode) apiError,
    required TResult Function(String errorMessage) sdkError,
    required TResult Function() emptyResponse,
    required TResult Function() unexpected,
  }) {
    return apiError(errorCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String errorCode)? apiError,
    TResult Function(String errorMessage)? sdkError,
    TResult Function()? emptyResponse,
    TResult Function()? unexpected,
  }) {
    return apiError?.call(errorCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String errorCode)? apiError,
    TResult Function(String errorMessage)? sdkError,
    TResult Function()? emptyResponse,
    TResult Function()? unexpected,
    required TResult orElse(),
  }) {
    if (apiError != null) {
      return apiError(errorCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiError value) apiError,
    required TResult Function(SdkError value) sdkError,
    required TResult Function(EmptyResponse value) emptyResponse,
    required TResult Function(Unexpected value) unexpected,
  }) {
    return apiError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ApiError value)? apiError,
    TResult Function(SdkError value)? sdkError,
    TResult Function(EmptyResponse value)? emptyResponse,
    TResult Function(Unexpected value)? unexpected,
  }) {
    return apiError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiError value)? apiError,
    TResult Function(SdkError value)? sdkError,
    TResult Function(EmptyResponse value)? emptyResponse,
    TResult Function(Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (apiError != null) {
      return apiError(this);
    }
    return orElse();
  }
}

abstract class ApiError extends RepositoryFailure {
  const factory ApiError(String errorCode) = _$ApiError;
  const ApiError._() : super._();

  String get errorCode;
  @JsonKey(ignore: true)
  $ApiErrorCopyWith<ApiError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SdkErrorCopyWith<$Res> {
  factory $SdkErrorCopyWith(SdkError value, $Res Function(SdkError) then) =
      _$SdkErrorCopyWithImpl<$Res>;
  $Res call({String errorMessage});
}

/// @nodoc
class _$SdkErrorCopyWithImpl<$Res> extends _$RepositoryFailureCopyWithImpl<$Res>
    implements $SdkErrorCopyWith<$Res> {
  _$SdkErrorCopyWithImpl(SdkError _value, $Res Function(SdkError) _then)
      : super(_value, (v) => _then(v as SdkError));

  @override
  SdkError get _value => super._value as SdkError;

  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(SdkError(
      errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SdkError extends SdkError {
  const _$SdkError(this.errorMessage) : super._();

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'RepositoryFailure.sdkError(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SdkError &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  $SdkErrorCopyWith<SdkError> get copyWith =>
      _$SdkErrorCopyWithImpl<SdkError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String errorCode) apiError,
    required TResult Function(String errorMessage) sdkError,
    required TResult Function() emptyResponse,
    required TResult Function() unexpected,
  }) {
    return sdkError(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String errorCode)? apiError,
    TResult Function(String errorMessage)? sdkError,
    TResult Function()? emptyResponse,
    TResult Function()? unexpected,
  }) {
    return sdkError?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String errorCode)? apiError,
    TResult Function(String errorMessage)? sdkError,
    TResult Function()? emptyResponse,
    TResult Function()? unexpected,
    required TResult orElse(),
  }) {
    if (sdkError != null) {
      return sdkError(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiError value) apiError,
    required TResult Function(SdkError value) sdkError,
    required TResult Function(EmptyResponse value) emptyResponse,
    required TResult Function(Unexpected value) unexpected,
  }) {
    return sdkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ApiError value)? apiError,
    TResult Function(SdkError value)? sdkError,
    TResult Function(EmptyResponse value)? emptyResponse,
    TResult Function(Unexpected value)? unexpected,
  }) {
    return sdkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiError value)? apiError,
    TResult Function(SdkError value)? sdkError,
    TResult Function(EmptyResponse value)? emptyResponse,
    TResult Function(Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (sdkError != null) {
      return sdkError(this);
    }
    return orElse();
  }
}

abstract class SdkError extends RepositoryFailure {
  const factory SdkError(String errorMessage) = _$SdkError;
  const SdkError._() : super._();

  String get errorMessage;
  @JsonKey(ignore: true)
  $SdkErrorCopyWith<SdkError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmptyResponseCopyWith<$Res> {
  factory $EmptyResponseCopyWith(
          EmptyResponse value, $Res Function(EmptyResponse) then) =
      _$EmptyResponseCopyWithImpl<$Res>;
}

/// @nodoc
class _$EmptyResponseCopyWithImpl<$Res>
    extends _$RepositoryFailureCopyWithImpl<$Res>
    implements $EmptyResponseCopyWith<$Res> {
  _$EmptyResponseCopyWithImpl(
      EmptyResponse _value, $Res Function(EmptyResponse) _then)
      : super(_value, (v) => _then(v as EmptyResponse));

  @override
  EmptyResponse get _value => super._value as EmptyResponse;
}

/// @nodoc

class _$EmptyResponse extends EmptyResponse {
  const _$EmptyResponse() : super._();

  @override
  String toString() {
    return 'RepositoryFailure.emptyResponse()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is EmptyResponse);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String errorCode) apiError,
    required TResult Function(String errorMessage) sdkError,
    required TResult Function() emptyResponse,
    required TResult Function() unexpected,
  }) {
    return emptyResponse();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String errorCode)? apiError,
    TResult Function(String errorMessage)? sdkError,
    TResult Function()? emptyResponse,
    TResult Function()? unexpected,
  }) {
    return emptyResponse?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String errorCode)? apiError,
    TResult Function(String errorMessage)? sdkError,
    TResult Function()? emptyResponse,
    TResult Function()? unexpected,
    required TResult orElse(),
  }) {
    if (emptyResponse != null) {
      return emptyResponse();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiError value) apiError,
    required TResult Function(SdkError value) sdkError,
    required TResult Function(EmptyResponse value) emptyResponse,
    required TResult Function(Unexpected value) unexpected,
  }) {
    return emptyResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ApiError value)? apiError,
    TResult Function(SdkError value)? sdkError,
    TResult Function(EmptyResponse value)? emptyResponse,
    TResult Function(Unexpected value)? unexpected,
  }) {
    return emptyResponse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiError value)? apiError,
    TResult Function(SdkError value)? sdkError,
    TResult Function(EmptyResponse value)? emptyResponse,
    TResult Function(Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (emptyResponse != null) {
      return emptyResponse(this);
    }
    return orElse();
  }
}

abstract class EmptyResponse extends RepositoryFailure {
  const factory EmptyResponse() = _$EmptyResponse;
  const EmptyResponse._() : super._();
}

/// @nodoc
abstract class $UnexpectedCopyWith<$Res> {
  factory $UnexpectedCopyWith(
          Unexpected value, $Res Function(Unexpected) then) =
      _$UnexpectedCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnexpectedCopyWithImpl<$Res>
    extends _$RepositoryFailureCopyWithImpl<$Res>
    implements $UnexpectedCopyWith<$Res> {
  _$UnexpectedCopyWithImpl(Unexpected _value, $Res Function(Unexpected) _then)
      : super(_value, (v) => _then(v as Unexpected));

  @override
  Unexpected get _value => super._value as Unexpected;
}

/// @nodoc

class _$Unexpected extends Unexpected {
  const _$Unexpected() : super._();

  @override
  String toString() {
    return 'RepositoryFailure.unexpected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Unexpected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String errorCode) apiError,
    required TResult Function(String errorMessage) sdkError,
    required TResult Function() emptyResponse,
    required TResult Function() unexpected,
  }) {
    return unexpected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String errorCode)? apiError,
    TResult Function(String errorMessage)? sdkError,
    TResult Function()? emptyResponse,
    TResult Function()? unexpected,
  }) {
    return unexpected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String errorCode)? apiError,
    TResult Function(String errorMessage)? sdkError,
    TResult Function()? emptyResponse,
    TResult Function()? unexpected,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiError value) apiError,
    required TResult Function(SdkError value) sdkError,
    required TResult Function(EmptyResponse value) emptyResponse,
    required TResult Function(Unexpected value) unexpected,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ApiError value)? apiError,
    TResult Function(SdkError value)? sdkError,
    TResult Function(EmptyResponse value)? emptyResponse,
    TResult Function(Unexpected value)? unexpected,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiError value)? apiError,
    TResult Function(SdkError value)? sdkError,
    TResult Function(EmptyResponse value)? emptyResponse,
    TResult Function(Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class Unexpected extends RepositoryFailure {
  const factory Unexpected() = _$Unexpected;
  const Unexpected._() : super._();
}
