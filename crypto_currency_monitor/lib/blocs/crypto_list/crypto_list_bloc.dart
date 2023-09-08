import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_currency_monitor/data/crypto_currency.dart';
import 'package:equatable/equatable.dart';

import '../../bloc/constants.dart';
import '../../infrastructure_services/shared/base_coin_geko_api_client.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {

  late String locale;
  late String language;

  late final BaseCoinGekoAPIClient apiClient;
  late String selectedFiatCurrency;
  List<String> fiatCurrencies = [ Constants.USDCode, Constants.EURCode ];
  
  final _fiatCurrencyController = StreamController<String?>();
  final _currenciesController = StreamController<List<CryptoCurrency>?>();
  final _fiatCurrencySelectedOptionController = StreamController<String?>.broadcast();
  final _favoriteController = StreamController<(int, bool)>.broadcast();
  final busyController = StreamController<bool>();

  Sink<String?> get fiatCurrencySelection => _fiatCurrencyController.sink;
  Stream<List<CryptoCurrency>?> get cryptoCurrenciesStream => _currenciesController.stream;
  Stream<String?> get fiatCurrencySelectedOptionStream => _fiatCurrencySelectedOptionController.stream;
  Stream<(int, bool)> get favoriteStream => _favoriteController.stream;
  Stream<bool> get isBusyStream => busyController.stream;

  
  CryptoListBloc({required this.apiClient}) 
    : super(CryptoListInitState()) {

    on<LoadCryptosEvent>(_onLoadCryptos);
    on<RefreshCryptosEvent>(_onRefreshCryptosEvent);
    on<CryptoCurrencyAddedToFavoriteEvent>(_onCryptoAddedToFavorite);
    on<CryptoCurrencyRemovedFromFavoriteEvent>(_onCryptoRemovedFromFavorite);
  }

  Future _onLoadCryptos(LoadCryptosEvent event, Emitter<CryptoListState> emitter) async {
    
    //If we're initializing, set the selected currency to this state.
    if (state is CryptoListInitState) {
      selectedFiatCurrency = fiatCurrencies.first;
    }

    try {
      //busyController.add(true);
      var cryptoCurrencies = await apiClient.getCryptoCurrencies(selectedFiatCurrency, language);
      emitter(CryptoListLoadedState(cryptos: cryptoCurrencies));
      //_currenciesController.add(_cryptoCurrencies);
    } catch (e) {
      
      emitter(CryptoListLoadErrorState(error: e.toString()));
    } finally {
      //busyController.add(false);
    }
  }

  Future _onCryptoAddedToFavorite(CryptoCurrencyAddedToFavoriteEvent event, Emitter<CryptoListState> emitter) async {

  }

  Future _onRefreshCryptosEvent(RefreshCryptosEvent event, Emitter<CryptoListState> emitter) async {

  }

  Future _onCryptoRemovedFromFavorite(CryptoCurrencyRemovedFromFavoriteEvent event, Emitter<CryptoListState> emitter) async {

  }

}
