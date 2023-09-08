part of 'crypto_list_bloc.dart';

sealed class CryptoListEvent extends Equatable {
  const CryptoListEvent();

  @override
  List<Object> get props => [];
}

class LoadCryptosEvent extends CryptoListEvent { }

class CryptoCurrencyAddedToFavoriteEvent extends CryptoListEvent {
  final CryptoCurrency cryptoCurrency;

  const CryptoCurrencyAddedToFavoriteEvent({required this.cryptoCurrency});

  @override
  List<Object> get props => [cryptoCurrency];
}

class CryptoCurrencyRemovedFromFavoriteEvent extends CryptoListEvent {
  final CryptoCurrency cryptoCurrency;

  const CryptoCurrencyRemovedFromFavoriteEvent({required this.cryptoCurrency});

  @override
  List<Object> get props => [cryptoCurrency];
}
