import 'package:crypto_list/src/modules/coin/coin_module.dart';
import 'package:crypto_list/src/modules/home/home.dart';
import 'package:crypto_list/src/modules/user/user_module.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoinsApp extends StatelessWidget {
  const CoinsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...coinModule,
        ...userModule,
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coin List',
        theme: ThemeData.dark(),
        initialRoute: '/',
        routes: {
          '/': (context) => const Home(),
        },
      ),
    );
  }
}
