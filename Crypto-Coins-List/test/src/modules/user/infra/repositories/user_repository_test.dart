import 'package:crypto_list/src/modules/user/infra/repositories/user_repository.dart';
import 'package:crypto_list/src/shared/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks/user_mocks.dart';

void main() {
  late UserDatasourceMock datasource;
  late UserRepository repository;

  setUp(() {
    datasource = UserDatasourceMock();
    repository = UserRepository(datasource);
  });

  test('must return a User', () async {
    when(() => datasource.getUser()).thenAnswer(
      (_) async => {
        'wallet_id': 'c0inS-13435-2342-zksh-34556',
        'user_balance': '15.455',
      },
    );

    final response = await repository.getUser();
    expect(response, isA<UserEntity>());
    expect(response.walletId, 'c0inS-13435-2342-zksh-34556');
    expect(response.balance, 15455);
  });
}
