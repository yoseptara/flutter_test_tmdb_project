import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';

enum DioAction {
  get,
  post,
  put,
  delete,
  patch,
}

class ApiService {
  final String tmdbApiKey = '76f101751d74cefb5b44311e96097b01';
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  final Dio _dio = Dio(
    BaseOptions(baseUrl: baseUrl,  ),
  );

  ApiService() {
    _dio.interceptors.add(
      LogInterceptor(),
    );
    _dio.interceptors.add(ChuckerDioInterceptor());
  }

  Future<dynamic> use({
    required String urlParams,
    required DioAction action,
    String? urlAdditionalParams,
    bool enableLanguageParam = true,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final String finalUrl = '$urlParams?api_key=$tmdbApiKey${enableLanguageParam ? '&language=en-US' : ''}${urlAdditionalParams != null ? '&$urlAdditionalParams' : ''}';
    late Response response;
    switch (action) {
      case DioAction.get:
        response = await _dio.get(
          finalUrl,
          queryParameters: queryParameters,
        );
        break;
      case DioAction.post:
        response = await _dio.post(
          finalUrl,
          data: data,
          queryParameters: queryParameters,
        );
        break;
      case DioAction.put:
        response = await _dio.put(
          finalUrl,
          data: data,
          queryParameters: queryParameters,
        );
        break;
      case DioAction.patch:
        // print('tes patch');
        response = await _dio.patch(
          finalUrl,
          data: data,
          queryParameters: queryParameters,
        );
        break;
      case DioAction.delete:
        response = await _dio.delete(
          finalUrl,
          data: data,
          queryParameters: queryParameters,
        );
        break;
    }

    return response;
  }
}
