part of 'crypto_details_bloc.dart';

sealed class CryptoDetailsEvent extends Equatable {
  const CryptoDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadCryptoDetailsEvent extends CryptoDetailsEvent {
  final CryptoCurrency cryptoCurrency;

  const LoadCryptoDetailsEvent({required this.cryptoCurrency});
}