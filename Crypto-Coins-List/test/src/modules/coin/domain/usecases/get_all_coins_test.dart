import 'package:crypto_list/src/modules/coin/domain/usecases/get_all_coins.dart';
import 'package:crypto_list/src/shared/entities/coin_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks/coin_mocks.dart';

void main() {
  late CoinRepositoryMock repository;
  late CoinEntityMock entity;
  late GetAllCoins usecase;

  setUp(() async {
    repository = CoinRepositoryMock();
    entity = CoinEntityMock();
    usecase = GetAllCoins(repository);
  });

  test('get all coins must return a list of Coins', () async {
    when(() => repository.getAllCoins()).thenAnswer(
      (_) async => [entity],
    );
    final response = await usecase();
    expect(response, isA<List<CoinEntity>>());
  });
}
