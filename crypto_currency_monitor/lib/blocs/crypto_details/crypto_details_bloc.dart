import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_currency_monitor/bloc/shared/base_bloc.dart';
import 'package:crypto_currency_monitor/data/crypto_currency.dart';
import 'package:equatable/equatable.dart';

import '../../data/detailed_crypto_currency.dart';
import '../../infrastructure_services/shared/base_coin_geko_api_client.dart';

part 'crypto_details_event.dart';
part 'crypto_details_state.dart';

class CryptoDetailsBloc extends Bloc<CryptoDetailsEvent, CryptoDetailsState> with BaseBloc {
  
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
  
  CryptoDetailsBloc({required this.apiClient}) : super(CryptoDetailsInitState()) {
    on<LoadCryptoDetailsEvent>(_onLoadCryptoDetailsEvent);
    on<CryptoAddedToFavoriteEvent>(_onCryptoAddedToFavoriteEvent);
  }

  Future _onLoadCryptoDetailsEvent(LoadCryptoDetailsEvent event, Emitter<CryptoDetailsState> emitter) async {

    try {
      cryptoCurrency = event.cryptoCurrency;
      fiatCurrency = event.fiatCurrency as String;
      
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
      
      emitter(CryptoDetailsLoadedState(detailedCryptoCurrency: detailedCryptoCurrency));
      // var priceMap = detailedCryptoCurrency.marketData?.currentPrice.entries.firstWhere((element) => element.key.toLowerCase() == 'aud');
      // var athMap = detailedCryptoCurrency.marketData?.ath.entries.firstWhere((element) => element.key.toLowerCase() == 'aud');
      // var marketCapMap = detailedCryptoCurrency.marketData?.marketCap.entries.firstWhere((element) => element.key.toLowerCase() == 'aud');

    } catch (e) {
      emitter(CryptoDetailsLoadErrorState(error: e.toString()));
    }
  }

  Future _onCryptoAddedToFavoriteEvent(CryptoAddedToFavoriteEvent event, Emitter<CryptoDetailsState> emitter) async {

  }

  @override
  Future<void> close() {
    super.closeStream();
    return super.close();
  }
}
