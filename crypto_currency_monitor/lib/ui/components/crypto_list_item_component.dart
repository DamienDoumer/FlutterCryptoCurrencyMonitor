
import 'package:crypto_currency_monitor/blocs/blocs.dart';
import 'package:crypto_currency_monitor/blocs/crypto_list/crypto_list_bloc.dart';
import 'package:crypto_currency_monitor/data/crypto_currency.dart';
import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../app_styles.dart';
import '../views/rounded_network_image.dart';
import 'favorite_icon_button.dart';

class CryptoListItemComponent extends StatelessWidget {
  final CryptoCurrency cryptoCurrency;
  final CryptoListBloc bloc;
  final int rank;
  final BuildContext context;
  final Function(CryptoCurrency cryptoCurrency, int index) onCryptoSelected;

  int get index => rank - 1;

  const CryptoListItemComponent(
      {super.key,
      required this.cryptoCurrency,
      required this.bloc,
      required this.rank,
      required this.context,
      required this.onCryptoSelected});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.shadowColor))),
          height: 50,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center, 
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Container(
                alignment: Alignment.center,
                child: FavoriteIconButton(
                  isFavorite: false,
                  favoritePressed: (isFavorite) {
                  bloc.add(CryptoCurrencyAddedToFavoriteEvent(
                    cryptoCurrency: cryptoCurrency, index: index));
                })),
            SizedBox(
              width: 30,
              child: Text(rank.toString(),
                  textAlign: TextAlign.start,
                  style: AppStyles.cryptoListHeaderTextStyle()),
            ),
            Flexible(
              fit: FlexFit.loose,
              flex: 2,
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
                      Container(
                        constraints: const BoxConstraints(maxWidth: 130),
                        child: Text(cryptoCurrency.name!,
                            style: AppStyles.normalTextStyle()),
                      ),
                      Text(cryptoCurrency.symbol!,
                          style: AppStyles.secondaryTextStyle())
                    ],
                  )
                ],
            )),
            Expanded(
              child:
                Text(
                  AppStyles.formatNumber(cryptoCurrency.currentPrice),
                  style: AppStyles.normalTextStyle())),
            Expanded(
                child: Center(
                    child: Text(
                        AppStyles.formatNumber(cryptoCurrency.marketCap),
                        style: AppStyles.normalTextStyle())))
          ]),
        ),
        onTap: () => onCryptoSelected(cryptoCurrency, index),
      ),
    );
  }
}
