import 'package:dio/dio.dart';
// import 'dio_endpoints.dart';

class DioInterceptor extends Interceptor {
  final Dio dio;

  DioInterceptor(this.dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Check if the error is due to an unauthorized request
    // if (err.response?.statusCode == 401) {
    // }
    super.onError(err, handler);
  }

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // final token = await LocalStorage.getJWT();
    // if (token != null && token.isNotEmpty) {
    //   options.headers["Authorization"] = "Bearer $token";
    // }
   // options.headers['X-API-KEY'] = ApiEndPoint.xAPIkey;
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';
    super.onRequest(options, handler);
  }
}
