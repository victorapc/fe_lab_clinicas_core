import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:fe_lab_clinicas_core/src/restclient/intercerptors/auth_intercerptor.dart';

final class RestClient extends DioForNative {
  RestClient(String baseUrl)
      : super(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 60),
          ),
        ) {
    interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
      AuthIntercerptor(),
    ]);
  }

  RestClient get auth {
    options.extra['DIO_AUTH_KEY'] = true;
    return this;
  }

  RestClient get unAuth {
    options.extra['DIO_AUTH_KEY'] = false;
    return this;
  }
}
