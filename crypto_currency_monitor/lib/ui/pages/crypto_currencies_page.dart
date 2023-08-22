import 'package:crypto_currency_monitor/ui/app_colors.dart';
import 'package:flutter/material.dart';

import '../../bloc/crypto_currencies_bloc.dart';
import '../../bloc/shared/bloc_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CryptoCurrenciesPage extends StatelessWidget {
  const CryptoCurrenciesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CryptoCurrenciesBloc>(context);
    var localization = Localizations.localeOf(context);
    bloc.locale = localization.toString();
    bloc.language = localization.languageCode;

    return Scaffold(
        body: FutureBuilder(
      future: bloc.initialize(),
      builder: (context, snapShot) {
        if (snapShot.connectionState == ConnectionState.done) {
          return _buildUI(context, bloc);
        } else {
          return _buildLoadingUI();
        }
      },
    ));
  }

  Widget _buildUI(BuildContext context, CryptoCurrenciesBloc bloc) {
    final topPadding = MediaQuery.of(context).padding.top;
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Container(
        padding: EdgeInsets.fromLTRB(0, topPadding, 0, bottomPadding),
        color: AppColors.backgroundColor,
        child: Column(
          children: [
            _createTitleView(context, bloc),
            _createBody()
        ]));
  }

  Widget _createTitleView(BuildContext context, CryptoCurrenciesBloc bloc) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(AppLocalizations.of(context).marketCap, 
              style: _h1TextStyle())
        )),
        Container(
          width: 70,
          margin: const EdgeInsets.fromLTRB(5, 0, 10, 0),
            child: StreamBuilder(
              stream: bloc.dropDownSelectedOptionStream,
              builder: (context, snapshot) {
                return DropdownButton<String>(
                  value: snapshot.hasData ? snapshot.data : bloc.fiatCurrencies.first,
                  items: bloc.fiatCurrencies
                      .map(
                          (cur) => DropdownMenuItem(value: cur, child: Text(cur)))
                      .toList(),
                  onChanged: (fiatCur) =>
                      _fiatCurrencyDropDownSelected(fiatCur, bloc));
              },
            )
        )
      ],
    );
  }

  Widget _createBody() {
    return Expanded(child: 
      Container(color: Colors.blue, child: Center(child: Text("Body"))));
  }

  Widget _buildLoadingUI() {
    return const Center(child: Text("Loading..."));
  }

  TextStyle _h1TextStyle() {
    return TextStyle(
      color: AppColors.textColor,
      fontSize: 20
    );
  }

  void _fiatCurrencyDropDownSelected(
      String? fiatCurrency, CryptoCurrenciesBloc bloc) {
    bloc.fiatCurrencySelection.add(fiatCurrency);
  }
}
