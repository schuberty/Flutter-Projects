import 'package:crypto_list/src/shared/entities/coin_entity.dart';

abstract class CoinRepositoryBase {
  Future<List<CoinEntity>> getAllCoins();
}
