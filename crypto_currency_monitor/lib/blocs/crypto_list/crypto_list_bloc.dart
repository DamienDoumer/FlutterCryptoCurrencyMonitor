import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:crypto_currency_monitor/data/crypto_currency.dart';
import 'package:equatable/equatable.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc() : super(CryptoListInitState()) {
    on<LoadCryptosEvent>(_onLoadCryptos);
    on<CryptoCurrencyAddedToFavoriteEvent>(_onCryptoAddedToFavorite);
    on<CryptoCurrencyRemovedFromFavoriteEvent>(_onCryptoRemovedFromFavorite);
  }

  void _onLoadCryptos(LoadCryptosEvent event, Emitter<CryptoListState> emitter) {

  }

  void _onCryptoAddedToFavorite(CryptoCurrencyAddedToFavoriteEvent event, Emitter<CryptoListState> emitter) {

  }

  void _onCryptoRemovedFromFavorite(CryptoCurrencyRemovedFromFavoriteEvent event, Emitter<CryptoListState> emitter) {

  }
}
