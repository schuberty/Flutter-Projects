import 'package:provider/provider.dart';

import 'domain/repositories/user_repository.dart';
import 'domain/usecases/get_user.dart';
import 'external/user_simulated_datasource.dart';
import 'infra/datasources/user_datasource.dart';
import 'infra/repositories/user_repository.dart';
import 'notifier/user_notifier.dart';

final userModule = [
  Provider<UserDatasourceBase>(
    create: (context) => UserSimulatedDatasource(),
  ),
  Provider<UserRepositoryBase>(
    create: (context) => UserRepository(context.read<UserDatasourceBase>()),
  ),
  Provider<GetUserBase>(
    create: (context) => GetUser(context.read<UserRepositoryBase>()),
  ),
  ListenableProvider<UserNotifier>(
    create: (context) => UserNotifier(context.read<GetUserBase>()),
  ),
];
