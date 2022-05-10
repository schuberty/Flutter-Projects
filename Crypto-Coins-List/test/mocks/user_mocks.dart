import 'package:crypto_list/src/modules/user/domain/repositories/user_repository.dart';
import 'package:crypto_list/src/modules/user/infra/datasources/user_datasource.dart';
import 'package:crypto_list/src/shared/entities/user_entity.dart';
import 'package:mocktail/mocktail.dart';

class UserEntityMock extends Mock implements UserEntity {}

class UserRepositoryMock extends Mock implements UserRepositoryBase {}

class UserDatasourceMock extends Mock implements UserDatasourceBase {}
