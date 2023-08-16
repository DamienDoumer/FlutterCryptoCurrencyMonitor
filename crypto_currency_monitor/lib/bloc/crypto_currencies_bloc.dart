

import 'dart:async';

import 'package:crypto_currency_monitor/bloc/shared/base_bloc.dart';
import 'package:crypto_currency_monitor/data/crypto_currency.dart';
import 'package:rxdart/rxdart.dart';

import '../infrastructure_services/shared/base_coin_geko_api_client.dart';

class CryptoCurrenciesBloc implements BaseBloc {
  
  late BaseCoinGekoAPIClient _apiClient;
  List<String> fiatCurrencies = [ "USD", "EUR" ];
  final _fiatCurrencyController = StreamController<String?>();
  Sink<String?> get fiatCurrencySelection => _fiatCurrencyController.sink;
  late Stream<List<CryptoCurrency>?> cryptoCurrenciesStream;

  CryptoCurrenciesBloc(BaseCoinGekoAPIClient apiClient) {
    _apiClient = apiClient;
  }

  @override
  Future initialize() async {
    // cryptoCurrenciesStream = _fiatCurrencyController.stream
    //   .startWith(fiatCurrencies[0])
      

    await Future.delayed(const Duration(seconds: 5));
  }
  
  @override
  void dispose() {

  }
  
}