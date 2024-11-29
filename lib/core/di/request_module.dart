
import 'package:slash_task/core/constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @singleton
  Dio get dio {
    final dio = Dio(
      BaseOptions(
        baseUrl: APIConstants.baseURL,
        receiveDataWhenStatusError: true,
      ),
    );

    return dio;
  }
}
