import 'package:crypto_list/src/shared/value_objects/coin_details.dart';

class JsonToCoinDetails {
  static CoinDetails fromMap(dynamic json) {
    return CoinDetails(
      about: json['about'],
      fee: json['fee'],
    );
  }
}
