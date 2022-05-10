import 'package:crypto_list/src/modules/user/external/user_simulated_datasource.dart';
import 'package:crypto_list/src/modules/user/infra/repositories/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late UserSimulatedDatasource datasource;
  late UserRepository repository;

  setUp(() {
    datasource = UserSimulatedDatasource();
    repository = UserRepository(datasource);
  });

  test('get user from simulated repository', () async {
    final response = await repository.getUser();
    expect(response.walletId, 'c0inS-13435-2342-zksh-34556');
    expect(response.balance, 15455);
  });
}
