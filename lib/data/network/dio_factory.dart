import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tutapp/app/app_preferences.dart';
import 'package:tutapp/app/constants.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "langauge";

class DioFactory {
  final AppPreferences _appPreferences;

  DioFactory(this._appPreferences);
  Future<Dio> getDio() async {
    Dio dio = Dio();
    String langauge =await _appPreferences.getLanguage();
    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: Constants.token,
      DEFAULT_LANGUAGE: langauge// todo get lang from app prefs
    };

    dio.options = BaseOptions(
        baseUrl: Constants.baseUrl,
        headers: headers,
        receiveTimeout: const Duration(milliseconds: Constants.apiTimeOut),
        sendTimeout: const Duration(milliseconds: Constants.apiTimeOut));
    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
    return dio;
  }
}
