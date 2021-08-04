import 'package:dio/dio.dart';
import 'package:flutter_case/common/data/remote/http_service.dart';

import 'remote_constant.dart';

class HttpServiceImpl implements HttpService {
  late Dio _dio;

  @override
  void init() {
    _dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
    ));
    //
    initInterceptor();
  }

  /// to intercept Request, Response and Error of http operation
  initInterceptor() {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      // Do something before request is sent
      print("${options.method} | ${options.path}");
      return handler.next(options);
    }, onResponse: (response, handler) {
      // Do something with response data
      print(
          "${response.statusCode} | ${response.statusMessage} | ${response.data}");
      return handler.next(response);
    }, onError: (DioError e, handler) {
      // Do something with response error
      print(e.message);
      return handler.next(e);
    }));
  }

  @override
  Future<Response> getRequest(String url, String offset) async {
    late Response response;
    String endPoint = url + LIMIT + DEFAULT_LIMIT.toString() + OFFSET + offset;
    try {
      response = await _dio.get(endPoint);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }
}
