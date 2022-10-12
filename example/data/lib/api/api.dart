import 'dart:convert';

import 'package:data/api/entity/api_error_entity.dart';
import 'package:dio/dio.dart';
import 'package:domain/error/model/api_error.dart';
import 'package:support/extension/object.dart';

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
        ApiErrorEntity? parsedError;

        try {
          parsedError = ApiErrorEntity.fromJson(parsedData);
        } catch (_) {
          // Ignore
        }

        parsedError?.let(
          (it) => throw ApiError(
            code: it.error.code,
            name: it.error.name,
            description: it.error.description,
            statusCode: error.response?.statusCode,
          ),
        );
      }
    }

    throw ApiError(
      statusCode: error.response?.statusCode,
      description: error.message.takeIf((it) => it.isNotEmpty),
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
