part of 'crypto_details_bloc.dart';

sealed class CryptoDetailsState extends Equatable {
  const CryptoDetailsState();
  
  @override
  List<Object> get props => [];
}

final class CryptoDetailsInitState extends CryptoDetailsState {}

final class CryptoDetailsLoadingState extends CryptoDetailsState {}

final class CryptoDetailsLoadErrorState extends CryptoDetailsState {
  final String error;

  const CryptoDetailsLoadErrorState({required this.error});
}

final class CryptoDetailsLoadedState extends CryptoDetailsState {
  final DetailedCryptoCurrency detailedCryptoCurrency;

  const CryptoDetailsLoadedState({required this.detailedCryptoCurrency});
}
