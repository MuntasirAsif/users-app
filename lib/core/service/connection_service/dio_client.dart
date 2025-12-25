import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'dio_endpoints.dart';
import 'dio_interceptor.dart';


enum DioRequestType { get, post, put, patch, delete }

class DioClientService {
  late Dio dio;
  DioClientService() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiEndPoint.baseUrl,
        connectTimeout: const Duration(minutes: 2),
        receiveTimeout: const Duration(minutes: 2),
      ),
    );
    dio.interceptors.add(DioInterceptor(dio));
  }

  call({
    required String apiUrl,
    required DioRequestType reqType,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    required Function(Response response) ifSucceed,
    Function(ConnectionException)? ifFailed,
    Function? ifLoading,
    dynamic data,
  }) async {
    try {
      await ifLoading?.call();
      late Response response;
      if (reqType == DioRequestType.get) {
        response = await dio.get(
          apiUrl,
          queryParameters: queryParameters,
          options: Options(headers: headers),
        );
      } else if (reqType == DioRequestType.post) {
        response = await dio.post(
          apiUrl,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers),
        );
      } else if (reqType == DioRequestType.put) {
        response = await dio.put(
          apiUrl,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers),
        );
      } else if (reqType == DioRequestType.patch) {
        response = await dio.patch(
          apiUrl,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers),
        );
      } else if (reqType == DioRequestType.delete) {
        response = await dio.delete(
          apiUrl,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers),
        );
      } else {
        throw Exception("Invalid request type");
      }
      await ifSucceed(response);
    } on DioException catch (error, stackTrace) {
      log('error: $stackTrace ${"${error.response?.data['message'] ?? error.message}"}');
      ifFailed!(
        ConnectionException(
          url: error.requestOptions.path,
          message: "${error.response?.data['message'] ?? error.message}",
        ),
      );
    } on TimeoutException {
      ifFailed!(ConnectionException(url: '', message: "Connection Timeout"));
    } catch (error, stackTrace) {
      ifFailed!(ConnectionException(url: stackTrace.toString(), message: error.toString()));
    }
  }
}

class ConnectionException implements Exception {
  final String url;
  final String message;
  final int? statusCode;
  final Response? response;
  ConnectionException({required this.url, required this.message, this.response, this.statusCode});
  @override
  toString() {
    String result = '';
    result += response?.data?['error'] ?? '';
    if (result.isEmpty) {
      result += message;
    }
    return result;
  }
}
