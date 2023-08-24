
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
    // var url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=$fiatCurrency&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=$languageCode";
    // var response = await http.get(Uri.parse(url));

    // if (response.statusCode == 200) {
    //   final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    //   return parsed.map<CryptoCurrency>((json) => CryptoCurrency().fromJson(json)).toList();
    // } else {
    //   throw Exception("Error while making http request to get cryptocurrencies. StatusCode: ${response.statusCode} Message: ${response.reasonPhrase}");
    // }

    var fakeJson = "\r\n  [  {\r\n        \"id\": \"bitcoin\",\r\n        \"symbol\": \"btc\",\r\n        \"name\": \"Bitcoin\",\r\n        \"image\": \"https:\/\/assets.coingecko.com\/coins\/images\/1\/large\/bitcoin.png?1547033579\",\r\n        \"current_price\": 26467,\r\n        \"market_cap\": 515277232271,\r\n        \"market_cap_rank\": 1,\r\n        \"fully_diluted_valuation\": 555869267921,\r\n        \"total_volume\": 5775439083,\r\n        \"high_24h\": 26668,\r\n        \"low_24h\": 25816,\r\n        \"price_change_24h\": 435.33,\r\n        \"price_change_percentage_24h\": 1.67227,\r\n        \"market_cap_change_24h\": 8901300543,\r\n        \"market_cap_change_percentage_24h\": 1.75784,\r\n        \"circulating_supply\": 19466487.0,\r\n        \"total_supply\": 21000000.0,\r\n        \"max_supply\": 21000000.0,\r\n        \"ath\": 69045,\r\n        \"ath_change_percentage\": -61.63826,\r\n        \"ath_date\": \"2021-11-10T14:24:11.849Z\",\r\n        \"atl\": 67.81,\r\n        \"atl_change_percentage\": 38960.85526,\r\n        \"atl_date\": \"2013-07-06T00:00:00.000Z\",\r\n        \"roi\": null,\r\n        \"last_updated\": \"2023-08-24T09:37:57.550Z\"\r\n    },\r\n    {\r\n        \"id\": \"ethereum\",\r\n        \"symbol\": \"eth\",\r\n        \"name\": \"Ethereum\",\r\n        \"image\": \"https:\/\/assets.coingecko.com\/coins\/images\/279\/large\/ethereum.png?1595348880\",\r\n        \"current_price\": 1670.88,\r\n        \"market_cap\": 200913949346,\r\n        \"market_cap_rank\": 2,\r\n        \"fully_diluted_valuation\": 200913949346,\r\n        \"total_volume\": 7979604792,\r\n        \"high_24h\": 1689.23,\r\n        \"low_24h\": 1636.16,\r\n        \"price_change_24h\": 25.89,\r\n        \"price_change_percentage_24h\": 1.5737,\r\n        \"market_cap_change_24h\": 3264926375,\r\n        \"market_cap_change_percentage_24h\": 1.65188,\r\n        \"circulating_supply\": 120214161.666801,\r\n        \"total_supply\": 120214161.666801,\r\n        \"max_supply\": null,\r\n        \"ath\": 4878.26,\r\n        \"ath_change_percentage\": -65.71325,\r\n        \"ath_date\": \"2021-11-10T14:24:19.604Z\",\r\n        \"atl\": 0.432979,\r\n        \"atl_change_percentage\": 386199.94051,\r\n        \"atl_date\": \"2015-10-20T00:00:00.000Z\",\r\n        \"roi\": {\r\n            \"times\": 83.40058161399985,\r\n            \"currency\": \"btc\",\r\n            \"percentage\": 8340.058161399986\r\n        },\r\n        \"last_updated\": \"2023-08-24T09:37:58.110Z\"\r\n    }\r\n]";
    
    final parsed = json.decode(fakeJson).cast<Map<String, dynamic>>();
    // final List<Map<String, dynamic>> jsonList = json.decode(jsonString);
    return parsed.map<CryptoCurrency>((json) => CryptoCurrency().fromJson(json)).toList();
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