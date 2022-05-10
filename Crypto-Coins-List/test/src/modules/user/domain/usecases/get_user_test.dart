import 'package:crypto_list/src/modules/user/domain/usecases/get_user.dart';
import 'package:crypto_list/src/shared/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks/user_mocks.dart';

void main() {
  late UserRepositoryMock repository;
  late UserEntityMock entity;
  late GetUser usecase;

  setUp(() {
    repository = UserRepositoryMock();
    entity = UserEntityMock();
    usecase = GetUser(repository);
  });

  test('get user usecase must return a User', () async {
    when(() => repository.getUser()).thenAnswer((_) async => entity);

    final response = await usecase();
    expect(response, isA<UserEntity>());
  });
}
