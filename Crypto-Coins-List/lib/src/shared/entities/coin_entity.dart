import 'package:crypto_list/src/shared/value_objects/coin_details.dart';

class CoinEntity {
  final String name;
  final String symbol;
  final double cotation;
  final String imageUrl;
  final CoinDetails details;

  CoinEntity({
    required this.name,
    required this.symbol,
    required this.cotation,
    required this.imageUrl,
    required this.details,
  });
}
