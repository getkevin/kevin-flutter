import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';

class ApiError extends Equatable implements Exception {
  final int? code;
  final String? name;
  final String? description;
  final int? statusCode;
  final dynamic cause;

  const ApiError({
    this.code,
    this.name,
    this.description,
    this.statusCode,
    this.cause,
  }) : super();

  bool get isNoInternet =>
      cause is SocketException || cause is TimeoutException;

  @override
  List<Object?> get props => [
        code,
        name,
        description,
        statusCode,
        cause,
      ];
}
