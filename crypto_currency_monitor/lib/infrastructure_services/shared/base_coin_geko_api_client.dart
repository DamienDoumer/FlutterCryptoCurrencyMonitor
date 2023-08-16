
import 'package:crypto_currency_monitor/data/crypto_currency.dart';
import 'package:crypto_currency_monitor/data/detailed_crypto_currency.dart';

abstract class BaseCoinGekoAPIClient {
  ///Gets the first 100 coin geko coins by market cap
  Future<List<CryptoCurrency>> getCryptoCurrencies(String fiatCurrency, String locale);
  ///Gets the details for a selected crypto currency.
  Future<DetailedCryptoCurrency> getCryptoCurrencyDetails(String cryptoCurrencyId, String locale);
}