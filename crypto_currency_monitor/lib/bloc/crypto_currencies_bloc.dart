import 'dart:async';

import 'package:crypto_currency_monitor/bloc/shared/base_bloc.dart';
import 'package:crypto_currency_monitor/data/crypto_currency.dart';

import '../infrastructure_services/shared/base_coin_geko_api_client.dart';
import 'constants.dart';

class CryptoCurrenciesBloc extends BaseBloc {
  
  late String _locale;
  late String _language;
  List<CryptoCurrency> _cryptoCurrencies = [];

  String get locale => _locale;
  String get language => _language;

  set locale(String locale) {
    _locale = locale;
  }
  set language(String language) {
    _language = language;
  }

  late final BaseCoinGekoAPIClient apiClient;
  late String selectedFiatCurrency;

  List<String> fiatCurrencies = [ Constants.USDCode, Constants.EURCode ];
  final _fiatCurrencyController = StreamController<String?>();
  final _currenciesController = StreamController<List<CryptoCurrency>?>();
  final _fiatCurrencySelectedOptionController = StreamController<String?>.broadcast();
  final _favoriteController = StreamController<(int, bool)>.broadcast();

  Sink<String?> get fiatCurrencySelection => _fiatCurrencyController.sink;
  Stream<List<CryptoCurrency>?> get cryptoCurrenciesStream => _currenciesController.stream;
  Stream<String?> get fiatCurrencySelectedOptionStream => _fiatCurrencySelectedOptionController.stream;
  Stream<(int, bool)> get favoriteStream => _favoriteController.stream;

  CryptoCurrenciesBloc({required BaseCoinGekoAPIClient this.apiClient});

  @override
  Future initialize() async {
    if (isInitialized) {
      return;
    }
    await super.initialize();
    _fiatCurrencyController.stream.listen((currency) async {
      if (currency != null) {
        selectedFiatCurrency = currency;
        _fiatCurrencySelectedOptionController.sink.add(currency);
        await _loadCurrencies(currency);
      }
    });

    selectedFiatCurrency = fiatCurrencies[0];
    return _loadCurrencies(fiatCurrencies[0]); 
    //Future.value(null); //
    // await Future.delayed(const Duration(seconds: 5));
  }

  Future cryptoCurrencySelected(CryptoCurrency cryptoCurrency, int index) {
    return Future(() => null);
  }

  Future cryptoCurrencyFavoriteTapped(CryptoCurrency cryptoCurrency, int index) {
    _cryptoCurrencies[index].isFavorite = !_cryptoCurrencies[index].isFavorite ;
    cryptoCurrency.isFavorite = _cryptoCurrencies[index].isFavorite;
    _favoriteController.add((index, cryptoCurrency.isFavorite));

    return Future(() => null);
  }

  Future refreshCurrencies() {
    return _loadCurrencies(selectedFiatCurrency);
  }

  Future _loadCurrencies(String fiatCurrency) async {
    try {
      busyController.add(true);
      _cryptoCurrencies = await apiClient.getCryptoCurrencies(fiatCurrency, language);
      _currenciesController.add(_cryptoCurrencies);
    } catch (e) {
      _currenciesController.addError(e.toString());
    } finally {
      busyController.add(false);
    }
  }
  
  @override
  void dispose() {
    super.dispose();
    _favoriteController.close();
    _fiatCurrencySelectedOptionController.close();
    _fiatCurrencyController.close();
    _currenciesController.close();
  }
}