import 'dart:convert';
import 'dart:io';

import 'package:prestochallengue/modules/search_merchants/data/models/merchat.dart';
import 'package:prestochallengue/modules/search_merchants/data/repositories/search_repository.dart';
import 'package:prestochallengue/services/http_request/http_request.dart';
import 'package:http/http.dart' as http;

class SearchRepositoryImpl implements SerchRepository {
  const SearchRepositoryImpl({required HttpService httpService})
      : _httpService = httpService;

  final HttpService _httpService;

  @override
  Future<List<Merchat>> searchMerchat({required String termn}) async {
    http.Response response = await _httpService.get(uri: Uri.parse(""));
    if (response.statusCode == HttpStatus.ok) {
      return [
        Merchat(
          id: "1234",
          name: "BBVA",
          category: "Finanza",
        ),
        Merchat(
          id: "1235",
          name: "CBN",
          category: "Bebidas",
        ),
        Merchat(
          id: "1236",
          name: "BCP",
          category: "Finanza",
        )
      ];
    } else {
      return [];
    }
  }
}
