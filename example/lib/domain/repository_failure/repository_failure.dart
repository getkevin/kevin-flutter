import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository_failure.freezed.dart';

@freezed
class RepositoryFailure with _$RepositoryFailure {
  const RepositoryFailure._();
  const factory RepositoryFailure.apiError(String errorCode) = ApiError;
  const factory RepositoryFailure.sdkError(String errorMessage) = SdkError;
  const factory RepositoryFailure.emptyResponse() = EmptyResponse;
  const factory RepositoryFailure.unexpected() = Unexpected;

  String getErrorMessage() {
    if (this is Unexpected) {
      return 'Unexpected error';
    } else if (this is EmptyResponse) {
      return 'Empty response';
    } else if (this is ApiError) {
      final _this = this as ApiError;
      return 'Api error with code: ${_this.errorCode}';
    } else if (this is SdkError) {
      final _this = this as SdkError;
      return _this.errorMessage;
    } else {
      // Empty
      return 'Empty error';
    }
  }
}
