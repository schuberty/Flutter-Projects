import 'package:crypto_list/src/modules/coin/domain/repositories/coin_repository.dart';
import 'package:crypto_list/src/modules/coin/infra/adapters/json_to_coin.dart';
import 'package:crypto_list/src/modules/coin/infra/datasources/coin_datasource.dart';
import 'package:crypto_list/src/shared/entities/coin_entity.dart';

class CoinRepository implements CoinRepositoryBase {
  final CoinDatasourceBase datasource;

  CoinRepository(this.datasource);

  @override
  Future<List<CoinEntity>> getAllCoins() async {
    final coins = await datasource.getAllCoins();
    return coins.map(JsonToCoin.fromMap).toList();
  }
}
