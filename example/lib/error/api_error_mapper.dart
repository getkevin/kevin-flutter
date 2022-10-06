import 'package:domain/error/model/api_error.dart';

class ApiErrorMapper {
  String map(Exception error) {
    if (error is! ApiError) return 'Unknown error';

    if (error.isNoInternet) {
      return 'No Internet';
    } else if (error.description != null) {
      return error.description!;
    }

    return 'Unknown error';
  }
}
