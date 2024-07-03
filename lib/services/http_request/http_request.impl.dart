import 'package:http/src/response.dart';
import 'package:prestochallengue/components/exceptions/request_service_exceptions.dart';
import 'package:prestochallengue/services/http_request/http_request.dart';
import 'package:http/http.dart' as http;

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
  Future<Response> post({required Uri uri}) async {
    http.Response result;
    result = await http.post(uri).timeout(const Duration(seconds: 10),
        onTimeout: () {
      throw TimeOutException();
    });
    return result;
  }
}
