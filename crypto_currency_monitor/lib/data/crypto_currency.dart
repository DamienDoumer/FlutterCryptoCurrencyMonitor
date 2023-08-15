
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
 part 'crypto_currency.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CryptoCurrency {
  String? id;
  String? symbol;
  String? name;
  String? image;
  int? currentPrice;
  int? marketCap;
  int? marketCapRank;
  int? fullyDilutedValuation;
  int? totalVolume;
  int? high24h;
  int? low24h;
  double? priceChange24h;
  double? priceChangePercentage24h;
  double? marketCapChange24h;
  double? marketCapChangePercentage24h;
  int? circulatingSupply;
  int? totalSupply;
  int? maxSupply;
  int? ath;
  double? athChangePercentage;
  String? athDate;
  double? atl;
  double? atlChangePercentage;
  String? atlDate;
  String? lastUpdated;

  CryptoCurrency(
      {this.id,
      this.symbol,
      this.name,
      this.image,
      this.currentPrice,
      this.marketCap,
      this.marketCapRank,
      this.fullyDilutedValuation,
      this.totalVolume,
      this.high24h,
      this.low24h,
      this.priceChange24h,
      this.priceChangePercentage24h,
      this.marketCapChange24h,
      this.marketCapChangePercentage24h,
      this.circulatingSupply,
      this.totalSupply,
      this.maxSupply,
      this.ath,
      this.athChangePercentage,
      this.athDate,
      this.atl,
      this.atlChangePercentage,
      this.atlDate,
      this.lastUpdated});

  String toJson() {
    Map<String, dynamic> curMap = _$CryptoCurrencyToJson(this);
    var json = jsonEncode(curMap);
    return json;
  }

  CryptoCurrency fromJson(Map<String, dynamic> map){
    return _$CryptoCurrencyFromJson(map);
  }

  // CryptoCurrency.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   symbol = json['symbol'];
  //   name = json['name'];
  //   image = json['image'];
  //   currentPrice = json['current_price'];
  //   marketCap = json['market_cap'];
  //   marketCapRank = json['market_cap_rank'];
  //   fullyDilutedValuation = json['fully_diluted_valuation'];
  //   totalVolume = json['total_volume'];
  //   high24h = json['high_24h'];
  //   low24h = json['low_24h'];
  //   priceChange24h = json['price_change_24h'];
  //   priceChangePercentage24h = json['price_change_percentage_24h'];
  //   marketCapChange24h = json['market_cap_change_24h'];
  //   marketCapChangePercentage24h = json['market_cap_change_percentage_24h'];
  //   circulatingSupply = json['circulating_supply'];
  //   totalSupply = json['total_supply'];
  //   maxSupply = json['max_supply'];
  //   ath = json['ath'];
  //   athChangePercentage = json['ath_change_percentage'];
  //   athDate = json['ath_date'];
  //   atl = json['atl'];
  //   atlChangePercentage = json['atl_change_percentage'];
  //   atlDate = json['atl_date'];
  //   lastUpdated = json['last_updated'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = id;
  //   data['symbol'] = symbol;
  //   data['name'] = name;
  //   data['image'] = image;
  //   data['current_price'] = currentPrice;
  //   data['market_cap'] = marketCap;
  //   data['market_cap_rank'] = marketCapRank;
  //   data['fully_diluted_valuation'] = fullyDilutedValuation;
  //   data['total_volume'] = totalVolume;
  //   data['high_24h'] = high24h;
  //   data['low_24h'] = low24h;
  //   data['price_change_24h'] = priceChange24h;
  //   data['price_change_percentage_24h'] = priceChangePercentage24h;
  //   data['market_cap_change_24h'] = marketCapChange24h;
  //   data['market_cap_change_percentage_24h'] =
  //       marketCapChangePercentage24h;
  //   data['circulating_supply'] = circulatingSupply;
  //   data['total_supply'] = totalSupply;
  //   data['max_supply'] = maxSupply;
  //   data['ath'] = ath;
  //   data['ath_change_percentage'] = athChangePercentage;
  //   data['ath_date'] = athDate;
  //   data['atl'] = atl;
  //   data['atl_change_percentage'] = atlChangePercentage;
  //   data['atl_date'] = atlDate;
  //   data['last_updated'] = lastUpdated;
  //   return data;
  // }
}