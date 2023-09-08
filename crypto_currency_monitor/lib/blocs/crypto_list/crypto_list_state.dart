part of 'crypto_list_bloc.dart';

sealed class CryptoListState extends Equatable {
  const CryptoListState();
  
  @override
  List<Object> get props => [];
}

final class CryptoListInitState extends CryptoListState {}

final class CryptoListLoadingState extends CryptoListState {}

final class CryptoListLoadErrorState extends CryptoListState {
  final String error;

  const CryptoListLoadErrorState({required this.error});
  
  @override
  List<Object> get props => [error];
}

final class CryptoListLoadedState extends CryptoListState {
  final List<CryptoCurrency> cryptos;

  const CryptoListLoadedState({this.cryptos = const<CryptoCurrency>[]});

  @override
  List<Object> get props => [cryptos];
}
