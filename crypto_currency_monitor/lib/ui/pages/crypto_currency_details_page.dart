import 'package:crypto_currency_monitor/ui/pages/shared/base_page.dart';
import 'package:crypto_currency_monitor/ui/views/rounded_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../bloc/constants.dart';
import '../../bloc/crypto_currency_details_bloc.dart';
import '../app_colors.dart';
import '../app_styles.dart';

class CryptoCurrencyDetailsPage extends BasePage<CryptoCurrencyDetailsBloc> {
  CryptoCurrencyDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: FutureBuilder(
        future: bloc.initialize(),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.done) {
            return _buildUI(context, bloc);
          } else {
            return AppStyles.buildLoadingUI();
          }
        },
      ),
    );
  }

  Widget _buildUI(BuildContext context, CryptoCurrencyDetailsBloc bloc) {

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
              StreamBuilder(
                stream: bloc.favoriteStream,
                builder: (context, snapshot) {

                  var icon = snapshot.hasData && snapshot.data!
                        ? Icons.favorite
                        : Icons.favorite_border;

                  return Container(
                    margin: const EdgeInsets.all(7),
                    height: 50,
                    width: 50,
                    child: IconButton(
                        onPressed: () => bloc.favoriteTapped(),
                        icon: Icon(icon,
                            size: 30, color: AppColors.likeButtonColor)),
                  );
                },
              ),
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

              Container(
                color: Colors.amber,
                child: Text(bloc.cryptoDescription, style: AppStyles.secondaryTextStyle(), textAlign: TextAlign.center))
            ],)
        ],
      ),
    );
  }

  void _backButtonPressed(BuildContext context) async {
    bloc.backButtonPressed();
    Navigator.of(context).pop();
  }
}
