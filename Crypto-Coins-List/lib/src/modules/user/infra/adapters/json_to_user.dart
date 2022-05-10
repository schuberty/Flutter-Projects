import 'package:crypto_list/src/shared/entities/user_entity.dart';
import 'package:crypto_list/src/shared/utils/double_helper.dart';

class JsonToUser {
  static UserEntity fromMap(dynamic json) {
    return UserEntity(
      walletId: json['wallet_id'],
      balance: DoubleHelper.parseDotted(json['user_balance']),
    );
  }
}
