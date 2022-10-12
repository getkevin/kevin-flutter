import 'dart:convert';

import 'package:data/api/api.dart';
import 'package:domain/error/model/api_error.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_data.dart';

void main() {
  test('Successful response test', () async {
    final response = dioResponse();

    final result = await makeRequest(() async => response);

    expect(result, response);
  });

  test('Empty data error test', () async {
    final error = dioError(response: dioResponse(statusCode: 400));

    expect(
      () async => makeRequest(() {
        throw error;
      }),
      throwsA(const ApiError(statusCode: 400)),
    );
  });

  test('Error data is not String/Map<String, dynamic> test', () async {
    final error = dioError(
      response: dioResponse(statusCode: 400, data: ['wrong data type']),
    );

    expect(
      () async => makeRequest(() {
        throw error;
      }),
      throwsA(const ApiError(statusCode: 400)),
    );
  });

  test('Error data is parse-able String test', () async {
    final errorMap = {
      'error': {
        'code': 400,
        'name': 'name',
        'description': 'description',
      }
    };
    final errorJsonString = jsonEncode(errorMap);

    final error = dioError(
      response: dioResponse(statusCode: 400, data: errorJsonString),
    );

    expect(
      () async => makeRequest(() {
        throw error;
      }),
      throwsA(
        const ApiError(
          statusCode: 400,
          name: 'name',
          description: 'description',
          code: 400,
        ),
      ),
    );
  });

  test('Error data is parse-able Map test', () async {
    final errorMap = {
      'error': {
        'code': 400,
        'name': 'name',
        'description': 'description',
      }
    };

    final error = dioError(
      response: dioResponse(statusCode: 400, data: errorMap),
    );

    expect(
      () async => makeRequest(() {
        throw error;
      }),
      throwsA(
        const ApiError(
          statusCode: 400,
          name: 'name',
          description: 'description',
          code: 400,
        ),
      ),
    );
  });

  test('Error data is non-parse-able String test', () async {
    final errorMap = {
      'errorTest': {
        'code': 400,
        'name': 'name',
        'description': 'description',
      }
    };
    final errorJsonString = jsonEncode(errorMap);

    final error = dioError(
      response: dioResponse(statusCode: 400, data: errorJsonString),
    );

    expect(
      () async => makeRequest(() {
        throw error;
      }),
      throwsA(
        const ApiError(statusCode: 400),
      ),
    );
  });

  test('Error data is non-parse-able Map test', () async {
    final errorMap = {
      'errorTest': {
        'code': 400,
        'name': 'name',
        'description': 'description',
      }
    };

    final error = dioError(
      response: dioResponse(statusCode: 400, data: errorMap),
    );

    expect(
      () async => makeRequest(() {
        throw error;
      }),
      throwsA(
        const ApiError(statusCode: 400),
      ),
    );
  });
}
