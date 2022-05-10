import 'package:crypto_list/src/modules/user/domain/usecases/get_user.dart';
import 'package:crypto_list/src/modules/user/state/user_state.dart';
import 'package:flutter/widgets.dart';

class UserNotifier extends ValueNotifier<UserStateBase> {
  final GetUserBase getUser;

  UserNotifier(this.getUser) : super(InitialUserState());

  Future fetchUser() async {
    value = LoadingUserState();
    try {
      final user = await getUser();
      value = LoadedUserState(user);
    } catch (e) {
      value = ErrorUserState(e.toString());
    }
  }
}
