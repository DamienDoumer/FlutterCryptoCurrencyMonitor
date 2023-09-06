import 'dart:io';

import 'package:crypto_currency_monitor/bloc/crypto_currencies_bloc.dart';
import 'package:crypto_currency_monitor/bloc/shared/bloc_provider.dart';
import 'package:crypto_currency_monitor/service_locator.dart';
import 'package:crypto_currency_monitor/ui/app_colors.dart';
import 'package:crypto_currency_monitor/ui/pages/crypto_currencies_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'infrastructure_services/coin_geko_api_client.dart';
import 'infrastructure_services/shared/base_coin_geko_api_client.dart';

void main() {
  setup();
  runApp(const CryptoCurrencyApp());
}

class CryptoCurrencyApp extends StatelessWidget {
  const CryptoCurrencyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CryptoCurrenciesBloc>(
      bloc: CryptoCurrenciesBloc(apiClient: getIt.get<BaseCoinGekoAPIClient>()),
      child: MaterialApp(
        title: 'Crypto App',
        home: CryptoCurrenciesPage(),
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.accentColor),
          useMaterial3: true
        ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('fr'), // French
      ],
      )
    );
  }
}