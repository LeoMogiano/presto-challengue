import 'package:prestochallengue/modules/search_merchants/data/models/models.dart';

abstract class SerchRepository {
  Future<List<Merchat>> searchMerchat({
    required String termn,
  });

  Future<List<FavoriteMerchant>> searchFavoriteMerchat();

  Future<void> addFavoriteMerchant({
    required String id,
  });
}
