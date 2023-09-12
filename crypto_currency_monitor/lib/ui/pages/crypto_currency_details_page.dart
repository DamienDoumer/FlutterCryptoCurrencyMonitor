import 'package:crypto_currency_monitor/blocs/blocs.dart';
import 'package:crypto_currency_monitor/ui/pages/shared/base_page.dart';
import 'package:crypto_currency_monitor/ui/views/rounded_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../bloc/constants.dart';
import '../../blocs/crypto_details/crypto_details_bloc.dart';
import '../app_colors.dart';
import '../app_styles.dart';
import '../components/favorite_icon_button.dart';

class CryptoCurrencyDetailsPage extends BasePage<CryptoDetailsBloc> {
  CryptoCurrencyDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    super.build(context);

    // var cryptoListBloc = BlocProvider.of<CryptoListBloc>(context);
    // var cryptoLoadedState = (cryptoListBloc.state as CryptoListLoadedState);
    // var cryptoDetailsBloc = BlocProvider.of<CryptoDetailsBloc>(context);

    // cryptoDetailsBloc.add(LoadCryptoDetailsEvent(cryptoCurrency: cryptoLoadedState.selectedCryptoCurrency!,
    //   fiatCurrency: cryptoLoadedState.selectedFiatCurrency));

    return Scaffold(
      body: BlocBuilder<CryptoDetailsBloc, CryptoDetailsState>(
        builder: (context, state) {

          if (state is CryptoDetailsInitState ||
              state is CryptoDetailsLoadingState) {
            return AppStyles.buildLoadingUI();
          } else if (state is CryptoDetailsLoadedState) {
            return _buildUI(context, bloc);
          }

          return const Center(child: Text("Error"));
        }),
    );
  }

  Widget _buildUI(BuildContext context, CryptoDetailsBloc bloc) {

    return Container(
      padding: safeInsets,
      color: AppColors.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(7),
                height: 50,
                width: 50,
                child: IconButton(
                    onPressed: () => _backButtonPressed(context),
                    icon: Icon(Icons.arrow_back_ios,
                        size: 30, color: AppColors.textColor)),
              ),
              Expanded(
                  child: Center(
                      child: SizedBox(
                          height: 100,
                          width: 100,
                          child: RoundedNetworkImage(
                              borderRadius: BorderRadius.circular(30),
                              imageUrl: bloc
                                  .detailedCryptoCurrency.image!.large)))),
              
              FavoriteIconButton(
                isFavorite: false,
                favoritePressed: (isFavorite) {
                  bloc.add(CryptoAddedToFavoriteEvent(cryptoCurrency: bloc.cryptoCurrency));
              },)
            ],
          ),
          
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.all(10),
                child: Text("#${bloc.rank} ${bloc.detailedCryptoCurrency.name!}", style: AppStyles.h1TextStyle()),
              ),
              
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(AppLocalizations.of(context).price(bloc.fiatCurrency), style: AppStyles.secondaryTextStyle(), textAlign: TextAlign.left),
                          Text("${bloc.price} ${bloc.fiatCurrency}", style: AppStyles.normalTextStyle(), textAlign: TextAlign.left)
                        ],
                      ),
                    ),
                  ),
                  
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppLocalizations.of(context).ath(bloc.fiatCurrency), style: AppStyles.secondaryTextStyle(), textAlign: TextAlign.left),
                          Text("${bloc.ath} ${bloc.fiatCurrency}", style: AppStyles.normalTextStyle(), textAlign: TextAlign.left)
                        ],
                      ),
                    ),
                  )
                ],
              ),

              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Expanded(
                  child: Container(
                    height: 300,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(5),
                    child: Text(bloc.cryptoDescription, style: AppStyles.secondaryTextStyle(), textAlign: TextAlign.center)),
                ),
              )
            ],)
        ],
      ),
    );
  }

  void _backButtonPressed(BuildContext context) async {
    Navigator.of(context).pop();
  }
}
