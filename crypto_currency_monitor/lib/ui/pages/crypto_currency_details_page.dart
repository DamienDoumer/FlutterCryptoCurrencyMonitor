

import 'package:crypto_currency_monitor/ui/pages/shared/base_page.dart';
import 'package:flutter/material.dart';

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  child: IconButton(
                    onPressed: bloc.backButtonPressed, 
                    icon: Icon(Icons.arrow_back_ios,
                    size: 20, color: AppColors.likeButtonColor)),
                ),

                  Expanded(child: 
                    Container()
                  ),
              ],
            )
          ],
        ),
    );
  }
}