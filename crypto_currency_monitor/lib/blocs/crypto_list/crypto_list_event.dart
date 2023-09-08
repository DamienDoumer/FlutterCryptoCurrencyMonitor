part of 'crypto_list_bloc.dart';

sealed class CryptoListEvent extends Equatable {
  const CryptoListEvent();

  @override
  List<Object> get props => [];
}

class LoadCryptosEvent extends CryptoListEvent { }

class RefreshCryptosEvent extends CryptoListEvent { }

class CryptoCurrencyAddedToFavoriteEvent extends CryptoListEvent {
  final CryptoCurrency cryptoCurrency;
  final int index;

  const CryptoCurrencyAddedToFavoriteEvent({required this.cryptoCurrency, required this.index});

  @override
  List<Object> get props => [cryptoCurrency];
}

class CryptoCurrencyRemovedFromFavoriteEvent extends CryptoListEvent {
  final CryptoCurrency cryptoCurrency;
  final int index;

  const CryptoCurrencyRemovedFromFavoriteEvent({required this.cryptoCurrency,
  required this.index});

  @override
  List<Object> get props => [cryptoCurrency];
}
