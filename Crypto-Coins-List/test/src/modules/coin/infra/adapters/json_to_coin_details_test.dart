import 'package:crypto_list/src/modules/coin/infra/adapters/json_to_coin_details.dart';
import 'package:crypto_list/src/shared/value_objects/coin_details.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CoinDetails details;

  setUp(() {
    details = JsonToCoinDetails.fromMap({
      'about':
          'O criador inicial do Bitcoin é conhecido por seu pseudônimo, Satoshi Nakamoto. Até o momento, em 2020, sua identidade verdadeira como pessoa — ou organização — permanece desconhecida.',
      'fee': 3.345,
    });
  });

  test('must convert a map to CoinDetails', () {
    expect(details, isA<CoinDetails>());
    expect(details.fee, 3.345);
  });
}
