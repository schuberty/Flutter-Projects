import 'package:crypto_list/src/modules/user/domain/repositories/user_repository.dart';
import 'package:crypto_list/src/modules/user/infra/adapters/json_to_user.dart';
import 'package:crypto_list/src/modules/user/infra/datasources/user_datasource.dart';
import 'package:crypto_list/src/shared/entities/user_entity.dart';

class UserRepository extends UserRepositoryBase {
  final UserDatasourceBase datasource;

  UserRepository(this.datasource);

  @override
  Future<UserEntity> getUser() async {
    var user = await datasource.getUser();
    return JsonToUser.fromMap(user);
  }
}
