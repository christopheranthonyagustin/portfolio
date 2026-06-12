import 'package:dio/dio.dart';
import 'app_interceptors.dart';
import '../../constants.dart';

class Api {
  final dio = createDio();
  final tokenDio = Dio(BaseOptions(baseUrl: beveatBaseUrl));

  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: beveatBaseUrl,
      receiveTimeout: 30000,
      connectTimeout: 30000,
      sendTimeout: 30000,
    ));

    dio.interceptors.addAll({AppInterceptors(dio)});
    return dio;
  }
}
