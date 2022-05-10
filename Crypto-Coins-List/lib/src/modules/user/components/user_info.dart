import 'package:crypto_list/src/modules/user/notifier/user_notifier.dart';
import 'package:crypto_list/src/modules/user/state/user_state.dart';
import 'package:crypto_list/src/shared/components/shimmer_box.dart';
import 'package:crypto_list/src/shared/utils/double_helper.dart';
import 'package:crypto_list/src/shared/utils/screen_helper.dart';
import 'package:crypto_list/src/shared/utils/snack_bar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class UserInfo extends StatefulWidget {
  final bool isLoading;

  const UserInfo({Key? key, this.isLoading = false}) : super(key: key);

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  final double _widgetMargin = 16.0;
  static bool _portfolioVisible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildWalletSwitch(context),
        const SizedBox(height: 6),
        _buildWalletInfo(context),
      ],
    );
  }

  Widget _buildWalletInfo(BuildContext context) {
    final size = ScreenHelper(context: context);
    return ValueListenableBuilder<UserStateBase>(
      valueListenable: context.read<UserNotifier>(),
      builder: (context, state, _) {
        if (state is InitialUserState || state is LoadingUserState) {
          return Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(horizontal: _widgetMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerBox(height: 60, width: size.width * 0.8),
                const SizedBox(height: 8),
                ShimmerBox(height: 12, width: size.width * 0.5),
                const SizedBox(height: 4),
              ],
            ),
          );
        } else if (state is LoadedUserState) {
          late Widget loadedWidget;

          if (_portfolioVisible) {
            loadedWidget = Text(
              DoubleHelper.formatToReal(state.user.balance),
              style: Theme.of(context).textTheme.displaySmall,
            );
          }

          return Container(
            margin: EdgeInsets.symmetric(horizontal: _widgetMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: size.width * 0.8,
                  decoration: _portfolioVisible
                      ? null
                      : BoxDecoration(
                          color: Colors.grey.withAlpha((255 * 0.2).toInt()),
                          borderRadius: BorderRadius.circular(16),
                        ),
                  alignment: Alignment.centerLeft,
                  child: _portfolioVisible ? loadedWidget : null,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Carteira: ${state.user.walletId}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: Icon(
                        Icons.copy,
                        color: Colors.grey.shade400,
                        size: 16,
                      ),
                      onPressed: () {
                        Clipboard.setData(
                          ClipboardData(text: state.user.walletId),
                        ).then(
                          (_) => SnackBarHelper.showSnackBar(
                            context,
                            message: 'Identificador da carteira copiado!',
                          ),
                        );
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildWalletSwitch(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: _widgetMargin),
      child: Row(
        children: [
          const SizedBox(width: 4),
          Text(
            'Saldo disponível',
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: Colors.grey,
                ),
          ),
          const SizedBox(width: 10),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: Icon(
              _portfolioVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey.shade400,
              size: 16,
            ),
            onPressed: () => setState(
              (() => _portfolioVisible = !_portfolioVisible),
            ),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
        ],
      ),
    );
  }
}
