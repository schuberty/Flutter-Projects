import 'package:crypto_list/src/modules/coin/infra/adapters/json_to_coin_details.dart';
import 'package:crypto_list/src/shared/entities/coin_entity.dart';
import 'package:crypto_list/src/shared/utils/double_helper.dart';

class JsonToCoin {
  static CoinEntity fromMap(dynamic json) {
    return CoinEntity(
      name: json['currency_name'],
      symbol: json['symbol'],
      cotation: DoubleHelper.parseDotted(json['cotation']),
      imageUrl: json['image_url'],
      details: JsonToCoinDetails.fromMap(json['details']),
    );
  }
}
