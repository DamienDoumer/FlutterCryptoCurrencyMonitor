

import 'package:flutter/material.dart';

import '../../bloc/crypto_currency_details_bloc.dart';
import '../../bloc/shared/bloc_provider.dart';

class CryptoCurrencyDetailsPage extends StatelessWidget {

  CryptoCurrencyDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.of<CryptoCurrencyDetailsBloc>(context);
    var localization = Localizations.localeOf(context);
    bloc.locale = localization.toString();
    bloc.language = localization.languageCode;
    
    return Scaffold(
      body: FutureBuilder(
        future: bloc.initialize(),
        builder: (context, snapshot) {
          
        },
      ),
    )
  }

}