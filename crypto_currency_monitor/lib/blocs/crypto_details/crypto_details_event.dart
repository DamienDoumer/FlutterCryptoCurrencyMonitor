part of 'crypto_details_bloc.dart';

sealed class CryptoDetailsEvent extends Equatable {
  const CryptoDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadCryptoDetailsEvent extends CryptoDetailsEvent {
  final CryptoCurrency cryptoCurrency;
  final String? fiatCurrency;

  const LoadCryptoDetailsEvent({required this.cryptoCurrency, 
   required this.fiatCurrency});
}

class CryptoAddedToFavoriteEvent extends CryptoDetailsEvent {
  final CryptoCurrency cryptoCurrency;

  const CryptoAddedToFavoriteEvent({required this.cryptoCurrency});
}