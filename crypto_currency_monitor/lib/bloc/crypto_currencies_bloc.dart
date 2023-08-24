import 'dart:async';

import 'package:crypto_currency_monitor/bloc/shared/base_bloc.dart';
import 'package:crypto_currency_monitor/data/crypto_currency.dart';
import 'package:rxdart/rxdart.dart';

import '../infrastructure_services/shared/base_coin_geko_api_client.dart';

class CryptoCurrenciesBloc implements BaseBloc {
  
  late String _locale;
  late String _language;

  String get locale => _locale;
  String get language => _language;

  set locale(String locale) {
    _locale = locale;
  }
  set language(String language) {
    _language = language;
  }

  late final BaseCoinGekoAPIClient apiClient;
  List<String> fiatCurrencies = [ "USD", "EUR" ];
  final _fiatCurrencyController = StreamController<String?>();
  final _currenciesController = StreamController<List<CryptoCurrency>?>();
  final _dropDownSelectedOptionController = StreamController<String?>();

  Sink<String?> get fiatCurrencySelection => _fiatCurrencyController.sink;
  Stream<List<CryptoCurrency>?> get cryptoCurrenciesStream => _currenciesController.stream;
  Stream<String?> get dropDownSelectedOptionStream => _dropDownSelectedOptionController.stream;

  CryptoCurrenciesBloc({required BaseCoinGekoAPIClient this.apiClient});

  @override
  Future initialize() {
    _fiatCurrencyController.stream.listen((currency) async {
      if (currency != null) {
        _dropDownSelectedOptionController.sink.add(currency);
        await _loadCurrencies(currency);
      }
    });

    return _loadCurrencies(fiatCurrencies[0]); 
    //Future.value(null); //
    // await Future.delayed(const Duration(seconds: 5));
  }

  Future cryptoCurrencySelected(CryptoCurrency cryptoCurrency) {
    return Future(() => null);
  }

  Future cryptoCurrencyFavoriteTapped(CryptoCurrency cryptoCurrency) {
    return Future(() => null);
  }

  Future _loadCurrencies(String fiatCurrency) async {
    try {
      var currencies = await apiClient.getCryptoCurrencies(fiatCurrency, language);
      _currenciesController.add(currencies);
    } catch (e) {
      _currenciesController.addError(e.toString());
    }
  }
  
  @override
  void dispose() {
    _dropDownSelectedOptionController.close();
    _fiatCurrencyController.close();
    _currenciesController.close();
  }
}