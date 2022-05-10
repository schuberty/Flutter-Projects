import 'package:crypto_list/src/modules/user/domain/repositories/user_repository.dart';
import 'package:crypto_list/src/shared/entities/user_entity.dart';

abstract class GetUserBase {
  Future<UserEntity> call();
}

class GetUser implements GetUserBase {
  final UserRepositoryBase repository;

  GetUser(this.repository);

  @override
  Future<UserEntity> call() async {
    var user = repository.getUser();
    return user;
  }
}
