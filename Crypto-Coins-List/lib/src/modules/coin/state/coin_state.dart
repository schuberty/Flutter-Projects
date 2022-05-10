import 'package:crypto_list/src/shared/entities/coin_entity.dart';

abstract class CoinStateBase {}

class InitialCoinState extends CoinStateBase {}

class LoadingCoinState extends CoinStateBase {}

class LoadedCoinState extends CoinStateBase {
  final List<CoinEntity> coins;

  LoadedCoinState(this.coins);
}

class ErrorLoadCoinState extends CoinStateBase {
  final String message;

  ErrorLoadCoinState(this.message);
}
