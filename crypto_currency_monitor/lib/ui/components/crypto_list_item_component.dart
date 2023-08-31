import 'package:crypto_currency_monitor/bloc/crypto_currencies_bloc.dart';
import 'package:crypto_currency_monitor/data/crypto_currency.dart';
import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../app_styles.dart';
import '../views/rounded_network_image.dart';

class CryptoListItemComponent extends StatelessWidget {
  final CryptoCurrency cryptoCurrency;
  final CryptoCurrenciesBloc bloc;
  final int rank;
  final BuildContext context;
  int get index => rank - 1;

  const CryptoListItemComponent(
      {super.key, required this.cryptoCurrency,
      required this.bloc,
      required this.rank,
      required this.context});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.shadowColor))),
          height: 50,
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
                alignment: Alignment.center,
                child: StreamBuilder(
                    stream: bloc.favoriteStream,
                    builder: (context, snapshot) {
                      var icon = snapshot.hasData &&
                              (snapshot.data?.$1 != null &&
                                  snapshot.data?.$2 != null) &&
                              (snapshot.data!.$1 == index && snapshot.data!.$2)
                          ? Icons.favorite
                          : Icons.favorite_border;
    
                      return IconButton(
                          onPressed: () => bloc.cryptoCurrencyFavoriteTapped(
                              cryptoCurrency, index),
                          icon: Icon(icon,
                              size: 20, color: AppColors.likeButtonColor));
                    })),
            SizedBox(
              width: 30,
              child: Text(rank.toString(),
                  textAlign: TextAlign.start,
                  style: AppStyles.cryptoListHeaderTextStyle()),
            ),
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 3),
                  height: 35,
                  child: RoundedNetworkImage(
                    imageUrl: cryptoCurrency.image!,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(cryptoCurrency.name!,
                        style: AppStyles.normalTextStyle()),
                    Text(cryptoCurrency.symbol!,
                        style: AppStyles.secondaryTextStyle())
                  ],
                )
              ],
            )),
            Expanded(
                child: Center(
                    child: Text(
                        AppStyles.formatNumber(cryptoCurrency.currentPrice),
                        style: AppStyles.normalTextStyle()))),
            Expanded(
                child: Center(
                    child: Text(AppStyles.formatNumber(cryptoCurrency.marketCap),
                        style: AppStyles.normalTextStyle())))
          ]),
        ),
        onTap: () => bloc.cryptoCurrencySelected(cryptoCurrency, index),
      ),
    );
  }
}
