import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  Dio get dio => Dio()
    ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
}
