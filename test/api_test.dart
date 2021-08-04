import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class DioMock extends Mock implements Dio {}

String oneCountryJson =
    '''{"status":"OK","status-code":200,"version":"1.0","total":249,"limit":1,"offset":0,"access":"public","data":{"DZ":{"country":"Algeria","region":"Africa"}}}
''';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;

  group('Api test', () {
    const baseUrl = 'https://api.first.org/data/v1';

    setUp(() {
      dio = Dio(BaseOptions(baseUrl: baseUrl));
      dioAdapter = DioAdapter(dio: dio);
    });

    test('fetch country', () async {
      const route = '/countries?limit=1&offset=0';
      dioAdapter.onGet(
          route,
          (server) => {
                server.reply(200, oneCountryJson),
              });

      var response = await dio.get(route);
      var decodedJson = jsonDecode(response.data);
      var localJson = jsonDecode(oneCountryJson);
      expect(response.statusCode, 200);
      expect(decodedJson, localJson);
    });
  });
}
