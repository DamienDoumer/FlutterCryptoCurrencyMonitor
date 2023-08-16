import 'package:crypto_currency_monitor/bloc/crypto_currencies_bloc.dart';
import 'package:crypto_currency_monitor/bloc/shared/bloc_provider.dart';
import 'package:crypto_currency_monitor/ui/pages/crypto_currencies_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const CryptoCurrencyApp());
}

class CryptoCurrencyApp extends StatelessWidget {
  const CryptoCurrencyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CryptoCurrenciesBloc>(
      bloc: CryptoCurrenciesBloc(),
      child: MaterialApp(
        title: 'Crypto App',
        home: const CryptoCurrenciesPage(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
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