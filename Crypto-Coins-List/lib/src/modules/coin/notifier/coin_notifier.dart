import 'package:crypto_list/src/modules/coin/domain/usecases/get_all_coins.dart';
import 'package:crypto_list/src/modules/coin/state/coin_state.dart';
import 'package:flutter/widgets.dart';

class CoinNotifier extends ValueNotifier<CoinStateBase> {
  final GetAllCoinsBase getAllCoins;

  CoinNotifier(this.getAllCoins) : super(InitialCoinState());

  Future fetchCoins() async {
    value = LoadingCoinState();
    try {
      final coins = await getAllCoins();
      value = LoadedCoinState(coins);
    } catch (e) {
      value = ErrorLoadCoinState(e.toString());
    }
  }
}
