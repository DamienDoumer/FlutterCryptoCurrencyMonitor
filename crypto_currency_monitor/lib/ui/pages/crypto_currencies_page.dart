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
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
            color: Colors.blue,
            padding: EdgeInsets.all(3),
            child: StreamBuilder(
              stream: bloc.cryptoCurrenciesStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return _buildCryptoListView(snapshot.data, bloc);
                } else
                  return Text("Loading...");
              },
            )));
  }

  Widget _buildCryptoListView(
      List<CryptoCurrency>? cryptos, CryptoCurrenciesBloc bloc) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 43),
          color: Colors.red,
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
        ),
        Expanded(
            child: Container(
          color: Colors.black,
          child: ListView.builder(
            padding: EdgeInsets.all(0),
            itemCount: cryptos!.length,
            itemBuilder: (context, index) {
              final crypto = cryptos[index];
              final rank = index + 1;

              return InkWell(
                child: Container(
                color: Colors.brown,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: IconButton(
                            onPressed: () => bloc.cryptoCurrencyFavoriteTapped(crypto),
                            icon: const Icon(Icons.favorite_border,
                                size: 20, color: Colors.red))),
                      SizedBox(
                        width: 30,
                        child: Text(rank.toString(),
                            textAlign: TextAlign.start,
                            style: _cryptoListHeaderTextStyle()),
                      )
                    ]),
                ),
                onTap: () => bloc.cryptoCurrencySelected(crypto),
              );
            },
          ),
        ))
      ],
    );
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
