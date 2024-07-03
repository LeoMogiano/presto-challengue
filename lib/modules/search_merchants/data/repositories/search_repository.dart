import 'package:prestochallengue/modules/search_merchants/data/models/merchat.dart';

abstract class SerchRepository {
  Future<List<Merchat>> searchMerchat({
    required String termn,
  });
}
