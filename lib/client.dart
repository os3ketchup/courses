import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../variables/links.dart';

import 'http_result.dart';

DioClient? _client;

DioClient get client {
  _client ??= DioClient();
  return _client!;
}

class PrefSourse {
  static const String token = 'user_token';
  static const String lan = 'app_language';
  static const String appTheme = 'app_theme';
  static const String role = 'user_role';
  static const String savedProducts = 'selected_products';
}

// it result returned don't get api information
MainModel get defaultModel => MainModel(
  status: 403,
  message: 'error',
  title: '',
  key: '',
  data: null,
);

class DioClient {
  Dio? _dio;

  Dio get dio {
    if (_dio == null) {
      _dio = Dio();
      _dio!
        ..interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
        ))
        ..options.baseUrl = Links.baseUrl
        ..options.connectTimeout = const Duration(seconds: 30)
        ..options.receiveTimeout = const Duration(seconds: 30)
        ..options.headers = {
          'Content-Type': 'application/json; charset=UTF-8',
        };
    }
    return _dio!;
  }

  Future<MainModel> get(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    bool withoutHeader = false,
  }) async {
    try {
      final response = await dio.get(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: withoutHeader ? {} : await _header()),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return _analyzeResponse(response);
    } catch (e) {
      print('dioError: $e');
      if (e is DioError) {
        return _analyzeResponse(e.response);
      }
      return defaultModel;
    }
  }

  Future<MainModel> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: await _header()),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return _analyzeResponse(response);
    } catch (e) {
      print('dioError: $e');
      if (e is DioError) {
        return _analyzeResponse(e.response);
      }
      return defaultModel;
    }
  }



  MainModel _analyzeResponse(Response? response) {
    if (response != null) {
      if (response.data == null) {
        return defaultModel.copyWith(
          status: response.statusCode,
          message: response.statusMessage,
        );
      }
      if (response.data['status'] == 'OK') {
        return MainModel(
          status: 200,
          message: '',
          data: response.data['predictions'] ?? response.data['results'],
        );
      }
      if (response.data['status'] == null) {
        return MainModel(
          status: 200,
          message: '',
          data: response.data,
        );
      }
      MainModel mainmodel = MainModel.fromJson(response.data);
      if (mainmodel.status == 200 ||
          mainmodel.status == 500 ||
          mainmodel.status == 403 ||
          mainmodel.status == 401) {
        return mainmodel;
      }
      return mainmodel.copyWith(
        message: checkKeys(mainmodel.error),
      );
    }
    return defaultModel;
  }

  Future<Response> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: await _header()),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    try {
      var response = await dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: await _header()),
        cancelToken: cancelToken,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> _header() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(PrefSourse.token) ?? '';
    String lan = pref.getString(PrefSourse.lan) ?? '';
    if (token == "") {
      return {
        "Accept-Language": lan,
      };
    } else {
      return {
        "Authorization": "Bearer $token",
        "Accept-Language": lan,
      };
    }
  }

  String? checkKeys(Map<String, dynamic>? data) {
    if (data == null) {
      return null;
    }
    if (data.values.isEmpty) {
      return "error";;
    }
    try {
      for (var i = 0;
          i < (data.values.length > 20 ? 20 : data.values.length);
          i++) {
        final value = data.values.elementAt(i);
        if (value is List) {
          if (value.isNotEmpty) {
            return value.first.toString();
          }
        } else if (value is String) {
          return value;
        }
      }
      return "error";;
    } catch (e) {
      return "error";
    }
  }
}