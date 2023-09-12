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
  List<CryptoCurrency> cryptos;
  late String? selectedFiatCurrency;
  late CryptoCurrency? selectedCryptoCurrency;
  late int selectedCryptoCurrencyIndex;

  CryptoListLoadedState({required this.cryptos,
    required this.selectedFiatCurrency}){
      selectedCryptoCurrencyIndex = 0;
    }

  CryptoListLoadedState copyWith({
    List<CryptoCurrency>? cryptos,
    String? selectedFiatCurrency,
    CryptoCurrency? selectedCryptoCurrency,
    int? selectedCryptoCurrencyIndex
  }) {
    var newObject = CryptoListLoadedState(
      cryptos: cryptos ?? this.cryptos,
      selectedFiatCurrency: selectedFiatCurrency ?? this.selectedFiatCurrency);

      newObject.selectedCryptoCurrencyIndex = selectedCryptoCurrencyIndex 
        ?? this.selectedCryptoCurrencyIndex;
      newObject.selectedCryptoCurrency = selectedCryptoCurrency 
        ?? this.selectedCryptoCurrency;
      
      return newObject;
  }

  @override
  List<Object> get props => [cryptos, 
    selectedCryptoCurrencyIndex];
}
