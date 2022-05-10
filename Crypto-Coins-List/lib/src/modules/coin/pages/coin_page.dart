import 'package:crypto_list/src/shared/entities/coin_entity.dart';
import 'package:crypto_list/src/shared/utils/double_helper.dart';
import 'package:crypto_list/src/shared/utils/screen_helper.dart';
import 'package:flutter/material.dart';

class CoinPage extends StatelessWidget {
  final CoinEntity coin;
  final String heroId;

  const CoinPage({
    required this.coin,
    this.heroId = '',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = ScreenHelper(context: context);
    final indentSize = size.width * 0.1;

    final detailsTheme =
        Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 16);
    final cotationText = DoubleHelper.formatToReal(coin.cotation);
    final feeText = DoubleHelper.formatToReal(coin.details.fee, decimals: 3);

    return Scaffold(
      appBar: AppBar(
        title: Text('About ${coin.symbol}'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 12),
            Hero(
              tag: heroId,
              child: Image.network(
                coin.imageUrl,
                fit: BoxFit.fitHeight,
                width: size.width,
                height: 160,
              ),
            ),
            const SizedBox(height: 6),
            Text(coin.name, style: Theme.of(context).textTheme.headlineLarge),
            Divider(
              indent: indentSize,
              endIndent: indentSize,
              color: Colors.grey,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: indentSize),
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text.rich(
                    TextSpan(
                      text: 'Cotação de ',
                      children: [
                        TextSpan(
                          text: cotationText,
                          style: detailsTheme.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                      style: detailsTheme,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text.rich(
                    TextSpan(
                      text: 'Taxa de ',
                      children: <TextSpan>[
                        TextSpan(
                          text: feeText,
                          style: detailsTheme.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                      style: detailsTheme,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Sobre ${coin.name}', style: detailsTheme),
                  Divider(
                    height: 16,
                    color: Colors.white30,
                    endIndent: size.width * 0.585,
                  ),
                  Text(
                    coin.details.about,
                    style: detailsTheme,
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 8,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
