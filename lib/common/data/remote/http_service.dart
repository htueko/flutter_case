import 'package:dio/dio.dart';

/// contract to perform http operation
abstract class HttpService {
  void init();

  Future<Response> getRequest(String url, String offset);
}
