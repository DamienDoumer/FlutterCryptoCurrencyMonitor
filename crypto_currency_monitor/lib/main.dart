import 'dart:io';

import 'package:crypto_currency_monitor/blocs/blocs.dart';
import 'package:crypto_currency_monitor/service_locator.dart';
import 'package:crypto_currency_monitor/simple_bloc_observer.dart';
import 'package:crypto_currency_monitor/ui/app_colors.dart';
import 'package:crypto_currency_monitor/ui/pages/crypto_currencies_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'infrastructure_services/shared/base_coin_geko_api_client.dart';

void main() {
  setup();
  Bloc.observer = const SimpleBlocObserver();
  runApp(const CryptoCurrencyApp());
}

class CryptoCurrencyApp extends StatelessWidget {
  const CryptoCurrencyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(
          create: (context) => CryptoListBloc(
            apiClient: getIt.get<BaseCoinGekoAPIClient>())
            ..add(LoadCryptosEvent())),

        BlocProvider(create: (context) => 
          CryptoDetailsBloc(apiClient: getIt.get<BaseCoinGekoAPIClient>()))

      ],
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