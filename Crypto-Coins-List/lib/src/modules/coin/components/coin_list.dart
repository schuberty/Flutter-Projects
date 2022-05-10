import 'package:crypto_list/src/modules/coin/components/coin_tile.dart';
import 'package:crypto_list/src/modules/coin/notifier/coin_notifier.dart';
import 'package:crypto_list/src/modules/coin/pages/coin_page.dart';
import 'package:crypto_list/src/modules/coin/state/coin_state.dart';
import 'package:crypto_list/src/shared/models/coin_model.dart';
import 'package:crypto_list/src/shared/utils/screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoinList extends StatelessWidget {
  const CoinList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Criptomoedas',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ],
        ),
        _buildList(context),
      ],
    );
  }

  Widget _buildList(BuildContext context) {
    final size = ScreenHelper(context: context);

    return ValueListenableBuilder<CoinStateBase>(
      valueListenable: context.read<CoinNotifier>(),
      builder: (context, state, _) {
        const divider = Divider(height: 6);
        if (state is LoadingCoinState || state is InitialCoinState) {
          final loadedShimmers = (size.height ~/ 160) + 1;

          return Expanded(
            child: ListView.builder(
              itemCount: (loadedShimmers * 2) - 1,
              itemBuilder: (context, index) {
                if (index % 2 == 0) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: CoinTile(coin: CoinModel.empty(), isLoading: true),
                  );
                } else {
                  return divider;
                }
              },
            ),
          );
        }

        if (state is LoadedCoinState) {
          var coins = state.coins;
          // coins.sort((a, b) => b.cotation.compareTo(a.cotation));

          return Expanded(
            child: ListView.builder(
              itemCount: (coins.length * 2) - 1,
              itemBuilder: (context, index) {
                if (index % 2 == 0) {
                  final coin = coins[index ~/ 2];
                  final coinHeroId = '${coin.symbol}_${index ~/ 2}';

                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: CoinTile(
                      coin: coin,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CoinPage(
                              coin: coin,
                              heroId: coinHeroId,
                            ),
                          ),
                        );
                      },
                      heroId: coinHeroId,
                    ),
                  );
                } else {
                  return divider;
                }
              },
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
