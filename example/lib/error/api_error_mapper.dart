import 'package:domain/error/model/api_error.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:kevin_flutter_example/generated/locale_keys.g.dart';

class ApiErrorMapper {
  String map(Exception error) {
    if (error is! ApiError) return LocaleKeys.general_error_unknown.tr();

    if (error.isNoInternet) {
      return LocaleKeys.general_error_no_internet.tr();
    } else if (error.description != null) {
      return error.description!;
    }

    return LocaleKeys.general_error_unknown.tr();
  }
}
