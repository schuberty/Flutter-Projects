import 'package:crypto_list/src/shared/entities/user_entity.dart';

abstract class UserRepositoryBase {
  Future<UserEntity> getUser();
}
