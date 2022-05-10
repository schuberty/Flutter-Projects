import 'package:crypto_list/src/modules/coin/infra/repositories/coin_repository.dart';
import 'package:crypto_list/src/shared/entities/coin_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks/coin_mocks.dart';

void main() {
  late CoinDatasourceMock datasource;
  late CoinRepository repository;

  setUp(() {
    datasource = CoinDatasourceMock();
    repository = CoinRepository(datasource);
  });

  test('must return a list of Coins', () async {
    when(() => datasource.getAllCoins()).thenAnswer(
      (_) async => [
        {
          'currency_name': 'Bitcoin',
          'cotation': '194.706',
          'symbol': 'BTC',
          'image_url':
              'https://panda-crypto-images.s3.amazonaws.com/512d12d5c9a9b30c6d53-Bitcoin.png',
          'details': {
            'about':
                'O criador inicial do Bitcoin é conhecido por seu pseudônimo, Satoshi Nakamoto. Até o momento, em 2020, sua identidade verdadeira como pessoa — ou organização — permanece desconhecida.',
            'fee': 3.345
          }
        },
      ],
    );

    final response = await repository.getAllCoins();
    expect(response, isA<List<CoinEntity>>());
    expect(response.length, 1);
    expect(response.first.cotation, 194706);
  });
}
