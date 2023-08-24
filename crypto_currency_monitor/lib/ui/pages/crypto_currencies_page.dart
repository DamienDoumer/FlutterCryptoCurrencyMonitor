import 'package:crypto_currency_monitor/ui/app_colors.dart';
import 'package:flutter/material.dart';

import '../../bloc/crypto_currencies_bloc.dart';
import '../../bloc/shared/bloc_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../data/crypto_currency.dart';

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
            children: [_createTitleView(context, bloc), _createBody(bloc)]));
  }

  Widget _createTitleView(BuildContext context, CryptoCurrenciesBloc bloc) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: Text(AppLocalizations.of(context).marketCap,
                    style: _h1TextStyle()))),
        Container(
            width: 70,
            margin: const EdgeInsets.fromLTRB(5, 0, 10, 0),
            child: StreamBuilder(
              stream: bloc.dropDownSelectedOptionStream,
              builder: (context, snapshot) {
                return DropdownButton<String>(
                    value: snapshot.hasData
                        ? snapshot.data
                        : bloc.fiatCurrencies.first,
                    items: bloc.fiatCurrencies
                        .map((cur) =>
                            DropdownMenuItem(value: cur, child: Text(cur)))
                        .toList(),
                    onChanged: (fiatCur) =>
                        _fiatCurrencyDropDownSelected(fiatCur, bloc));
              },
            ))
      ],
    );
  }

  Widget _createBody(CryptoCurrenciesBloc bloc) {
    return Expanded(
        child: Container(
            padding: EdgeInsets.all(5),
            child: StreamBuilder(
              stream: bloc.cryptoCurrenciesStream,
              builder: (context, snapshot) {
                return ListView(
                  children: _cryptoListChildren([]),
                );
              },
            )));
  }

  //TODO: Use a listview builder to build your list views.
  // Widget _buildCryptoListView(List<CryptoCurrency> cryptos, CryptoCurrenciesBloc bloc) {
  //   return ListView.builder(
  //     itemCount: cryptos.length,
  //     itemBuilder: (context, index) {

  //     },
  //   )
  // }

  List<Widget> _cryptoListChildren(List<CryptoCurrency>? cryptos) {
    var listItems = <Widget>[];

    if (cryptos == null) return [];

    listItems.add(Container(
      padding: const EdgeInsets.only(left: 43),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              child: Text("#", style: _cryptoListHeaderTextStyle())),
          Expanded(
            child: Text("Bla bla bla",
                textAlign: TextAlign.center,
                style: _cryptoListHeaderTextStyle().copyWith(fontSize: 15)),
          ),
          Expanded(
            child: Text("Bla bla bla",
                textAlign: TextAlign.center,
                style: _cryptoListHeaderTextStyle().copyWith(fontSize: 15)),
          ),
          Expanded(
            child: Text("Bla bla bla",
                textAlign: TextAlign.center,
                style: _cryptoListHeaderTextStyle().copyWith(fontSize: 15)),
          )
        ],
      ),
    ));

    listItems.add(Material(
      color: AppColors.accentColor,
      child: InkWell(
        onTap: () {

        },
        child: Container(
          height: 70,
          // color: Colors.brown,
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
                alignment: Alignment.center,
                width: 40,
                height: 80,
                child: IconButton(
                    onPressed: () {
                      //TODO: Add a press event from the bloc here.
                    },
                    icon: const Icon(Icons.favorite_border,
                        size: 20, color: Colors.red))),

            SizedBox(
              width: 30,
              child: Text("10",
                textAlign: TextAlign.center,
                style: _cryptoListHeaderTextStyle()),
            )
          ]),
        ),
      ),
    ));

    // for (int i = 0; i < cryptos.length; i++) {
    //   listItems.add(Container(
    //     height: 50,
    //     child: Row(children: [
    //       SizedBox(
    //           width: 20,
    //           child: IconButton(
    //               onPressed: () {}, icon: const Icon(Icons.heat_pump_sharp)))
    //     ]),
    //   ));
    // }

    return listItems;
  }

  TextStyle _cryptoListHeaderTextStyle() {
    return TextStyle(color: AppColors.secondaryTextColor, fontSize: 20);
  }

  Widget _buildLoadingUI() {
    return const Center(child: Text("Loading..."));
  }

  TextStyle _h1TextStyle() {
    return TextStyle(color: AppColors.textColor, fontSize: 20);
  }

  void _fiatCurrencyDropDownSelected(
      String? fiatCurrency, CryptoCurrenciesBloc bloc) {
    bloc.fiatCurrencySelection.add(fiatCurrency);
  }
}
