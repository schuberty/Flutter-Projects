import 'dart:convert';

import 'package:crypto_list/src/modules/coin/infra/datasources/coin_datasource.dart';
import 'package:crypto_list/src/shared/local/json_local_source.dart';

class CoinSimulatedDatasource implements CoinDatasourceBase {
  @override
  Future<List<Map>> getAllCoins() async {
    final response = await CryptoClientSimulator.fetchCoinsData();
    final data = jsonDecode(response)['data'];

    return [...data];
  }
}
