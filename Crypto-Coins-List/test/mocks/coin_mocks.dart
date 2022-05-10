import 'package:crypto_list/src/modules/coin/domain/repositories/coin_repository.dart';
import 'package:crypto_list/src/modules/coin/infra/datasources/coin_datasource.dart';
import 'package:crypto_list/src/shared/entities/coin_entity.dart';
import 'package:mocktail/mocktail.dart';

class CoinEntityMock extends Mock implements CoinEntity {}

class CoinDatasourceMock extends Mock implements CoinDatasourceBase {}

class CoinRepositoryMock extends Mock implements CoinRepositoryBase {}
