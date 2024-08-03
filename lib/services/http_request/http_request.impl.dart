import 'package:http/http.dart' as http;
import 'package:http/src/response.dart';

import 'package:prestochallengue/components/exceptions/request_service_exceptions.dart';
import 'package:prestochallengue/services/http_request/http_request.dart';

class HttpRequestService implements HttpService {
  @override
  Future<Response> get({required Uri uri}) async {
    http.Response result;
    result =
        await http.get(uri).timeout(const Duration(seconds: 10), onTimeout: () {
      throw TimeOutException();
    });
    return result;
  }

  @override
  Future<http.Response> post({
    required Uri uri,
    String? body,
    Map<String, String>? headers,
  }) async {
    final response = await http.post(
      uri,
      body: body,
      headers: headers,
    );
    return response;
  }
}
