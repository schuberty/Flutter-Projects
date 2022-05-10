import 'package:provider/provider.dart';

import 'domain/repositories/coin_repository.dart';
import 'domain/usecases/get_all_coins.dart';
import 'external/coin_simulated_datasource.dart';
import 'infra/datasources/coin_datasource.dart';
import 'infra/repositories/coin_repository.dart';
import 'notifier/coin_notifier.dart';

final coinModule = [
  Provider<CoinDatasourceBase>(
    create: ((context) => CoinSimulatedDatasource()),
  ),
  Provider<CoinRepositoryBase>(
    create: ((context) => CoinRepository(context.read<CoinDatasourceBase>())),
  ),
  Provider<GetAllCoinsBase>(
    create: (context) => GetAllCoins(context.read<CoinRepositoryBase>()),
  ),
  ListenableProvider<CoinNotifier>(
    create: (context) => CoinNotifier(context.read<GetAllCoinsBase>()),
  ),
];
