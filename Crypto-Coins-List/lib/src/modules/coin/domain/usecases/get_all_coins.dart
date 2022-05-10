import 'package:crypto_list/src/modules/coin/domain/repositories/coin_repository.dart';
import 'package:crypto_list/src/shared/entities/coin_entity.dart';

abstract class GetAllCoinsBase {
  Future<List<CoinEntity>> call();
}

class GetAllCoins implements GetAllCoinsBase {
  final CoinRepositoryBase repository;

  GetAllCoins(this.repository);

  @override
  Future<List<CoinEntity>> call() async {
    var coins = await repository.getAllCoins();
    return coins;
  }
}
