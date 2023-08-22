
import 'package:crypto_currency_monitor/data/crypto_currency.dart';
import 'package:crypto_currency_monitor/data/detailed_crypto_currency.dart';
import 'package:crypto_currency_monitor/infrastructure_services/shared/base_coin_geko_api_client.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CoinGekoAPIClient implements BaseCoinGekoAPIClient {

  //NOTE: HTTP requests done frequently are better done with one httpclient that keeps the connection alive in Dart
  //Check this reply I got on reddit for more info. https://www.reddit.com/r/flutterhelp/comments/15sv470/which_method_of_making_http_requests_in_flutter/ 
  
  @override
  Future<List<CryptoCurrency>> getCryptoCurrencies(String? fiatCurrency, String languageCode) async {
    var url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=$fiatCurrency&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=$languageCode";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<CryptoCurrency>((json) => CryptoCurrency().fromJson(json)).toList();
    } else {
      throw Exception("Error while making http request to get cryptocurrencies. StatusCode: ${response.statusCode} Message: ${response.reasonPhrase}");
    }
  }

  @override
  Future<DetailedCryptoCurrency> getCryptoCurrencyDetails(String cryptoCurrencyId, String locale) async {
    var url = "https://api.coingecko.com/api/v3/coins/$cryptoCurrencyId?localization=$locale&tickers=false&market_data=true&community_data=false&developer_data=false&sparkline=false";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return DetailedCryptoCurrency().fromJson(parsed);
    } else {
      throw Exception("Error while making http request to get cryptocurrency details. StatusCode: ${response.statusCode} Message: ${response.reasonPhrase}");
    }
  }

}