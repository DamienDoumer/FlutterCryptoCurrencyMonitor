import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_currency_monitor/data/crypto_currency.dart';
import 'package:equatable/equatable.dart';

import '../../bloc/constants.dart';
import '../../bloc/shared/base_bloc.dart';
import '../../infrastructure_services/shared/base_coin_geko_api_client.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> with BaseBloc {

  late String locale;
  late String language;

  late final BaseCoinGekoAPIClient apiClient;
  List<String> fiatCurrencies = [ Constants.USDCode, Constants.EURCode ];
    
  CryptoListBloc({required this.apiClient}) 
    : super(CryptoListInitState()) {

    on<LoadCryptosEvent>(_onLoadCryptos);
    on<RefreshCryptosEvent>(_onRefreshCryptosEvent);
    on<CryptoCurrencyAddedToFavoriteEvent>(_onCryptoAddedToFavorite);
    on<CryptoCurrencyRemovedFromFavoriteEvent>(_onCryptoRemovedFromFavorite);
    on<FiatCurrencySelectedEvent>(_onFiatCurrencySelected);
  }

  Future _onLoadCryptos(LoadCryptosEvent event, Emitter<CryptoListState> emitter) async {
    //If we're initializing, set the selected currency to this state.
    var selectedFiatCurrency = fiatCurrencies.first;

    try {

      isBusySink.add(true);

      var cryptoCurrencies = await apiClient.getCryptoCurrencies(selectedFiatCurrency, language);
      var cryptoLoadedState = CryptoListLoadedState(cryptos: cryptoCurrencies,
        selectedFiatCurrency: fiatCurrencies.first);
      emitter(cryptoLoadedState);
      //_currenciesController.add(_cryptoCurrencies);
    } catch (e) {
      
      emitter(CryptoListLoadErrorState(error: e.toString()));
    } finally {
      isBusySink.add(false);
    }
  }

  Future _onCryptoAddedToFavorite(CryptoCurrencyAddedToFavoriteEvent event, Emitter<CryptoListState> emitter) async {

  }

  Future _onFiatCurrencySelected(FiatCurrencySelectedEvent event, Emitter<CryptoListState> emitter) async {    

    isBusySink.add(true);

    var cryptoCurrencies = await apiClient.getCryptoCurrencies(event.fiatCurrency, language);
    
    isBusySink.add(false);

    emitter((state as CryptoListLoadedState)
      .copyWith(
        cryptos: cryptoCurrencies,
        selectedFiatCurrency: event.fiatCurrency));
  }

  Future _onRefreshCryptosEvent(RefreshCryptosEvent event, Emitter<CryptoListState> emitter) async {
    
    isBusySink.add(true);

    var cryptoCurrencies = await apiClient.getCryptoCurrencies((state as CryptoListLoadedState).selectedFiatCurrency, language);

    isBusySink.add(false);
    
    emitter((state as CryptoListLoadedState)
      .copyWith(
        cryptos: cryptoCurrencies));
  }

  Future _onCryptoRemovedFromFavorite(CryptoCurrencyRemovedFromFavoriteEvent event, Emitter<CryptoListState> emitter) async {

  }

  @override
  Future<void> close() {

    super.closeStream();
    return super.close();
  }
}
