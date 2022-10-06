import 'dart:convert';

import 'package:data/api/entity/api_error_entity.dart';
import 'package:dio/dio.dart';
import 'package:domain/error/model/api_error.dart';

Future<Response<T>> makeRequest<T>(
  Future<Response<T>> Function() requestFn,
) async {
  try {
    return await requestFn();
  } on DioError catch (error) {
    final data = error.response?.data;

    if (data != null) {
      dynamic parsedData;

      if (data is String) {
        parsedData = _tryParse(data);
      } else {
        parsedData = data;
      }

      if (parsedData != null && parsedData is Map<String, dynamic>) {
        try {
          final parsedError = ApiErrorEntity.fromJson(parsedData);
          throw ApiError(
            code: parsedError.error.code,
            name: parsedError.error.name,
            description: parsedError.error.description,
            statusCode: error.response?.statusCode,
          );
        } catch (_) {
          // Ignore
        }
      }
    }

    throw ApiError(
      statusCode: error.response?.statusCode,
      description: error.message,
      cause: error.error,
    );
  }
}

dynamic _tryParse(String json) {
  try {
    return jsonDecode(json);
  } catch (ex) {
    return null;
  }
}
