import 'package:crypto_currency_monitor/ui/app_colors.dart';
import 'package:crypto_currency_monitor/ui/pages/crypto_currency_details_page.dart';
import 'package:crypto_currency_monitor/ui/pages/shared/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../blocs/crypto_details/crypto_details_bloc.dart';
import '../../blocs/crypto_list/crypto_list_bloc.dart';
import '../../blocs/crypto_list/fiat_option_cubit/fiat_option_cubit.dart';
import '../../data/crypto_currency.dart';
import '../../infrastructure_services/shared/base_coin_geko_api_client.dart';
import '../../service_locator.dart';
import '../app_styles.dart';
import '../components/crypto_list_item_component.dart';
import '../views/rounded_network_image.dart';

class CryptoListPage extends BasePage<CryptoListBloc> {
  late EdgeInsets safeInsets;

  CryptoListPage({super.key});

  @override
  Widget build(BuildContext context) {

    super.build(context);

    return Scaffold(
      body: BlocBuilder<CryptoListBloc, CryptoListState>(
        builder: (context, state) {

          if (state is CryptoListInitState ||
              state is CryptoListLoadingState) {
            return AppStyles.buildLoadingUI();
          } else if (state is CryptoListLoadedState) {
            return _buildUI(context, bloc, state);
          }

        return const Center(child: Text("Error"));
      },
    ));
  }

  Widget _buildUI(BuildContext context, CryptoListBloc bloc, 
    CryptoListLoadedState state) {
    return Container(
        padding: safeInsets,
        color: AppColors.backgroundColor,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _createTitleView(context, bloc),
              _createBody(context, bloc, state)
            ]));
  }

  Widget _createTitleView(BuildContext context, CryptoListBloc bloc) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: Text(AppLocalizations.of(context).marketCap,
                    style: AppStyles.h1TextStyle()))),
        Container(
            width: 70,
            margin: const EdgeInsets.fromLTRB(5, 0, 10, 0),
            child: BlocBuilder<FiatOptionCubit, FiatOptionCubitState>(
              builder: (context, snapshot) {
                return DropdownButton<String>(
                  value: snapshot.fiatCurrency != ""
                      ? snapshot.fiatCurrency
                      : bloc.fiatCurrencies.first,
                  items: bloc.fiatCurrencies
                      .map((cur) =>
                          DropdownMenuItem(value: cur, child: Text(cur)))
                      .toList(),
                  onChanged: (fiatCur) {
                    bloc.add(FiatCurrencySelectedEvent(fiatCurrency: fiatCur as String));
                    context.read<FiatOptionCubit>().dropDownSelectionChanged(fiatCur);
                });
              },
            ))
      ],
    );
  }

  Widget _createBody(BuildContext context, CryptoListBloc bloc, 
    CryptoListLoadedState state) {
    return Expanded(
        child: _buildCryptoListView(context, state, bloc));
  }

  Widget _buildCryptoListView(BuildContext context,
      CryptoListLoadedState state, CryptoListBloc bloc) {
    return Stack(children: [

      RefreshIndicator(
        onRefresh: () async {
           bloc.add(RefreshCryptosEvent());
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 43),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 5, right: 5),
                      child: Text("#",
                          style: AppStyles.cryptoListHeaderTextStyle())),
                  Expanded(
                    flex: 2,
                    child: Text(AppLocalizations.of(context).coin,
                        textAlign: TextAlign.center,
                        style: AppStyles.normalTextStyle()),
                  ),
                  Expanded(
                    child: BlocBuilder<FiatOptionCubit, FiatOptionCubitState>(
                      builder: (context, snapshot) {
                        String currency = snapshot.fiatCurrency != ""
                            ? snapshot.fiatCurrency
                            : bloc.fiatCurrencies.first;

                        return Text(
                              AppLocalizations.of(context).price(currency),
                              textAlign: TextAlign.center,
                              style: AppStyles.normalTextStyle(),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Text(AppLocalizations.of(context).marketCap,
                        textAlign: TextAlign.center,
                        style: AppStyles.normalTextStyle()),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: state.cryptos!.length,
              itemBuilder: (context, index) {
                final crypto = state.cryptos[index];
                final rank = index + 1;

                return CryptoListItemComponent(
                    cryptoCurrency: crypto,
                    bloc: bloc,
                    context: context,
                    rank: rank,
                    onCryptoSelected: (crypto, index) =>
                        _cryptoSelected(crypto, index, context));
              },
            ))
          ],
        ),
      ),
      
      // Visibility(
      //   visible: state.isBusy,
      //   child: 
      //     const Center(child: CircularProgressIndicator())
      StreamBuilder(
        stream: bloc.isBusyStream,
        builder: (context, snapshot) {
          return Visibility(
            visible: snapshot.data ?? false,
            child: 
            const Center(child: CircularProgressIndicator()));
        },
      )
    ]);
  }

  Future _cryptoSelected(
      CryptoCurrency cryptoCurrency, int index, BuildContext context) async {
    // bloc.cryptoCurrencySelected(cryptoCurrency, index);
    var bloc = context.read<CryptoListBloc>();
    var cryptoLoadedState = (bloc.state as CryptoListLoadedState);

    cryptoLoadedState.selectedCryptoCurrency = cryptoCurrency;
    cryptoLoadedState.selectedCryptoCurrencyIndex = index;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider<CryptoDetailsBloc>(
          create: (context) {
            return CryptoDetailsBloc(apiClient: getIt.get<BaseCoinGekoAPIClient>())
              ..add(LoadCryptoDetailsEvent(cryptoCurrency: cryptoLoadedState.selectedCryptoCurrency!,
                fiatCurrency: cryptoLoadedState.selectedFiatCurrency));
          },
          child: CryptoCurrencyDetailsPage())
      ),
    );
    
    var cryptoDetailsBloc = BlocProvider.of<CryptoDetailsBloc>(context);

    cryptoDetailsBloc.add(LoadCryptoDetailsEvent(cryptoCurrency: cryptoLoadedState.selectedCryptoCurrency!,
      fiatCurrency: cryptoLoadedState.selectedFiatCurrency));
  }
}
