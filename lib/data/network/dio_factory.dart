// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import '../../app/end_points.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";

class DioFactory {


  Future<Dio> getDio() async {
   final Dio dio = Dio();

    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: "token",
      DEFAULT_LANGUAGE: "en"
    };

    dio.options = BaseOptions(
        baseUrl: EndPoints.baseUrl,
        headers: headers,
        receiveTimeout:const Duration(minutes: 1),
        sendTimeout: const Duration(minutes: 1));

    if (!kReleaseMode) {
      final logger = Logger();

      // its debug mode so print app logs
      dio.interceptors.add(
  InterceptorsWrapper(
    onRequest: (options, handler) {
      // Log request
      logger.d('REQUEST[${options.method}] => PATH: ${options.path}');
      return handler.next(options);
    },
    onResponse: (response, handler) {
      // Log response
      logger.d('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
      return handler.next(response);
    },
    onError: (DioException e, handler) {
      // Log error
      logger.e('ERROR[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}');
      return handler.next(e);
    },
  ),
);
    }

    return dio;
  }
}