import 'dart:convert';
import 'dart:io';

import 'package:prestochallengue/modules/search_merchants/data/models/models.dart';
import 'package:prestochallengue/modules/search_merchants/data/repositories/search_repository.dart';
import 'package:prestochallengue/services/http_request/http_request.dart';

class SearchRepositoryImpl implements SerchRepository {
  const SearchRepositoryImpl({required HttpService httpService})
      : _httpService = httpService;

  final HttpService _httpService;

  final String _baseUrl = "https://mobile-backend-challengue-service.onrender.com/challengue";

  @override
  Future<List<Merchat>> searchMerchat({required String termn}) async {
    final response = await _httpService.get(uri: Uri.parse("$_baseUrl/search/merchant?searchTerm=$termn"));
    if (response.statusCode != HttpStatus.ok) return [];
    final dataJson = jsonDecode(response.body);
    return  Merchat.fromJsonList(dataJson);
  }

  @override
  Future<List<FavoriteMerchant>> searchFavoriteMerchat() async {
    final response = await _httpService.get(uri: Uri.parse("$_baseUrl/favorites/merchant"));
    if (response.statusCode != HttpStatus.ok) return [];
    final dataJson = jsonDecode(response.body);
    return FavoriteMerchant.fromJsonList(dataJson);
  }

  @override
  Future<void> addFavoriteMerchant({required String id}) async {
    final uri = Uri.parse("$_baseUrl/save/favorite-merchant");
    final body = {
      "merchantId": id,
      "amountPayment": 10,
    };

    await _httpService.post(
      uri: uri,
      body: jsonEncode(body),
      headers: {"Content-Type": "application/json"},
    );
  }

}
