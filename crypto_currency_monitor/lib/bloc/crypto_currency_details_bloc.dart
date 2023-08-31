
import 'dart:async';

import 'package:crypto_currency_monitor/bloc/shared/base_bloc.dart';
import 'package:crypto_currency_monitor/data/crypto_currency.dart';

import '../data/detailed_crypto_currency.dart';
import '../infrastructure_services/shared/base_coin_geko_api_client.dart';

class CryptoCurrencyDetailsBloc implements BaseBloc {
  
  late String _locale;
  late String _language;
  bool _isFavorite = false;

  late String fiatCurrency;
  late CryptoCurrency cryptoCurrency;
  late final BaseCoinGekoAPIClient apiClient;
  late DetailedCryptoCurrency detailedCryptoCurrency;

  String get locale => _locale;
  String get language => _language;

  set locale(String locale) {
    _locale = locale;
  }
  set language(String language) {
    _language = language;
  }

  final _favoriteController = StreamController<bool>();
  final _currencyDetailsController = StreamController<DetailedCryptoCurrency>();

  Stream<bool> get favoriteStream => _favoriteController.stream;

  CryptoCurrencyDetailsBloc({required BaseCoinGekoAPIClient this.apiClient,
    required this.cryptoCurrency, required this.fiatCurrency});

  @override
  void dispose() {
    _favoriteController.close();
    _currencyDetailsController.close();
  }

  @override
  Future initialize() async {
    try {
      _isFavorite = cryptoCurrency.isFavorite;
      detailedCryptoCurrency = await apiClient.getCryptoCurrencyDetails(cryptoCurrency.id!, locale);
    } catch (e) {
      _currencyDetailsController.addError(e);
    }
  }

  Future favoriteTapped() async {
    cryptoCurrency.isFavorite = !_isFavorite;
    _isFavorite = !_isFavorite;
    _favoriteController.add(_isFavorite);
  }
}