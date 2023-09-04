
import 'dart:async';

import 'package:crypto_currency_monitor/bloc/shared/base_bloc.dart';
import 'package:crypto_currency_monitor/data/crypto_currency.dart';

import '../data/detailed_crypto_currency.dart';
import '../infrastructure_services/shared/base_coin_geko_api_client.dart';
import 'constants.dart';

class CryptoCurrencyDetailsBloc extends BaseBloc {
  
  bool _isFavorite = false;
  @override
  late String language;  
  @override
  late String locale;
  String cryptoDescription = "";
  String price = "";
  String ath = "";
  String marketCap = "";
  String currency = "";
  num? rank = 0;

  late String fiatCurrency;
  late CryptoCurrency cryptoCurrency;
  late final BaseCoinGekoAPIClient apiClient;
  late DetailedCryptoCurrency detailedCryptoCurrency;

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
    if (isInitialized) {
      return;
    }
    await super.initialize();

    try {
      _isFavorite = cryptoCurrency.isFavorite;
      detailedCryptoCurrency = await apiClient.getCryptoCurrencyDetails(cryptoCurrency.id!, locale);
            
      if (language.toLowerCase() == "fr") {
        cryptoDescription = detailedCryptoCurrency.description!.fr;
      } else {
        cryptoDescription = detailedCryptoCurrency.description!.en;
      }
      
      marketCap = cryptoCurrency.marketCap!.toString();
      price = cryptoCurrency.currentPrice!.toString();
      ath = cryptoCurrency.ath!.toString();
      rank = cryptoCurrency.marketCapRank;
      
      // var priceMap = detailedCryptoCurrency.marketData?.currentPrice.entries.firstWhere((element) => element.key.toLowerCase() == 'aud');
      // var athMap = detailedCryptoCurrency.marketData?.ath.entries.firstWhere((element) => element.key.toLowerCase() == 'aud');
      // var marketCapMap = detailedCryptoCurrency.marketData?.marketCap.entries.firstWhere((element) => element.key.toLowerCase() == 'aud');

    } catch (e) {
      _currencyDetailsController.addError(e);
    }
  }

  void backButtonPressed() {
    
  }

  Future favoriteTapped() async {
    cryptoCurrency.isFavorite = !_isFavorite;
    _isFavorite = !_isFavorite;
    _favoriteController.add(_isFavorite);
  }
}