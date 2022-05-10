import 'package:crypto_list/src/shared/entities/coin_entity.dart';
import 'package:crypto_list/src/shared/value_objects/coin_details.dart';

class CoinModel extends CoinEntity {
  CoinModel({
    required String name,
    required String symbol,
    required double cotation,
    required String imageUrl,
    required CoinDetails details,
  }) : super(
          name: name,
          symbol: symbol,
          cotation: cotation,
          imageUrl: imageUrl,
          details: details,
        );

  CoinModel.empty({
    String? name,
    String? symbol,
    double? cotation,
    String? imageUrl,
    CoinDetails? details,
  }) : super(
          name: '',
          symbol: '',
          cotation: 0.0,
          imageUrl: '',
          details: CoinDetails(about: '', fee: 0.0),
        );
}
