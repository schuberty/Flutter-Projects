import 'package:crypto_list/src/modules/coin/external/coin_simulated_datasource.dart';
import 'package:crypto_list/src/modules/coin/infra/repositories/coin_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CoinSimulatedDatasource datasource;
  late CoinRepository repository;

  setUp(() {
    datasource = CoinSimulatedDatasource();
    repository = CoinRepository(datasource);
  });

  test('get all coins from simulated repository', () async {
    final response = await repository.getAllCoins();
    expect(response.length, 9);
  });
}
