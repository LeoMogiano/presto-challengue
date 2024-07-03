import 'package:http/http.dart';

abstract class HttpService {
  Future<Response> get({
    required Uri uri,
  });

  Future<Response> post({
    required Uri uri,
  });
}
