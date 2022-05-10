import 'package:crypto_list/src/shared/components/shimmer_box.dart';
import 'package:crypto_list/src/shared/entities/coin_entity.dart';
import 'package:crypto_list/src/shared/utils/double_helper.dart';
import 'package:crypto_list/src/shared/utils/screen_helper.dart';
import 'package:flutter/material.dart';

class CoinTile extends StatelessWidget {
  final double _widgetHeight = 80;

  final CoinEntity coin;
  final String heroId;
  final VoidCallback? onTap;
  final bool isLoading;

  const CoinTile({
    required this.coin,
    this.onTap,
    this.heroId = '',
    this.isLoading = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageSize = _widgetHeight * 0.6;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        height: _widgetHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: heroId,
              child: Container(
                height: imageSize,
                width: imageSize,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: isLoading
                    ? null
                    : Image.network(
                        coin.imageUrl,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const SizedBox(width: 10),
            ..._buildCoinData(context),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCoinData(BuildContext context) {
    final size = ScreenHelper(context: context);
    final subTextTheme = Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(color: Colors.grey.shade400);
    final heightSpacing = _widgetHeight * 0.15;
    final feeText = DoubleHelper.formatToReal(coin.details.fee, decimals: 3);

    late List<List<Widget>> widgets;

    if (isLoading) {
      widgets = [
        [
          ShimmerBox(height: 20, width: size.width * 0.15),
          SizedBox(height: heightSpacing),
          ShimmerBox(height: 10, width: size.width * 0.3),
        ],
        [
          ShimmerBox(height: 16, width: size.width * 0.25),
          SizedBox(height: heightSpacing),
          ShimmerBox(height: 10, width: size.width * 0.35),
        ]
      ];
    } else {
      widgets = [
        [
          Text(coin.symbol, style: Theme.of(context).textTheme.titleLarge),
          SizedBox(height: heightSpacing),
          Text(coin.name, style: subTextTheme),
        ],
        [
          Text(
            DoubleHelper.formatToReal(coin.cotation),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: heightSpacing),
          Text(
            '$feeText de taxa',
            style: subTextTheme,
          ),
        ]
      ];
    }

    return <Widget>[
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widgets[0],
      ),
      const Spacer(),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: widgets[1],
      ),
    ];
  }
}
