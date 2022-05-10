import 'package:crypto_list/src/modules/user/infra/adapters/json_to_user.dart';
import 'package:crypto_list/src/shared/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late UserEntity user;

  setUp(() {
    user = JsonToUser.fromMap({
      'message': 'All Coins',
      'wallet_id': 'c0inS-13435-2342-zksh-34556',
      'user_balance': '15.455',
      'data': '...'
    });
  });

  test('must convert a map to User', () {
    expect(user, isA<UserEntity>());
    expect(user.walletId, 'c0inS-13435-2342-zksh-34556');
    expect(user.balance, 15455);
  });
}
