import 'package:crypto_list/src/modules/coin/components/coin_list.dart';
import 'package:crypto_list/src/modules/coin/notifier/coin_notifier.dart';
import 'package:crypto_list/src/modules/user/components/user_info.dart';
import 'package:crypto_list/src/modules/user/notifier/user_notifier.dart';
import 'package:crypto_list/src/shared/utils/snack_bar_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      context.read<UserNotifier>().fetchUser();
      context.read<CoinNotifier>().fetchCoins();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coins Wallet'),
        actions: <Widget>[
          IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () => SnackBarHelper.showSnackBar(context,
                message: 'Função não implementada'),
            padding: const EdgeInsets.only(right: 16),
            icon: const Icon(Icons.person),
            tooltip: 'Profile Page',
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              UserInfo(),
              Divider(indent: 24, endIndent: 24),
              SizedBox(height: 8),
              Expanded(child: CoinList()),
            ],
          ),
        ),
      ),
    );
  }
}
