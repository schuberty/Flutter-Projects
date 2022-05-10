import 'package:crypto_list/src/modules/coin/infra/adapters/json_to_coin.dart';
import 'package:crypto_list/src/shared/entities/coin_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CoinEntity coin;

  setUp(() {
    coin = JsonToCoin.fromMap({
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
    });
  });

  test('must convert a map to Coin', () {
    expect(coin, isA<CoinEntity>());
    expect(coin.name, 'Bitcoin');
    expect(coin.cotation, 194706);
    expect(coin.details.fee, 3.345);
  });
}
