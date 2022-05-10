import 'package:crypto_list/src/shared/entities/user_entity.dart';

abstract class UserStateBase {}

class InitialUserState extends UserStateBase {}

class LoadingUserState extends UserStateBase {}

class LoadedUserState extends UserStateBase {
  final UserEntity user;

  LoadedUserState(this.user);
}

class ErrorUserState extends UserStateBase {
  final String message;

  ErrorUserState(this.message);
}
